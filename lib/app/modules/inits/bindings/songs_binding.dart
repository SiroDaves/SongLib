import 'package:get/get.dart';

import '../../../exports.dart';

class SongsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SongsController>(
      () => SongsController(),
    );
  }
}
