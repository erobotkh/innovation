import 'package:flutter/material.dart';
import 'package:innovation/core/configs/tab_bar/tab_bar_item.dart';
import 'package:innovation/core/routes/app_router.dart';
import 'package:innovation/views/account/account_view.dart';
import 'package:innovation/views/home/home_view.dart';
import 'package:innovation/views/posts/posts_view.dart';

class TabBarConfig {
  List<TabBarItem> tabs = [
    TabBarItem(
      activeIconData: Icons.home,
      iconData: Icons.home_outlined,
      screen: const HomeView(),
      label: "Home",
      path: TabBarPath.home,
    ),
    TabBarItem(
      activeIconData: Icons.person,
      iconData: Icons.person_outline,
      screen: const AccountView(),
      label: "Account",
      path: TabBarPath.account,
    ),
    TabBarItem(
      activeIconData: Icons.post_add,
      iconData: Icons.post_add_outlined,
      screen: const PostsView(),
      label: "Posts",
      path: TabBarPath.posts,
    ),
  ];

  List<PageRouteInfo<dynamic>> generateRoutes() {
    return List.generate(tabs.length, (index) {
      final tab = tabs[index];
      return routeFromPath(tab.path);
    });
  }

  PageRouteInfo routeFromPath(TabBarPath path) {
    switch (path) {
      case TabBarPath.home:
        return const HomeViewRoute();
      case TabBarPath.account:
        return const AccountViewRoute();
      case TabBarPath.posts:
        return const PostsNamespaceRoute();
    }
  }
}
