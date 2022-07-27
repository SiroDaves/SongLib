import 'package:get/get.dart';

import '../../../exports.dart';

class ListedsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListedsController>(
      () => ListedsController(),
    );
  }
}
