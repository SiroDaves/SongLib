import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../exports.dart';

/// The controller for the Song screen
class SongController extends GetxController {
  final GetStorage userData = GetStorage();
  Song? song;
  bool isLoading = false;
  String? songTitle, songContent;
  TextEditingController? titleController, contentController;

  DioService dioService = DioService();
  MyDatabase? db;

  @override
  void onInit() {
    super.onInit();
    dioService.init();
    db = Get.find<MyDatabase>();
    titleController = TextEditingController();
    contentController = TextEditingController();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    titleController?.dispose();
    contentController?.dispose();
  }

  Future<void> showCurrentSong() async {
    titleController!.text = song!.title;
    contentController!.text = song!.content;
  }

  // function to validate creds
  bool validateInput() {
    bool validated = false;
    if (titleController!.text.isNotEmpty) {
      songTitle = titleController!.text;
      songContent = contentController!.text;
      validated = true;
    } else {
      validated = false;
    }
    return validated;
  }

  /// Save changes for a song be it a new one or simply updating an old one
  Future<bool?> saveSong() async {
    bool? success;

    return success;
  }

  /// Remove a song from the records
  Future<bool?> deleteSong() async {
    bool? success;

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
            style: titleTextStyle.copyWith(fontSize: 14),
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
            style: titleTextStyle.copyWith(fontSize: 14),
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
