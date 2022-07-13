import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../exports.dart';

/// The controller for the Home screen
class HomeController extends GetxController {
  final GetStorage userData = GetStorage();
  
  final ScrollController bookListScrollController = ScrollController();
  final ScrollController songListScrollController = ScrollController();

  bool isLoading = false, isSearching = false;

  List<Book>? books = [];
  List<Song>? songs = [];
  MyDatabase? db;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  /// Get the list of books
  Future<List<Book>?> fetchBookList() async {
    books = await db!.bookList();
    return books;
  }

  /// Get the list of songs
  Future<List<Song>?> fetchSongList() async {
    songs = await db!.songList();
    return songs;
  }

  /// Set searching mode on
  Future<void> setSearchingMode(bool mode) async {
    isSearching = mode;
    update();
  }
}
