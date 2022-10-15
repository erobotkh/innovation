import 'package:flutter/services.dart';
import 'package:innovation/core/base/base_view_model.dart';

class ThumbstickViewModel extends BaseViewModel {
  ThumbstickViewModel() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }
}
