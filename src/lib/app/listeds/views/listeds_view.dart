import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../exports.dart';

// ignore: must_be_immutable
class ListedsView extends StatelessWidget {
  final ListedsController controller = Get.put(ListedsController());
  final GetStorage userData = GetStorage();
  final Listed? listed;
  Size? size;

  ListedsView({Key? key, required this.listed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = Get.size;
    controller.listed = listed;
    controller.loadViewer();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          listed!.title!,
          style: titleTextStyle.copyWith(fontSize: 25),
        ),
      ),
      body: Container(
        height: size!.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.white,
              Colors.orange,
              AppColors.secondaryColor,
              AppColors.primaryColor,
              AppColors.black,
            ],
          ),
        ),
        child: Container(),
      ),
    );
  }

}
