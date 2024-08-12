import 'package:flutter/material.dart';

class PageItem {
  const PageItem({
    required this.title,
    required this.icon,
    required this.screen,
  });
  final String title;
  final IconData icon;
  final Widget screen;
}
