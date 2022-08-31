import 'package:flutter/material.dart';
import 'package:innovation/views/ir_remoter/ir_remoter_view.dart';
import 'package:innovation/views/joystick/joystick_view.dart';
import 'package:innovation/views/sender/sender_view.dart';

import '../../thumbstick/thumbstick_view.dart';

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
      toRoute: const SenderView(),
    ),
    HomeCardObject(
      iconData: Icons.settings_remote,
      title: "IR Remoter",
      subtitle: "Vitual IR Remoter",
      toRoute: const IrRemoterView(),
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
      toRoute: const ThumbstickViews(),
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
