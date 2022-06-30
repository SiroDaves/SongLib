import 'package:get/get.dart';

import '../../../exports.dart';

class BooksBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BooksController>(
      () => BooksController(),
    );
  }
}
