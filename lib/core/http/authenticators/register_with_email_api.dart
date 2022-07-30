import 'package:dio/dio.dart';
import 'package:innovation/core/http/authenticators/base_authenticator.dart';

class RegisterWithEmailApi extends BaseAuthenticator {
  @override
  Future<Map<String, dynamic>?> getToken(Map<String, dynamic> body, Map<String, dynamic> params) async {
    String firstName = body['first_name'];
    String lastName = body['last_name'];
    String email = body['email'];
    String password = body['password'];

    Response<dynamic> response = await super.http.then((http) {
      return http.post("auth/register", data: {
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "password": password,
      });
    });

    return decodeResponse(response);
  }
}
