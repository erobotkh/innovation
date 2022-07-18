library home;

import 'package:flutter/material.dart';
import 'package:innovation/constants/config_constant.dart';
import 'package:innovation/core/base/view_model_provider.dart';
import 'package:innovation/core/providers/theme_provider.dart';
import 'package:innovation/views/home/home_view_model.dart';
import 'package:provider/provider.dart';

part 'home_mobile.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<HomeViewModel>(
      create: (context) => HomeViewModel(),
      builder: (context, viewModel, child) {
        return _HomeMobile(
          viewModel: viewModel,
        );
      },
    );
  }
}
