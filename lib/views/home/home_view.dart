library home;

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:innovation/constants/config_constant.dart';
import 'package:innovation/core/base/view_model_provider.dart';
import 'package:innovation/core/providers/theme_provider.dart';
import 'package:innovation/theme/material3/m3_color.dart';
import 'package:innovation/views/home/home_view_model.dart';
import 'package:innovation/views/home/local_widgets/home_card.dart';
import 'package:innovation/views/home/src/home_card_object.dart';
import 'package:innovation/widgets/measure_size.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

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
