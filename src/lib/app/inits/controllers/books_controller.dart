import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../exports.dart';

/// The controller for the Books screen
class BooksController extends GetxController {
  final GetStorage userData = GetStorage();

  DioService dioService = DioService();
  final ScrollController listScrollController = ScrollController();

  List<Listed<Book>?> selected = [], listedBooks = [];
  List<Book>? books = [];
  BookRepository? bookRepo;

  @override
  void onInit() {
    super.onInit();
    dioService.init();
    bookRepo = Get.find<BookRepository>();
    userData.writeIfNull(PrefKeys.selectedBooks, '');
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  /// Get the list of books
  Future<List<Book>?> fetchBooks() async {
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
              for (int i = 0; i < books!.length; i++) {
                listedBooks.add(Listed<Book>(books![i]));
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

  void onBookSelected(int index) {
    listedBooks[index]!.isSelected = !listedBooks[index]!.isSelected;
    update();

    if (listedBooks[index]!.isSelected) {
      selected.add(listedBooks[index]);
    } else {
      selected.remove(listedBooks[index]);
    }
  }

  Future<void> areYouDoneDialog(BuildContext context) {
    if (selected.isNotEmpty) {
      return Alert(
        context: context,
        alertTitle: AppConstants.doneSelecting,
        alertMessage: AppConstants.doneSelectingBody,
        style: const AlertStyle(alertHeight: 60),
        buttons: [
          AlertButton(
            key: const ValueKey('${KeyConstants.booksScreenAlertButton}cancel'),
            text: AppConstants.cancel,
            onPressed: () => Navigator.pop(context),
          ),
          AlertButton(
            key:
                const ValueKey('${KeyConstants.booksScreenAlertButton}proceed'),
            text: AppConstants.proceed,
            onPressed: () {
              Navigator.pop(context);
              proceedtoSave();
            },
          ),
        ],
      ).show();
    } else {
      return Alert(
        context: context,
        alertTitle: AppConstants.noSelection,
        alertMessage: AppConstants.noSelectionBody,
        style: const AlertStyle(alertHeight: 40),
        buttons: [
          AlertButton(
            text: AppConstants.okay,
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ).show();
    }
  }

  /// Proceed to a saving books data
  Future<void> proceedtoSave() async {
    String selectedBooks = "";
    for (int i = 0; i < selected.length; i++) {
      Book book = selected[i]!.data;
      selectedBooks = "$selectedBooks${book.bookid},";
      await bookRepo!.saveBook(book);
    }

    try {
      selectedBooks = selectedBooks.substring(0, selectedBooks.length - 1);
      // ignore: empty_catches
    } on Exception {}
    // ignore: avoid_print
    print('Selected books: $selectedBooks');

    userData.write(PrefKeys.selectedBooks, selectedBooks);
    userData.write(PrefKeys.booksLoaded, true);

    Get.offAll(() => SongsView());
  }
}
