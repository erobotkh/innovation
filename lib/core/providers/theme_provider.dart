import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:innovation/core/storages/theme_mode_storage.dart';
import 'package:innovation/main.dart';
import 'package:innovation/theme/theme_config.dart';

class ThemeProvider extends ChangeNotifier {
  final ThemeModeStorage storage = ThemeModeStorage();

  ThemeData get lightTheme => ThemeConfig.light().themeData;
  ThemeData get darkTheme => ThemeConfig.dark().themeData;

  late ThemeMode _themeMode;
  ThemeMode get themeMode => _themeMode;

  ThemeProvider() {
    _themeMode = Global.instance.initialThemeMode ?? ThemeMode.system;
    load();
  }

  Future<void> load() async {
    ThemeMode? mode = await storage.readEnum();
    switch (mode) {
      case ThemeMode.system:
      case ThemeMode.light:
      case ThemeMode.dark:
        if (_themeMode != mode) setMode(mode!);
        break;
      case null:
        break;
    }
  }

  void setMode(ThemeMode mode) {
    _themeMode = mode;
    storage.writeEnum(mode);
    notifyListeners();
  }

  void toggleThemeMode() {
    setMode(
      isDarkMode() ? ThemeMode.light : ThemeMode.dark,
    );
  }

  bool isDarkMode() {
    if (themeMode == ThemeMode.system) {
      Brightness? brightness = SchedulerBinding.instance.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }
}
