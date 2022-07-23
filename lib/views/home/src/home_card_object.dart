import 'package:flutter/material.dart';

class HomeCardObject {
  final IconData iconData;
  final String title;
  final String subtitle;

  HomeCardObject({
    required this.iconData,
    required this.title,
    required this.subtitle,
  });

  static final List<HomeCardObject> items = [
    HomeCardObject(
      iconData: Icons.keyboard,
      title: "Sender",
      subtitle: "Send string to arduio robot via Bluetooth",
    ),
    HomeCardObject(
      iconData: Icons.settings_remote,
      title: "IR Remoter",
      subtitle: "Vitual IR Remoter",
    ),
    HomeCardObject(
      iconData: Icons.gps_fixed,
      title: "Joystick",
      subtitle: "Servo, Speed & Shoot",
    ),
    HomeCardObject(
      iconData: Icons.gamepad,
      title: "Thumbstick",
      subtitle: "Servo & Speed",
    ),
    HomeCardObject(
      iconData: Icons.people,
      title: "ERobot's Member",
      subtitle: "See team & members info",
    ),
    HomeCardObject(
      iconData: Icons.stars,
      title: "Our reputation",
      subtitle: "Events info",
    ),
  ];
}
