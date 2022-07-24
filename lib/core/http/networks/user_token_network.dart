import 'package:innovation/core/http/networks/token_network.dart';
import 'package:innovation/core/storages/user_token_storage.dart';

class UserTokenNetwork extends TokenNetwork {
  UserTokenNetwork(super.baseUrl);

  @override
  Future<String?> getAccessToken() async {
    Map<String, dynamic>? result = await UserTokenStorage().readMap();
    return result?['access_token'];
  }
}
