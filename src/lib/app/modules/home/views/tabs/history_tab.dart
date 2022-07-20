// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../exports.dart';

class HistoryTab extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
  final MyDatabase database;
  Size? size;

  HistoryTab({Key? key, required this.database}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
