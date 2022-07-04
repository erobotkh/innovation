import 'package:flutter/material.dart';
import 'package:innovation/app_builder.dart';
import 'package:innovation/core/routes/route_config.dart';
import 'package:provider/provider.dart';
import 'package:innovation/core/providers/theme_provider.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  static GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  static final RouteConfig _routeConfig = RouteConfig();

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, provider, child) {
      return MaterialApp.router(
        scaffoldMessengerKey: App.scaffoldMessengerKey,
        routeInformationParser: _routeConfig.routeInformationParser,
        routerDelegate: _routeConfig.routerDelegate,
        themeMode: provider.themeMode,
        theme: provider.lightTheme,
        darkTheme: provider.darkTheme,
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
        builder: (context, child) {
          return AppBuilder(child: child);
        },
      );
    });
  }
}
