import 'package:flutter/material.dart';

import 'theme_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme() {
    return ThemeData(
      scaffoldBackgroundColor: ThemeColors.kLightGray,
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: ThemeColors.kPrimaryOrange,
        primaryContainer: ThemeColors.kPrimaryOrange,
        onPrimary: Colors.white,
        secondary: ThemeColors.kComplementaryOrange,
        secondaryContainer: ThemeColors.kComplementaryOrange,
        onSecondary: ThemeColors.kDarkGrayBlack,
        surface: ThemeColors.kLightGray,
        onSurface: Colors.black,
        background: Colors.white,
        onBackground: ThemeColors.kDarkOrange,
        error: Colors.red,
        onError: Colors.white,
      ),
      appBarTheme: const AppBarTheme(
        foregroundColor: Colors.white,
        backgroundColor: ThemeColors.kPrimaryOrange,
        shadowColor: Colors.black,
        elevation: 3,
      ),
      navigationBarTheme: const NavigationBarThemeData(
        backgroundColor: Colors.white,
        indicatorColor: ThemeColors.accent,
        elevation: 3,
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        },
      ),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      scaffoldBackgroundColor: ThemeColors.kMediumGray,
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: Colors.white,
        primaryContainer: Colors.white,
        onPrimary: Colors.white,
        secondary: ThemeColors.kLightGrayDarkMode,
        secondaryContainer: ThemeColors.kLightGrayDarkMode,
        onSecondary: ThemeColors.kDarkTealBrown,
        surface: Colors.grey,
        onSurface: Colors.white,
        background: ThemeColors.kMediumGray,
        onBackground: ThemeColors.kLightGrayDarkMode,
        error: Colors.red,
        onError: Colors.black,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
        },
      ),
    );
  }
}
