import 'package:dio/dio.dart';
import 'package:innovation/core/http/authenticators/base_authenticator.dart';

@Deprecated("API doesn't support yet")
class SignInWithIdTokenApi extends BaseAuthenticator {
  @override
  Future<Map<String, dynamic>?> getToken(Map<String, dynamic> body, Map<String, dynamic> params) async {
    String idToken = body['id_token'];

    Response<dynamic> response = await super.http.then((http) {
      return http.post("/auth/id_token", data: {
        "id_token": idToken,
      });
    });

    return decodeResponse(response);
  }
}
