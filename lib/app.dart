import 'package:flutter/material.dart';
import 'package:innovation/app_builder.dart';
import 'package:innovation/core/routes/route_config.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  static GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();
  static final RouteConfig _routeConfig = RouteConfig();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      scaffoldMessengerKey: App.scaffoldMessengerKey,
      routeInformationParser: _routeConfig.routeInformationParser,
      routerDelegate: _routeConfig.routerDelegate,
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      builder: (context, child) {
        return AppBuilder(child: child);
      },
    );
  }
}
