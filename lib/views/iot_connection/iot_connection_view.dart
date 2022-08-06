library iot_connection_view;

import 'package:innovation/core/base/view_model_provider.dart';
import 'package:flutter/material.dart';
import 'iot_connection_view_model.dart';

part 'iot_connection_mobile.dart';

class IotConnectionView extends StatelessWidget {
  const IotConnectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<IotConnectionViewModel>(
      create: (context) => IotConnectionViewModel(),
      builder: (context, viewModel, child) {
        return _IotConnectionMobile(viewModel);
      },
    );
  }
}
