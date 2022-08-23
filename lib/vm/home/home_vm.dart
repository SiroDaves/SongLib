import 'package:flutter/material.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../../model/base/book.dart';
import '../../model/base/draft.dart';
import '../../model/base/historyext.dart';
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
  List<SongExt>? filtered = [], songs = [], likes = [];

  List<HistoryExt>? histories = [];
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

    try {
      books = await db.fetchBooks();
      likes = await db.fetchLikedSongs();
      histories = await db.fetchHistories();
      drafts = await db.fetchDrafts();
      listeds = await db.fetchListeds();
      songs = await db.fetchSongs();
      await selectSongbook(mainBook);
    } catch (exception, stackTrace) {
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
    }

    isBusy = false;
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
