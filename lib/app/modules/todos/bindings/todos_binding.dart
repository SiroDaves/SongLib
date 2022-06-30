import 'package:get/get.dart';

import '../../../exports.dart';

class TodosBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TodosController>(
      () => TodosController(),
    );
  }
}
