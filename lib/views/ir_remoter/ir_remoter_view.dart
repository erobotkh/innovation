library ir_remoter_view;

import 'package:flutter/material.dart';
import 'package:innovation/core/base/view_model_provider.dart';
import '../../constants/config_constant.dart';
import '../../core/models/ui_models/remoter_button_model.dart';
import '../../widgets/er_back_button.dart';
import '../../widgets/er_tap_effect.dart';
import 'ir_remoter_view_model.dart';

part 'ir_remoter_mobile.dart';

class IrRemoterView extends StatelessWidget {
  const IrRemoterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<IrRemoterViewModel>(
 create: (context) => IrRemoterViewModel(),
      builder: (context, viewModel, child) {
        return _IrRemoterMobile(viewModel);
      }
    );
  }
}