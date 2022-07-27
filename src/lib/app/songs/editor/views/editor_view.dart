import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../exports.dart';

/// Editor screen after Editor
// ignore: must_be_immutable
class EditorView extends StatelessWidget {
  final EditorController controller = Get.put(EditorController());
  final GetStorage userData = GetStorage();
  final Song? song;
  Size? size;

  EditorView({Key? key, this.song}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = Get.size;
    if (song != null) {
      controller.song = song;
      controller.showCurrentSong();
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppConstants.editorTitle,
          style: normalTextStyle,
        ),
        actions: [
          song != null
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
      body: Container(
        height: size!.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Colors.orange,
              AppColors.secondaryColor,
              AppColors.primaryColor,
              AppColors.black,
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: GetBuilder<EditorController>(
            builder: (controller) => Container(
              margin: const EdgeInsets.all(10),
              child: controller.isBusy ? const CircularProgress() : inputForm(),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.saveSong();
        },
        backgroundColor: AppColors.primaryColor,
        child: const Icon(Icons.save, color: AppColors.white),
      ),
    );
  }

  Widget inputForm() {
    return Card(
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Column(
          children: <Widget>[
            FormInput(
              iLabel: 'Title',
              iController: controller.titleController!,
              prefix: const Icon(Icons.text_fields),
              iOptions: const <String>[],
            ),
            FormInput(
              iLabel: 'Alias (Optional)',
              iController: controller.aliasController!,
              prefix: const Icon(Icons.text_format),
              iOptions: const <String>[],
            ),
            FormInput(
              iLabel: 'Content',
              iController: controller.contentController!,
              isMultiline: true,
              iType: TextInputType.multiline,
              iOptions: const <String>[],
            ),
            FormInput(
              iLabel: 'Key (Optional)',
              iController: controller.keyController!,
              prefix: const Icon(Icons.key),
              iOptions: const <String>[],
            ),
          ],
        ),
      ),
    );
  }

}
