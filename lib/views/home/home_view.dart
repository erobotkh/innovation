import 'package:flutter/material.dart';
import 'package:innovation/core/providers/theme_provider.dart';
import 'package:innovation/widgets/inno_app_bar_title.dart';
import 'package:provider/provider.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MorphingAppBar(
        title: const InnoAppBarTitle(overridedTitle: "Home"),
        actions: [
          IconButton(
            icon: const Icon(Icons.dark_mode),
            onPressed: () {
              context.read<ThemeProvider>().toggleThemeMode();
            },
          )
        ],
      ),
      body: const Center(
        child: Text("Home"),
      ),
    );
  }
}
