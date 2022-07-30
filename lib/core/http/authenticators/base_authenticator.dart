import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:innovation/core/configs/environments.dart';
import 'package:innovation/core/http/networks/app_token_network.dart';
import 'package:innovation/core/http/networks/base_network.dart';
import 'package:innovation/core/storages/user_token_storage.dart';

abstract class BaseAuthenticator {
  Response<dynamic>? response;
  late UserTokenStorage storage;
  late final BaseNetwork network;

  BaseAuthenticator() {
    final env = Environments.getEnv();
    network = AppTokenNetwork(env.baseUrl);
  }

  Dio? _http;
  Future<Dio> get http async {
    _http ??= await network.build().then((network) => network.http);
    return _http!;
  }

  DioError? _error;
  String? get errorMessage {
    dynamic data = _error?.response?.data;
    if (data is Map) return data['error'];
    return null;
  }

  @protected
  Future<Map<String, dynamic>?> getToken(
    Map<String, dynamic> body,
    Map<String, dynamic> params,
  );

  Future<void> exec({
    required Map<String, dynamic> body,
    required Map<String, dynamic> params,
  }) async {
    try {
      await getToken(body, params);
    } catch (e) {
      if (kDebugMode) print(e);
      if (e is DioError) _error = e;
    }
  }

  Future<void> saveToStorage(Map<String, dynamic> data) async {
    await storage.writeMap(data);
  }

  Map<String, dynamic>? decodeResponse(Response<dynamic> response) {
    dynamic json = response.data;

    if (json is String) {
      try {
        json = jsonDecode(json);
      } catch (e) {
        throw ErrorSummary("decodeResponse(): $e");
      }
    }

    if (json is Map<String, dynamic>) return json;
    return null;
  }
}
