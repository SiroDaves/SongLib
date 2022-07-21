import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../exports.dart';

// ignore: must_be_immutable
class SongView extends StatelessWidget {
  final SongController controller = Get.put(SongController());
  final GetStorage userData = GetStorage();
  final Song? song;
  Size? size;

  SongView({Key? key, required this.song}) : super(key: key);

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
          AppConstants.todoTitle,
          style: titleTextStyle.copyWith(fontSize: 25),
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
      body: SingleChildScrollView(
        child: SizedBox(
          child: GetBuilder<SongController>(
            builder: (controller) =>
                controller.isLoading ? const CircularProgress() : inputForm(),
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
            iLabel: 'Content',
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
