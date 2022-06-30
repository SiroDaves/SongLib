import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:http/http.dart' as http;

import '../../../exports.dart';

/// The controller for the Books screen
class BooksController extends GetxController {
  final GetStorage userData = GetStorage();

  final ScrollController listScrollController = ScrollController();

  List<Listed<Book>?> selected = [], listedBooks = [];
  List<Book>? books = [];

  bool isLoading = false;

  late String currentUserId;
  Debouncer searchDebouncer = Debouncer(milliseconds: 300);

  @override
  void onInit() {
    super.onInit();
    listScrollController.addListener(scrollListener);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void scrollListener() {
    if (listScrollController.offset >=
            listScrollController.position.maxScrollExtent &&
        !listScrollController.position.outOfRange) {}
  }

  /// Get the list of books
  Future<List<Book>?> fetchBooks() async {
    bool isConnected = await hasReliableInternetConnectivity();

    if (isConnected) {
      final EventObject? eventObject = await httpGet(
        client: http.Client(),
        url: ApiConstants.book + '?where={"enabled":1}&order=bookid',
      );

      try {
        if (eventObject!.id == EventConstants.requestSuccessful) {
          final BookList bookList = BookList.fromJson(
            json.decode(eventObject.response),
          );
          books = bookList.results;
          //books!.removeWhere((item) => item.enabled == 0);
          //books!.sort((a, b) => a.bookid!.compareTo(b.bookid!));

          for (int i = 0; i < books!.length; i++) {
            listedBooks.add(
              Listed<Book>(books![i]),
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
      String selectedbooks = "";
      for (int i = 0; i < selected.length; i++) {
        selectedbooks =
            '$selectedbooks ${(i + 1)} .  ${selected[i]!.data.title!}  -  ${selected[i]!.data.songs!}';
        //AppStrings.songsPrefix;
      }

      return Alert(
        context: context,
        alertTitle: AppConstants.doneSelecting,
        alertWidget: Text(selectedbooks),
        style: AlertStyle(alertHeight: (selected.length * 30).toDouble()),
        buttons: [
          AlertButton(
            text: AppConstants.cancel,
            onPressed: () => Navigator.pop(context),
          ),
          AlertButton(
            text: AppConstants.proceed,
            onPressed: () {
              Navigator.pop(context);
              goToNextScreen();
            },
          ),
        ],
      ).show();
    } else {
      return Alert(
        context: context,
        alertTitle: AppConstants.justAMinute,
        alertMessage: AppConstants.noSelection,
        style: const AlertStyle(alertHeight: 150),
        buttons: [
          AlertButton(
            text: AppConstants.okay,
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ).show();
    }
  }

  /// Proceed to a newer screen
  Future<void> goToNextScreen() async {
    /*await saveBooks(selected);
    informer.hide();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => SongsLoad()));*/
  }
}
