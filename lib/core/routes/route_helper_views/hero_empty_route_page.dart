import 'package:innovation/core/routes/app_router.dart';
import 'package:flutter/material.dart';

// Put them in as builder namespace route.
// This widget is wrapper that will build all its children inside it.
//
// eg.
// AutoRoute(
//  path: 'tickets',
//  name: 'TicketNamespaceRoute',
//  page: HeroEmptyRouterPage,
//  children: [
//     AutoRoute(...),
//  ]
// )
class HeroEmptyRouterPage extends StatelessWidget {
  const HeroEmptyRouterPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HeroControllerScope(
      controller: HeroController(),
      child: const AutoRouter(),
    );
  }
}
