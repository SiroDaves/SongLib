import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../exports.dart';

/// Splash screen after splash
// ignore: must_be_immutable
class SplashView extends StatelessWidget {
  final SplashController controller = Get.put(SplashController());
  final GetStorage userData = GetStorage();
  final MyDatabase database;
  Size? size;

  SplashView({Key? key, required this.database}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.db = database;
    size = Get.size;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/app_icon.png',
              height: 200,
              width: 200,
            ),
            const SizedBox(
              height: 35,
            ),
            Text(
              AppConstants.appTitle,
              style: titleTextStyle.copyWith(
                fontSize: 40,
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
