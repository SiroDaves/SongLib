import 'package:dio/dio.dart' as dio;

import '../exports.dart';

/// Get the list of books
Future<List<Song>?> getSongs(
  DioService dioService,
  String? selectedBooks,
) async {
  await Future.delayed(const Duration(seconds: 1), () {});

  List<Song>? songs = [];
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
            //
          } else {
            showToast(
              text: "No data was found, try again later",
              state: ToastStates.error,
            );
            songs = null;
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
      showToast(
        text: "An unknown error occurred",
        state: ToastStates.error,
      );
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
