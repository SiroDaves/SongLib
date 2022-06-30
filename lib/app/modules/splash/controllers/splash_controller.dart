import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../exports.dart';

/// The controller for the Splash screen
class SplashController extends GetxController {
  final GetStorage userData = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    moveToNext();
  }

  @override
  void onClose() {}

  Future<void> moveToNext() async {
    await Future.delayed(const Duration(seconds: 3), () {});
    Get.offAll(() => BooksView());
  }
}
