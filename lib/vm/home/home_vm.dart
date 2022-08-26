// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../../model/base/book.dart';
import '../../model/base/draft.dart';
import '../../model/base/listed.dart';
import '../../model/base/songext.dart';
import '../../repository/db_repository.dart';
import '../../repository/shared_prefs/local_storage.dart';
import '../../util/constants/pref_constants.dart';

@injectable
class HomeVm with ChangeNotifierEx {
  final DbRepository db;
  final LocalStorage localStorage;

  HomeVm(this.db, this.localStorage);

  bool isBusy = false;
  String selectedBooks = "";
  int mainBook = 0, currentPage = 1;

  List<Book>? books = [];
  List<SongExt>? filtered = [], songs = [];
  List<Listed>? listeds = [];
  List<Draft>? drafts = [];

  String? title, content;
  TextEditingController? titleController, contentController;

  Future<void> init(HomeNavigator navigator) async {
    titleController = TextEditingController();
    contentController = TextEditingController();

    selectedBooks = localStorage.getPrefString(PrefConstants.selectedBooksKey);
    final List<String> bookNos = selectedBooks.split(",");
    mainBook = int.parse(bookNos[0]);
    await fetchData();
  }

  /// Get the data from the DB
  Future<void> fetchData() async {
    isBusy = true;
    notifyListeners();

    listeds = await db.fetchListeds();
    books = await db.fetchBooks();
    songs = await db.fetchSongs();
    await selectSongbook(mainBook);
    drafts = await db.fetchDrafts();

    isBusy = false;
    notifyListeners();
  }

  /// Get the listed data from the DB
  Future<void> fetchListedData() async {
    notifyListeners();
    try {
      listeds = await db.fetchListeds();
    } catch (exception, stackTrace) {
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
    }
    notifyListeners();
  }

  /// Get the song data from the DB
  Future<void> fetchSearchData() async {
    notifyListeners();
    try {
      books = await db.fetchBooks();
      songs = await db.fetchSongs();
      await selectSongbook(mainBook);
    } catch (exception, stackTrace) {
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
    }
    notifyListeners();
  }

  /// Get the notes data from the DB
  Future<void> fetchDraftsData() async {
    notifyListeners();
    try {
      drafts = await db.fetchDrafts();
    } catch (exception, stackTrace) {
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
    }
    notifyListeners();
  }

  /// Set songbook
  Future<void> selectSongbook(int book) async {
    isBusy = true;
    notifyListeners();
    mainBook = book;

    try {
      filtered!.clear();
      for (int i = 0; i < songs!.length; i++) {
        if (songs![i].book == book) {
          filtered!.add(songs![i]);
        }
      }
    } catch (exception, stackTrace) {
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
    }

    isBusy = false;
    notifyListeners();
  }
}

abstract class HomeNavigator {
  void goToLikes();
  void goToHistories();
  void goToSettings();
}
