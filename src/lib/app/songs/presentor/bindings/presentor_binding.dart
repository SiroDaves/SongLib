import 'package:get/get.dart';

import '../../../exports.dart';

class PresentorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PresentorController>(
      () => PresentorController(),
    );
  }
}
