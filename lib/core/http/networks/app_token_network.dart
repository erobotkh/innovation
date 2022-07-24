import 'package:innovation/core/http/networks/token_network.dart';
import 'package:innovation/core/storages/app_token_storage.dart';

class AppTokenNetwork extends TokenNetwork {
  AppTokenNetwork(super.baseUrl);

  @override
  Future<String?> getAccessToken() async {
    Map<String, dynamic>? result = await AppTokenStorage().readMap();
    return result?['access_token'];
  }
}
