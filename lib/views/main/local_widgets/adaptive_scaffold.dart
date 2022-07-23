import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class AdaptiveScaffoldDestination {
  final String label;
  final IconData activeIconData;
  final IconData iconData;

  AdaptiveScaffoldDestination({
    required this.label,
    required this.activeIconData,
    required this.iconData,
  });
}

class AdaptiveScaffold extends StatefulWidget {
  const AdaptiveScaffold({
    Key? key,
    required this.destinations,
    required this.selectedIndex,
    required this.onDestinationSelected,
    required this.body,
  }) : super(key: key);

  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;
  final List<AdaptiveScaffoldDestination> destinations;
  final Widget body;

  @override
  State<AdaptiveScaffold> createState() => _AdaptiveScaffoldState();
}

class _AdaptiveScaffoldState extends State<AdaptiveScaffold> {
  late final ValueNotifier<bool> extendedNotifier;

  @override
  void initState() {
    extendedNotifier = ValueNotifier<bool>(false);
    super.initState();
  }

  @override
  void dispose() {
    extendedNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile ||
            sizingInformation.deviceScreenType == DeviceScreenType.watch) {
          return Scaffold(
            bottomNavigationBar: buildBottomNavigation(),
            body: widget.body,
          );
        } else {
          return Scaffold(
            body: Row(
              children: [
                buildSideBar(),
                Expanded(
                  child: widget.body,
                ),
              ],
            ),
          );
        }
      },
    );
  }

  Widget buildSideBar() {
    return ValueListenableBuilder<bool>(
      valueListenable: extendedNotifier,
      builder: (context, extended, child) {
        return Container(
          color: Theme.of(context).appBarTheme.backgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0 + 2),
                child: IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    extendedNotifier.value = !extended;
                  },
                ),
              ),
              Expanded(
                child: buildNavigationRail(
                  extended: extended,
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget buildBottomNavigation() {
    return NavigationBar(
      selectedIndex: widget.selectedIndex,
      onDestinationSelected: (int index) => widget.onDestinationSelected(index),
      destinations: widget.destinations.map((e) {
        return NavigationDestination(
          icon: Icon(e.iconData),
          selectedIcon: Icon(e.activeIconData),
          label: e.label,
          tooltip: e.label,
        );
      }).toList(),
    );
  }

  Widget buildNavigationRail({
    bool extended = false,
  }) {
    return NavigationRail(
      selectedIndex: widget.selectedIndex,
      extended: extended,
      backgroundColor: Colors.transparent,
      onDestinationSelected: (int index) => widget.onDestinationSelected(index),
      destinations: widget.destinations.map((e) {
        return NavigationRailDestination(
          icon: Icon(e.iconData),
          selectedIcon: Icon(e.activeIconData),
          label: Text(e.label),
        );
      }).toList(),
    );
  }
}
