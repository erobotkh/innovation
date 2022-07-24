import 'package:innovation/constants/api_constant.dart';
import 'package:innovation/core/base/base_model.dart';
import 'package:innovation/core/http/apis/base_error_handling_api.dart';
import 'package:innovation/core/http/networks/base_network.dart';
import 'package:innovation/core/http/networks/user_token_network.dart';

abstract class BaseResourceOwnerApi<T extends BaseModel> extends BaseErrorHandlingApi<T> {
  @override
  BaseNetwork buildNetwork() {
    return UserTokenNetwork(ApiConstant.baseUrl);
  }
}
