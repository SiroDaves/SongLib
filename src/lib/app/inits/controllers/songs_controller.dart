import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../exports.dart';

/// The controller for the Books screen
class SongsController extends GetxController {
  final GetStorage userData = GetStorage();

  DioService dioService = DioService();
  String selectedBooks = '';
  int progressValue = 0;
  List<Song>? songs = [];
  MyDatabase? db;

  @override
  void onInit() {
    super.onInit();
    dioService.init();
    db = Get.find<MyDatabase>();
    selectedBooks = userData.read(PrefKeys.selectedBooks);
  }

  @override
  void onReady() {
    super.onReady();
    db = Get.find<MyDatabase>();
  }

  @override
  void onClose() {}

  /// Get the list of songs
  Future<List<Song>?> fetchSongs() async {
    bool isConnected = await hasReliableInternetConnectivity();

    if (isConnected) {
      try {
        final result = await dioService.request(
          url:
              '${ApiConstants.song}?where={"book":{"\$in":[$selectedBooks]}}&order=songno&limit=10000',
          method: Method.get,
        );

        if (result != null) {
          if (result is dio.Response) {
            SongsResponse resp = SongsResponse.fromJson(result.data);
            songs = resp.results;

            if (songs!.isNotEmpty) {
              proceedtoSave();
            } else {
              showToast(
                text: "No data was found, try again later",
                state: ToastStates.error,
              );
            }
          } else {
            showToast(
              text: "An unknown error occurred",
              state: ToastStates.error,
            );
            songs = null;
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
      update();
      await db!.saveNewSong(songs![i]);
    }

    userData.write(PrefKeys.songsLoaded, true);

    Get.offAll(() => HomeView());
  }
}
