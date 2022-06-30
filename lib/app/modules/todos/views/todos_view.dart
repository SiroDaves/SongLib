import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../exports.dart';

/// Todos screen after Todos
// ignore: must_be_immutable
class TodosView extends StatelessWidget {
  final TodosController controller = Get.put(TodosController());
  final GetStorage userData = GetStorage();
  final Book? currentBook;
  Size? size;

  TodosView({Key? key, this.currentBook}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = Get.size;
    if (currentBook != null) {
      controller.book = currentBook;
      controller.showCurrentBook();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppConstants.todoTitle,
          style: appBarTextStyle.copyWith(fontSize: 25),
        ),
        actions: [
          currentBook != null
              ? InkWell(
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(Icons.delete),
                  ),
                  onTap: () => controller.confirmDelete(context),
                )
              : InkWell(
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(Icons.clear),
                  ),
                  onTap: () => controller.confirmCancel(context),
                ),
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          child: GetBuilder<TodosController>(
            builder: (controller) =>
                controller.isLoading ? const CircularProgress() : inputForm(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.saveBook();
        },
        backgroundColor: AppColors.primaryColor,
        child: const Icon(Icons.save, color: AppColors.white),
      ),
    );
  }

  Widget inputForm() {
    return Container(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Column(
        children: <Widget>[
          FormInput(
            iLabel: 'Title',
            iController: controller.titleController!,
            prefix: const Icon(Icons.text_fields),
            iOptions: const <String>[],
          ),
          FormInput(
            iLabel: 'Description',
            iController: controller.contentController!,
            isMultiline: true,
            iType: TextInputType.multiline,
            iOptions: const <String>[],
          ),
        ],
      ),
    );
  }
}
