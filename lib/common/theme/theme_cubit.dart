import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import 'theme_colors.dart';

/// {@template brightness_cubit}
/// A simple [Cubit] that manages the [ThemeData] as its state.
/// {@endtemplate}
class ThemeCubit extends Cubit<ThemeData> {
  ThemeCubit() : super(britamTheme);

  static final britamTheme = ThemeData(
    primaryColor: ThemeColors.primary,
    colorScheme: const ColorScheme(
      primary: ThemeColors.primary,
      primaryContainer: ThemeColors.primaryDark,
      onPrimary: ThemeColors.white,
      secondary: ThemeColors.accent,
      secondaryContainer: ThemeColors.accent,
      onSecondary: ThemeColors.white,
      surface: ThemeColors.white,
      onBackground: ThemeColors.primary,
      onSurface: ThemeColors.primary,
      background: ThemeColors.white,
      onError: ThemeColors.primaryDark,
      brightness: Brightness.light,
      error: ThemeColors.error,
    ),
    appBarTheme: const AppBarTheme(
      iconTheme: IconThemeData(color: ThemeColors.primary),
      color: Colors.white,
      toolbarTextStyle: TextStyle(color: ThemeColors.primary),
    ),
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: ThemeColors.accent,
      selectionHandleColor: ThemeColors.accent,
      selectionColor: ThemeColors.accent.withOpacity(0.4),
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
      },
    ),
  );
}
