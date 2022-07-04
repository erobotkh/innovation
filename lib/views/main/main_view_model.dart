import 'package:flutter/material.dart';
import 'package:innovation/core/base/base_view_model.dart';
import 'package:innovation/core/configs/tab_bar/tab_bar_config.dart';
import 'package:innovation/core/configs/tab_bar/tab_bar_item.dart';
import 'package:innovation/core/routes/app_router.dart';

class MainViewModel extends BaseViewModel {
  late final TabBarConfig tabBarConfig;
  late final List<TabBarItem> tabs;

  MainViewModel() {
    tabBarConfig = TabBarConfig();
    tabs = tabBarConfig.tabs;
  }

  void onDestinationSelected({
    required int index,
    required TabsRouter tabsRouter,
    required BuildContext context,
  }) {
    if (index == tabsRouter.activeIndex) {
      PageRouteInfo rootRoute = tabBarConfig.routeFromPath(tabs[index].path);
      tabsRouter.navigate(rootRoute);
    } else {
      return tabsRouter.setActiveIndex(index);
    }
  }
}
