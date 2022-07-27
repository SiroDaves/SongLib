import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../exports.dart';

/// The controller for the Data Initializing screen
class SelectionController extends GetxController {
  final GetStorage userData = GetStorage();

  DioService dioService = DioService();
  final ScrollController listScrollController = ScrollController();

  bool isBusy = false;
  List<Selectable<Book>?> selectables = [];
  List<Selectable<Book>?> listedBooks = [];
  List<Book>? books = [];
  List<Song>? songs = [];

  BookDaoStorage? bookDao;
  SongDaoStorage? songDao;
  MyDatabase? database;

  String selectedBooks = "";

  @override
  void onInit() {
    super.onInit();
    dioService.init();
    database = Get.find<MyDatabase>();
    bookDao = Get.find<BookDaoStorage>();
    songDao = Get.find<SongDaoStorage>();
  }

  @override
  void onReady() {
    super.onReady();
    userData.writeIfNull(PrefKeys.selectedBooks, '');
    database!.deleteAllData();
  }

  @override
  void onClose() {}

  void onBookSelected(int index) {
    listedBooks[index]!.isSelected = !listedBooks[index]!.isSelected;
    update();

    if (listedBooks[index]!.isSelected) {
      selectables.add(listedBooks[index]);
    } else {
      selectables.remove(listedBooks[index]);
    }
  }

  /// Get the list of books
  Future<List<Book>?> fetchBooks() async {
    books = await getBooks(dioService, listedBooks);
    return books;
  }

  /// Proceed to a saving books data
  Future<void> saveBooks() async {
    for (int i = 0; i < selectables.length; i++) {
      Book book = selectables[i]!.data;
      selectedBooks = "$selectedBooks${book.bookid},";
      await bookDao!.createBook(book);
    }

    try {
      selectedBooks = selectedBooks.substring(0, selectedBooks.length - 1);
      // ignore: empty_catches
    } on Exception {}
    // ignore: avoid_print
    print('Selected books: $selectedBooks');

    userData.write(PrefKeys.selectedBooks, selectedBooks);
    fetchSongs();
  }

  /// Get the list of songs
  Future<void> fetchSongs() async {
    isBusy = true;
    update();

    songs = await getSongs(dioService, selectedBooks);
    if (songs!.isNotEmpty) {
      saveSongs();
    }
  }

  /// Proceed to a saving songs data
  Future<void> saveSongs() async {
    for (int i = 0; i < songs!.length; i++) {
      await songDao!.createSong(songs![i]);
    }

    isBusy = false;
    update();

    userData.write(PrefKeys.dataLoaded, true);
    Get.offAll(() => HomeView());
  }
}
