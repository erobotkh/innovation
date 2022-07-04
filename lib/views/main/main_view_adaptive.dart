part of main_view;

class _MainViewAdpative extends StatelessWidget {
  const _MainViewAdpative({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  final MainViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: viewModel.tabBarConfig.generateRoutes(),
      builder: (context, widget, animation) {
        return buildBody(
          context: context,
          viewModel: viewModel,
          widget: widget,
        );
      },
    );
  }

  Widget buildBody({
    required BuildContext context,
    required MainViewModel viewModel,
    required Widget widget,
  }) {
    TabsRouter tabsRouter = context.tabsRouter;
    return AdaptiveScaffold(
      selectedIndex: tabsRouter.activeIndex,
      onDestinationSelected: (index) {
        viewModel.onDestinationSelected(
          index: index,
          tabsRouter: tabsRouter,
          context: context,
        );
      },
      destinations: viewModel.tabs.map((e) {
        return AdaptiveScaffoldDestination(
          activeIconData: e.activeIconData,
          iconData: e.iconData,
          label: e.label,
        );
      }).toList(),
      body: widget,
    );
  }
}
