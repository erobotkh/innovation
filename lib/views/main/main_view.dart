library main_view;

import 'package:flutter/material.dart';
import 'package:innovation/core/base/base_view.dart';
import 'package:innovation/core/routes/app_router.dart';
import 'package:innovation/views/main/local_widgets/adaptive_scaffold.dart';
import 'package:innovation/views/main/main_view_model.dart';

part 'main_view_adaptive.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<MainViewModel>(
      create: (context) => MainViewModel(),
      onModelReady: (context, viewModel) {},
      builder: (context, viewModel, child) {
        return _MainViewAdpative(
          viewModel: viewModel,
        );
      },
    );
  }
}
