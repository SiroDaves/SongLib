import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../exports.dart';

/// The controller for the Splash screen
class SplashController extends GetxController {
  final GetStorage userData = GetStorage();

  bool booksLoaded = false;
  bool songsLoaded = false;

  @override
  void onInit() {
    super.onInit();
    userData.writeIfNull(PrefKeys.booksLoaded, false);
    userData.writeIfNull(PrefKeys.songsLoaded, false);

    booksLoaded = userData.read(PrefKeys.booksLoaded);
    songsLoaded = userData.read(PrefKeys.songsLoaded);
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

    if (booksLoaded) {
      if (songsLoaded) {
        Get.offAll(() => HomeView());
      } else {
        Get.offAll(() => SongsView());
      }
    } else {
      Get.offAll(() => BooksView());
    }
  }
}
