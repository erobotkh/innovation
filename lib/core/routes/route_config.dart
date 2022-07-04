import 'package:flutter/material.dart';
import 'package:innovation/core/routes/app_router.dart';

class RouteConfig {
  late final AppRouter router;

  AutoRouterDelegate get routerDelegate => router.delegate();
  DefaultRouteParser get routeInformationParser => router.defaultRouteParser();

  RouteConfig() {
    router = AppRouter();
  }

  // set title in lib/core/routes/app_router.dart
  static String? title(BuildContext context) {
    return context.routeData.meta['title'];
  }
}
