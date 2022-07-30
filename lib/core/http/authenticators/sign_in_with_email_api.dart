import 'package:dio/dio.dart';
import 'package:innovation/core/http/authenticators/base_authenticator.dart';

class SignInWithEmailApi extends BaseAuthenticator {
  @override
  Future<Map<String, dynamic>?> getToken(Map<String, dynamic> body, Map<String, dynamic> params) async {
    String email = body['email'];
    String password = body['password'];

    Response<dynamic> response = await super.http.then((http) {
      return http.post("/auth/login", data: {
        "email": email,
        "password": password,
      });
    });

    return decodeResponse(response);
  }
}
