import 'package:flutter/material.dart';

export '../extensions/color_extension.dart';
export '../extensions/color_scheme_extension.dart';

class M3Color {
  /// Use `M3Color.of(context)` instead of `Theme.of(context).colorScheme`
  static ColorScheme of(BuildContext context) {
    return Theme.of(context).colorScheme;
  }

  static Brightness keyboardAppearance(BuildContext context) {
    return Theme.of(context).colorScheme.brightness;
  }

  static ColorScheme darkSchemeFromSeed(Color seedColor) {
    return ColorScheme.fromSeed(seedColor: seedColor, brightness: Brightness.dark);
  }

  static ColorScheme lightSchemeFromSeed(Color seedColor) {
    return ColorScheme.fromSeed(seedColor: seedColor, brightness: Brightness.light);
  }

  static ColorScheme colorScheme(bool isDarkMode, Color brandColor) {
    if (isDarkMode) {
      return darkSchemeFromSeed(brandColor);
    } else {
      return lightSchemeFromSeed(brandColor);
    }
  }
}
