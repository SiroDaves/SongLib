import 'package:dio/dio.dart' as dio;

import '../exports.dart';

/// Get the list of books
Future<List<Book>?> getBooks(
  DioService dioService,
  List<Selectable<Book>?> selectables
) async {
  List<Book>? books = [];
  bool isConnected = await hasReliableInternetConnectivity();

  if (isConnected) {
    try {
      final result = await dioService.request(
        url: '${ApiConstants.book}?where={"enabled":1}&order=bookid',
        method: Method.get,
      );

      if (result != null) {
        if (result is dio.Response) {
          BooksResponse resp = BooksResponse.fromJson(result.data);
          books = resp.results;

          if (books!.isNotEmpty) {
            for (int i = 0; i < books.length; i++) {
              selectables.add(Selectable<Book>(books[i]));
            }
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
          books = null;
        }
      }
    } catch (exception) {
      books = null;
    }
  } else {
    showToast(
      text: "You don't seem to have reliable internet connection",
      state: ToastStates.error,
    );
    books = null;
  }
  return books;
}
