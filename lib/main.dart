import 'dart:io';

import 'package:flutter/material.dart';
import 'package:innovation/app.dart';
import 'package:innovation/core/storages/theme_mode_storage.dart';
import 'package:innovation/provider_scope.dart';
import 'package:package_info_plus/package_info_plus.dart';

part 'global.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Global.instance._initialize();

  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
