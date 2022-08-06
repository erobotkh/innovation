library joystick_view;

import 'package:flutter/foundation.dart';
import 'package:innovation/core/base/view_model_provider.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/material.dart';
import '../../widgets/er_joystick.dart';
import 'joystick_view_model.dart';
import 'local_widget/custom_app_bar.dart';
import 'package:innovation/constants/config_constant.dart';

import 'local_widget/four_buttons.dart';

part 'joystick_mobile.dart';

class JoystickViews extends StatelessWidget {
  const JoystickViews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<JoystickViewModel>(
      create: (context) => JoystickViewModel(),
      builder: (context, viewModel, child) {
        return ScreenTypeLayout(
          mobile: _JoystickMobile(viewModel),
          // desktop: _JoystickDesktop(viewModel),
          // tablet: _JoystickTablet(viewModel),
        );
      },
    );
  }
}
