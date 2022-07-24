import 'package:get/get.dart';

import '../../../exports.dart';

class DataInitBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DataInitController>(
      () => DataInitController(),
    );
  }
}
