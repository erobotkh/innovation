library joystick_view;

import 'package:flutter/foundation.dart';
import 'package:innovation/core/base/view_model_provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import '../../theme/material3/m3_color.dart';
import '../../widgets/er_custom_app_bar.dart';
import '../../widgets/er_four_buttons.dart';
import '../../widgets/er_joystick.dart';
import 'thumbstick_view_model.dart';
import 'package:innovation/constants/config_constant.dart';


part 'thumbstick_mobile.dart';

class ThumbstickViews extends StatelessWidget {
  const ThumbstickViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<ThumbstickViewModel>(
      create: (context) => ThumbstickViewModel(),
      builder: (context, viewModel, child) {
        return ScreenTypeLayout(
          mobile: _ThumbstickMobile(viewModel),
          // desktop: _JoystickDesktop(viewModel),
          // tablet: _JoystickTablet(viewModel),
        );
      },
    );
  }
}
