import 'package:get/get.dart';

import '../../../exports.dart';

class SongBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SongController>(
      () => SongController(),
    );
  }
}
