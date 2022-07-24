import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../exports.dart';

/// The controller for the Home screen
class HomeController extends GetxController {
  final GetStorage userData = GetStorage();

  final ScrollController bookListScrollController = ScrollController();
  final ScrollController songListScrollController = ScrollController();

  bool isBusy = false, isSearching = false;
  String selectedBooks = "";
  int mainBook = 0;

  DioService dioService = DioService();
  List<Book>? booksList = [];
  List<Song>? searchList = [], songsList = [];

  int selectedTab = 1;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  BookDaoStorage? bookDao;
  SongDaoStorage? songDao;

  @override
  void onInit() {
    super.onInit();
    bookDao = Get.find<BookDaoStorage>();
    songDao = Get.find<SongDaoStorage>();

    selectedBooks = userData.read(PrefKeys.selectedBooks);
    var bookids = selectedBooks.split(",");
    mainBook = int.parse(bookids[0]);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changeTab(int newTab) {
    selectedTab = newTab;
    update();
  }

  /// Get the data
  Future<void> fetchSongData() async {
    isBusy = true;
    update();

    booksList = await bookDao!.getAllBooks();
    songsList = searchList = await songDao!.getAllSongs();
    songsList!.removeWhere((item) => item.book != mainBook);

    isBusy = false;
    update();
  }
}
