import 'package:get/get.dart';

import '../../../exports.dart';

class EditorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EditorController>(
      () => EditorController(),
    );
  }
}
