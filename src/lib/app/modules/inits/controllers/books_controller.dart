import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../../../exports.dart';

/// The controller for the Books screen
class BooksController extends GetxController {
  final GetStorage userData = GetStorage();

  final ScrollController listScrollController = ScrollController();

  List<Listed<Book>?> selected = [], listedBooks = [];
  List<Book>? books = [];
  MyDatabase? db;

  @override
  void onInit() {
    super.onInit();
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
      final EventObject eventObject = await httpGet(
        client: http.Client(),
        url: '${ApiConstants.book}?where={"enabled":1}&order=bookid',
      );

      try {
        if (eventObject.id == EventConstants.requestSuccessful) {
          final BooksResponse bookResponse = BooksResponse.fromJson(
            json.decode(eventObject.response),
          );
          books = bookResponse.results;
          //books!.removeWhere((item) => item.enabled == 0);
          //books!.sort((a, b) => a.bookid!.compareTo(b.bookid!));

          if (books!.isNotEmpty) {
            for (int i = 0; i < books!.length; i++) {
              listedBooks.add(
                Listed<Book>(books![i]),
              );
            }
          } else {
            showToast(
              text: "You don't seem to have reliable internet connection",
              state: ToastStates.error,
            );
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
        alertMessage: AppConstants.doneSelecting,
        style: const AlertStyle(alertHeight: 40),
        buttons: [
          AlertButton(
            text: AppConstants.cancel,
            onPressed: () => Navigator.pop(context),
          ),
          AlertButton(
            text: AppConstants.proceed,
            onPressed: () {
              Navigator.pop(context);
              submitAction();
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
  Future<void> submitAction() async {
    String selectedBooks = "";
    for (int i = 0; i < selected.length; i++) {
      Book book = selected[i]!.data;
      selectedBooks = "$selectedBooks${book.bookid},";
    }

    try {
      selectedBooks = selectedBooks.substring(0, selectedBooks.length - 1);
      // ignore: empty_catches
    } on Exception {}
    // ignore: avoid_print
    print('Selected books: $selectedBooks');

    await db!.saveBooks(selected);

    userData.write(PrefKeys.selectedBooks, selectedBooks);
    userData.write(PrefKeys.booksLoaded, true);

    Get.offAll(() => SongsView(database: db!));
  }
}
