import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../../../exports.dart';

/// The controller for the Books screen
class SongsController extends GetxController {
  final GetStorage userData = GetStorage();

  String selectedBooks = '';
  int progressValue = 0;
  List<Song>? songs = [];
  MyDatabase? db;

  @override
  void onInit() {
    super.onInit();
    selectedBooks = userData.read(PrefKeys.selectedBooks);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  /// Get the list of songs
  Future<List<Song>?> fetchSongs() async {
    bool isConnected = await hasReliableInternetConnectivity();

    if (isConnected) {
      final EventObject eventObject = await httpGet(
        client: http.Client(),
        url: '${ApiConstants.song}?where={"book":{"\$in":[$selectedBooks]}}',
      );

      try {
        if (eventObject.id == EventConstants.requestSuccessful) {
          final SongsResponse songResponse = SongsResponse.fromJson(
            json.decode(eventObject.response),
          );
          songs = songResponse.results;

          if (songs!.isNotEmpty) {
            proceedtoSave();
          } else {
            showToast(
              text: "You don't seem to have reliable internet connection",
              state: ToastStates.error,
            );
          }
        }
      } catch (exception) {
        songs = null;
      }
    } else {
      showToast(
        text: "You don't seem to have reliable internet connection",
        state: ToastStates.error,
      );
      songs = null;
    }
    return songs;
  }

  /// Proceed to a saving songs data
  Future<void> proceedtoSave() async {
    for (int i = 0; i < songs!.length; i++) {
      progressValue = (i / songs!.length * 100).toInt();
      await db!.saveNewSong(songs![i]);
    }

    userData.write(PrefKeys.songsLoaded, true);

    Get.offAll(() => HomeView(database: db!));
  }
}
