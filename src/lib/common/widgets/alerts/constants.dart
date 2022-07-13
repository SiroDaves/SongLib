import 'package:flutter/material.dart';

/// Alert types
enum AlertType { error, success, info, warning, none }

/// Alert animation types
enum AnimationType { fromRight, fromLeft, fromTop, fromBottom, grow, shrink }

/// Buttons container
enum ButtonsDirection { row, column }

const EdgeInsets defaultAlertPadding =
    EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0);

typedef AlertAnimation = Widget Function(
  BuildContext context,
  Animation<double> animation,
  Animation<double> secondaryAnimation,
  Widget child,
);
