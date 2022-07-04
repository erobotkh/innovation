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

class AdaptiveScaffold extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
          return Scaffold(
            bottomNavigationBar: buildBottomNavigation(),
            body: body,
          );
        } else if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
          return Scaffold(
            body: Row(
              children: [
                buildNavigationRail(),
                const VerticalDivider(width: 1),
                Expanded(
                  child: body,
                ),
              ],
            ),
          );
        } else {
          return Scaffold(
            body: Row(
              children: [
                buildDrawer(context),
                const VerticalDivider(width: 1),
                Expanded(
                  child: body,
                ),
              ],
            ),
          );
        }
      },
    );
  }

  Widget buildBottomNavigation() {
    return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: (int index) => onDestinationSelected(index),
      destinations: destinations.map((e) {
        return NavigationDestination(
          icon: Icon(e.iconData),
          selectedIcon: Icon(e.activeIconData),
          label: e.label,
          tooltip: e.label,
        );
      }).toList(),
    );
  }

  Widget buildNavigationRail() {
    return NavigationRail(
      selectedIndex: selectedIndex,
      onDestinationSelected: (int index) => onDestinationSelected(index),
      destinations: destinations.map((e) {
        return NavigationRailDestination(
          icon: Icon(e.iconData),
          selectedIcon: Icon(e.activeIconData),
          label: Text(e.label),
        );
      }).toList(),
    );
  }

  // Flutter team still working on M3 navigation drawer.
  // Meanwhile, we custom the UI
  Widget buildDrawer(BuildContext context) {
    return Drawer(
      child: ListView(
        children: List.generate(
          destinations.length,
          (index) {
            AdaptiveScaffoldDestination destination = destinations[index];
            bool selected = index == selectedIndex;
            return ListTile(
              title: Text(destination.label),
              onTap: () => onDestinationSelected(index),
              leading: SizedBox(
                width: 44,
                height: 44,
                child: Icon(
                  selected ? destination.activeIconData : destination.iconData,
                  color: selected ? Theme.of(context).colorScheme.primary : null,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
