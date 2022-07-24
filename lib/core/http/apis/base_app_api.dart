import 'package:innovation/constants/api_constant.dart';
import 'package:innovation/core/base/base_model.dart';
import 'package:innovation/core/http/apis/base_error_handling_api.dart';
import 'package:innovation/core/http/networks/app_token_network.dart';
import 'package:innovation/core/http/networks/base_network.dart';

abstract class BaseAppApi<T extends BaseModel> extends BaseErrorHandlingApi<T> {
  @override
  BaseNetwork buildNetwork() {
    return AppTokenNetwork(ApiConstant.baseUrl);
  }
}
