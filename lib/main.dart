import 'dart:io';

import 'package:flutter/material.dart';
import 'package:innovation/app.dart';
import 'package:package_info/package_info.dart';

part 'global.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Global.instance._initialize();

  runApp(
    const App(),
  );
}
