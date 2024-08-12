import 'package:flutter/material.dart';

class PresentorModel {
  String songBook;
  String songTitle;
  bool hasChorus;
  List<String> songVerses;
  List<Tab> widgetTabs;
  List<Widget> widgetContent;

  PresentorModel({
    this.songBook = '',
    this.songTitle = '',
    this.hasChorus = false,
    this.songVerses = const [],
    this.widgetTabs = const [],
    this.widgetContent = const [],
  });
}
