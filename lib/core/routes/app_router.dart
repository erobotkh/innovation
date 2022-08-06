import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:innovation/core/routes/route_helper_views/hero_empty_route_page.dart';
import 'package:innovation/views/account/account_view.dart';
import 'package:innovation/views/home/home_view.dart';
import 'package:innovation/views/ir_remoter/ir_remoter_view.dart';
import 'package:innovation/views/main/main_view.dart';
import 'package:innovation/views/post_detail/post_detail_view.dart';
import 'package:innovation/views/posts/posts_view.dart';

export 'package:auto_route/auto_route.dart';

part 'app_router.gr.dart';

// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter
@AdaptiveAutoRouter(
  // replaceInRouteName: 'Page,View',
  routes: <AutoRoute>[
    AutoRoute(
      path: '/',
      page: MainView,
      initial: true,
      children: [
        AutoRoute(
          path: '',
          page: HomeView,
          initial: true,
        ),
        AutoRoute(
          path: 'posts',
          name: 'PostsNamespaceRoute',
          page: HeroEmptyRouterPage,
          children: [
            AutoRoute(
              path: '',
              page: PostsView,
              initial: true,
            ),
            AutoRoute(
              path: ':id',
              page: PostDetailView,
            ),
          ],
        ),
        AutoRoute(
          path: 'account',
          page: AccountView,
        ),
        AutoRoute(
          path: 'ir-remoter',
          page: IrRemoterView,
        ),
      ],
    ),
  ],
)
class AppRouter extends _$AppRouter {}
