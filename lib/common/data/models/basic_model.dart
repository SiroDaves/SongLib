import 'package:flutter/material.dart';

class ResponseModel {
  int status;
  String feedback;
  dynamic response;

  ResponseModel({this.status = 0, this.feedback = '', this.response});
}

class Selectable<T> {
  bool isSelected = false;
  T data;
  Selectable(this.data, this.isSelected);
}

class HomeSlider {
  int id;
  String image;
  String title;
  HomeSlider(this.id, this.image, this.title);
}

enum PageType { lists, search, likes, drafts, helpdesk, settings }

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
