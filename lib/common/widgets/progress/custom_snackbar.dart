import 'package:flutter/material.dart';

import '../../theme/theme_colors.dart';

class CustomSnackbar {
  static void show(
    BuildContext context,
    String feedback, {
    SnackBarBehavior behavior = SnackBarBehavior.floating,
    bool isSuccess = false,
    Duration duration = const Duration(seconds: 5),
  }) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          duration: duration,
          backgroundColor:
              isSuccess ? ThemeColors.green : ThemeColors.britamRed,
          content: Text(feedback),
        ),
      );
  }
}
