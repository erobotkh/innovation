import 'package:flutter/material.dart';
import 'package:innovation/views/joystick/joystick_view.dart';

class HomeCardObject {
  final IconData iconData;
  final String title;
  final String subtitle;
  final Widget toRoute;

  HomeCardObject({
    required this.iconData,
    required this.title,
    required this.subtitle,
    required this.toRoute,
  });

  static final List<HomeCardObject> items = [
    HomeCardObject(
      iconData: Icons.keyboard,
      title: "Sender",
      subtitle: "Send string to arduio robot via Bluetooth",
      toRoute: const JoystickViews(),
    ),
    HomeCardObject(
      iconData: Icons.settings_remote,
      title: "IR Remoter",
      subtitle: "Vitual IR Remoter",
      toRoute: const JoystickViews(),
    ),
    HomeCardObject(
      iconData: Icons.gps_fixed,
      title: "Joystick",
      subtitle: "Servo, Speed & Shoot",
      toRoute: const JoystickViews(),
    ),
    HomeCardObject(
      iconData: Icons.gamepad,
      title: "Thumbstick",
      subtitle: "Servo & Speed",
      toRoute: const JoystickViews(),
    ),
    HomeCardObject(
      iconData: Icons.people,
      title: "ERobot's Member",
      subtitle: "See team & members info",
      toRoute: const JoystickViews(),
    ),
    HomeCardObject(
      iconData: Icons.stars,
      title: "Our reputation",
      subtitle: "Events info",
      toRoute: const JoystickViews(),
    ),
  ];
}
