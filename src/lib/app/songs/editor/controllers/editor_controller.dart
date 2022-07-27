import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../exports.dart';

/// The controller for the Editor screen
class EditorController extends GetxController {
  final GetStorage userData = GetStorage();
  Song? song;
  Draft? draft;

  bool isBusy = false;
  String? title, content, alias, key;
  TextEditingController? titleController, contentController;
  TextEditingController? aliasController, keyController;

  DraftDaoStorage? draftDao;
  SongDaoStorage? songDao;

  @override
  void onInit() {
    super.onInit();
    draftDao = Get.find<DraftDaoStorage>();
    songDao = Get.find<SongDaoStorage>();
    titleController = TextEditingController();
    contentController = TextEditingController();
    aliasController = TextEditingController();
    keyController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    titleController?.dispose();
    contentController?.dispose();
    aliasController?.dispose();
    keyController?.dispose();
  }

  Future<void> showCurrentSong() async {
    titleController!.text = song!.title!;
    titleController!.text = song!.title!;
    aliasController!.text = song!.alias!;
    keyController!.text = song!.key!;
  }

  // function to validate creds
  bool validateInput() {
    bool validated = false;
    if (titleController!.text.isNotEmpty) {
      title = titleController!.text;
      content = contentController!.text;
      alias = aliasController!.text;
      key = keyController!.text;

      validated = true;
    } else {
      validated = false;
    }
    return validated;
  }

  /// Save changes for a song be it a new one or simply updating an old one
  Future<bool?> saveSong() async {
    bool? success;

    if (validateInput()) {
      isBusy = true;
      update();

      if (song != null) {
        song!.title = titleController!.text;
        song!.content = contentController!.text;
        song!.alias = aliasController!.text;
        song!.key = keyController!.text;
        songDao!.updateSong(song!);
      } else {
        draft = Draft(
          title: titleController!.text,
          content: contentController!.text,
          alias: aliasController!.text,
          key: keyController!.text,
        );
        draftDao!.createDraft(draft!);
      }

      isBusy = false;
      update();
    }

    return success;
  }

  /// Remove a song from the records
  Future<bool?> deleteSong() async {
    bool? success;

    if (validateInput()) {
      isBusy = true;
      update();

      draftDao!.createDraft(draft!);

      isBusy = true;
      update();
    }
    return success;
  }

  Future<void> confirmCancel(BuildContext context) async {
    if (validateInput()) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text(
            'Just a Minute',
            style: titleTextStyle.copyWith(fontSize: 18),
          ),
          content: Text(
            'Are you sure you want to close without saving your changes of the song: ${titleController!.text}?',
            style: normalTextStyle.copyWith(fontSize: 14),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                saveSong();
              },
              child: const Text("SAVE"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Get.back();
              },
              child: const Text("DON'T SAVE"),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("CANCEL"),
            ),
          ],
        ),
      );
    } else {
      Get.back();
    }
  }

  Future<void> confirmDelete(BuildContext context) async {
    if (validateInput()) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text(
            'Just a Minute',
            style: titleTextStyle.copyWith(fontSize: 18),
          ),
          content: Text(
            'Are you sure you want to delete the song: ${titleController!.text}?',
            style: normalTextStyle.copyWith(fontSize: 14),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                deleteSong();
              },
              child: const Text("DELETE"),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("CANCEL"),
            ),
          ],
        ),
      );
    } else {
      Get.back();
    }
  }
}
