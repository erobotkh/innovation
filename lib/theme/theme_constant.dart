import 'package:flutter/material.dart';

class ThemeConstant {
  static const Color brandColor = Color(0xFFD30101);
  static const String defaultFontFamily = 'Open Sans';

  /// ref: http://fashioncambodia.blogspot.com/2015/11/7-colors-for-every-single-day-of-week.html
  static const Map<int, Color> colorsByDayLight = {
    DateTime.monday: Color(0xFFE38A41),
    DateTime.tuesday: Color(0xFF9341B1),
    DateTime.wednesday: Color(0xFFA3AA49),
    DateTime.thursday: Color(0xFF397C2D),
    DateTime.friday: Color(0xFF5080D7),
    DateTime.saturday: Color(0xFF6E183B),
    DateTime.sunday: Color(0xFFE5333A),
  };

  /// generated m3 color from https://material-foundation.github.io/material-theme-builder/#/dynamic
  static const Map<int, Color> colorsByDayDark = {
    DateTime.monday: Color(0xFFFFB780),
    DateTime.tuesday: Color(0xFFF0AFFF),
    DateTime.wednesday: Color(0xFFC5CE5B),
    DateTime.thursday: Color(0xFF90D87D),
    DateTime.friday: Color(0xFFACC7FF),
    DateTime.saturday: Color(0xFFFFB0C8),
    DateTime.sunday: Color(0xFFFFB3AC),
  };

  static const TextTheme defaultTextTheme = TextTheme(
    displayLarge: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 57,
      letterSpacing: -0.25,
    ),
    displayMedium: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 45,
    ),
    displaySmall: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 36,
      letterSpacing: 0.5,
    ),
    headlineLarge: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 32,
    ),
    headlineMedium: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 28,
    ),
    headlineSmall: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 24,
    ),
    titleLarge: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 22,
    ),
    titleMedium: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16,
      letterSpacing: 0.1,
    ),
    titleSmall: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 14,
      letterSpacing: 0.1,
    ),
    labelLarge: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 14,
      letterSpacing: 0.1,
    ),
    labelMedium: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 12,
      letterSpacing: 0.5,
    ),
    labelSmall: TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 11,
      letterSpacing: 0.5,
    ),
    bodyLarge: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 16,
      letterSpacing: 0.5,
    ),
    bodyMedium: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      letterSpacing: 0.25,
    ),
    bodySmall: TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 12,
      letterSpacing: 0.4,
    ),
  );
}
