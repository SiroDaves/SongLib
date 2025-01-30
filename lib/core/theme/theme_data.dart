import 'package:flutter/material.dart';

import 'theme_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme() {
    return ThemeData(
      scaffoldBackgroundColor: ThemeColors.accent1,
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
        error: Colors.red,
        onError: Colors.white,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: ThemeColors.primary,
        foregroundColor: ThemeColors.accent1,
        shadowColor: Colors.black,
        elevation: 3,
      ),
      navigationBarTheme: const NavigationBarThemeData(
        backgroundColor: Colors.white,
        indicatorColor: ThemeColors.accent,
        elevation: 3,
      ),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(
      scaffoldBackgroundColor: ThemeColors.kPrimaryDeepOrange,
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
        error: Colors.red,
        onError: Colors.black,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      navigationBarTheme: const NavigationBarThemeData(
        backgroundColor: Colors.black,
        indicatorColor: ThemeColors.accent,
      ),
    );
  }
}
