import 'package:get/get.dart';

import '../../../exports.dart';

class SelectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectionController>(
      () => SelectionController(),
    );
  }
}
