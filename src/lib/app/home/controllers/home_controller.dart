import 'package:dio/dio.dart' as dio;
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
  String selectedBooks = "";
  int mainBook = 0;

  DioService dioService = DioService();
  List<Book>? booksList = [];
  List<Song>? searchList = [], songsList = [];
  MyDatabase? db;

  int selectedTab = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  

  @override
  void onInit() {
    super.onInit();
    dioService.init();
    db = Get.find<MyDatabase>();
    selectedBooks = userData.read(PrefKeys.selectedBooks);
    var bookids = selectedBooks.split(",");
    mainBook = int.parse(bookids[0]);
  }

  @override
  void onReady() {
    super.onReady();
    db = Get.find<MyDatabase>();
  }

  @override
  void onClose() {}

  void onTabTapped(int index) {
    selectedTab = index;
    update();
  }

  /// Get the list of books
  Future<List<Book>?> fetchBookList() async {
    booksList = await db!.bookList();
    return booksList;
  }

  /// Get the list of songs
  Future<List<Song>?> fetchFullSongList() async {
    searchList = await db!.songList();
    return searchList;
  }

  /// Get the list of songs
  Future<List<Song>?> fetchSongsByBook() async {
    songsList = await db!.songList();
    songsList!.removeWhere((item) => item.book != mainBook);
    return songsList;
  }

  /// Get the list of songs for the current book
  Future<void> resetBookSongList(Book book) async {
    songsList = searchList;
    mainBook = book.bookid!;
    songsList!.removeWhere((item) => item.book != mainBook);
    update();
  }
}
