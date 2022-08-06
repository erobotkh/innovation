library sender_view;

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';
import 'package:innovation/constants/config_constant.dart';
import 'package:innovation/core/base/view_model_provider.dart';
import 'package:flutter/material.dart';
import 'package:innovation/theme/material3/m3_color.dart';
import 'package:innovation/views/sender/src/sender_message_model.dart';
import 'package:innovation/widgets/er_tap_effect.dart';
import 'sender_view_model.dart';

part 'sender_mobile.dart';

class SenderView extends StatelessWidget {
  const SenderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<SenderViewModel>(
      create: (context) => SenderViewModel(),
      builder: (context, viewModel, child) {
        return _SenderMobile(viewModel);
      },
    );
  }
}
