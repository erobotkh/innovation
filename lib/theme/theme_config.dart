import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:innovation/constants/config_constant.dart';
import 'package:innovation/theme/material3/m3_color.dart';
import 'package:innovation/theme/theme_constant.dart';

class ThemeConfig {
  final bool isDarkMode;

  ThemeConfig(this.isDarkMode);
  ThemeConfig.fromDarkMode(this.isDarkMode);

  factory ThemeConfig.light() {
    return ThemeConfig.fromDarkMode(false);
  }

  factory ThemeConfig.dark() {
    return ThemeConfig.fromDarkMode(true);
  }

  ThemeData get themeData {
    ColorScheme colorScheme = M3Color.colorScheme(isDarkMode, ThemeConstant.brandColor);
    TextTheme textTheme = buildTextTheme();

    final themeData = ThemeData(
      // platform: TargetPlatform.android,
      useMaterial3: true,
      applyElevationOverlayColor: true,
      primaryColor: colorScheme.primary,
      backgroundColor: colorScheme.background,
      scaffoldBackgroundColor: colorScheme.background,
      colorScheme: colorScheme,
      canvasColor: colorScheme.readOnly.surface2,
      toggleableActiveColor: colorScheme.primary,
      appBarTheme: AppBarTheme(
        backgroundColor: colorScheme.readOnly.surface2,
        centerTitle: false,
        elevation: 0.0,
        foregroundColor: colorScheme.onSurface,
        iconTheme: IconThemeData(color: colorScheme.onSurface),
        titleTextStyle: textTheme.titleLarge?.copyWith(color: colorScheme.onSurface),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        enableFeedback: true,
        elevation: 2.0,
        backgroundColor: colorScheme.secondaryContainer,
        foregroundColor: colorScheme.onSecondaryContainer,
        extendedPadding: const EdgeInsets.symmetric(horizontal: ConfigConstant.margin2 + 4),
      ),
      navigationBarTheme: NavigationBarThemeData(
        labelTextStyle: MaterialStateProperty.all(
          const TextStyle(overflow: TextOverflow.ellipsis),
        ),
      ),
      tabBarTheme: TabBarTheme(
        labelColor: colorScheme.primary,
        unselectedLabelColor: colorScheme.onSurface,
        labelStyle: textTheme.titleSmall,
        unselectedLabelStyle: textTheme.titleSmall,
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(
            color: colorScheme.onPrimaryContainer,
            width: 1,
          ),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: const Color(0xFF323232),
        shape: RoundedRectangleBorder(
          borderRadius: ConfigConstant.circlarRadius1,
        ),
      ),
      indicatorColor: colorScheme.onPrimary,
      textTheme: textTheme,
      textButtonTheme: buildTextButtonStyle(colorScheme),
      cupertinoOverrideTheme: const CupertinoThemeData(
        textTheme: CupertinoTextThemeData(),
      ),
    );

    return withDefault(themeData);
  }

  TextButtonThemeData buildTextButtonStyle(ColorScheme colorScheme) {
    return TextButtonThemeData(
      style: TextButton.styleFrom(),
    );
  }

  TextTheme buildTextTheme() {
    return GoogleFonts.getTextTheme(
      ThemeConstant.defaultFontFamily,
      ThemeConstant.defaultTextTheme,
    );
  }

  static ThemeData withDefault(ThemeData themeData) {
    return themeData.copyWith(
      splashFactory: isApple(themeData.platform) ? NoSplash.splashFactory : InkSparkle.splashFactory,
      // InkSparkle.splashFactory,
      // InkRipple.splashFactory,
      // InkSplash.splashFactory,
      // NoSplash.splashFactory
    );
  }

  static bool isApple(TargetPlatform platform) {
    switch (platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return false;
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
        return true;
    }
  }
}
