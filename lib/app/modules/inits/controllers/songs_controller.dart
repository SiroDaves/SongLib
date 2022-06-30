import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:http/http.dart' as http;

import '../../../exports.dart';

/// The controller for the Books screen
class SongsController extends GetxController {
  final GetStorage userData = GetStorage();

  final ScrollController listScrollController = ScrollController();

  int _limit = 20, _limitIncrement = 20;
  bool isLoading = false;

  late String currentUserId;
  Debouncer searchDebouncer = Debouncer(milliseconds: 300);

  List<Book>? books = [];

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
        !listScrollController.position.outOfRange) {
      _limit += _limitIncrement;
    }
  }

  /// Get the list of books
  Future<List<Book>?> fetchBooks() async {
    bool isConnected = await hasReliableInternetConnectivity();

    if (isConnected) {
      final EventObject? eventObject = await httpGet(
        client: http.Client(),
        url: ApiConstants.book,
      );

      try {
        if (eventObject!.id == EventConstants.requestSuccessful) {
          final BookList bookList = BookList.fromJson(
            json.decode(eventObject.response),
          );
          books = bookList.results;
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
}
