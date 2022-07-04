import 'package:flutter/material.dart';

enum TabBarPath {
  home,
  account,
  posts,
}

class TabBarItem {
  final IconData activeIconData;
  final IconData iconData;
  final String label;
  final Widget screen;
  final TabBarPath path;

  TabBarItem({
    required this.activeIconData,
    required this.iconData,
    required this.screen,
    required this.label,
    required this.path,
  });
}
