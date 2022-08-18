import 'package:flutter/material.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

import '../../model/base/book.dart';
import '../../model/base/selectable.dart';
import '../../model/base/song.dart';
import '../../repository/db_repository.dart';
import '../../repository/web_repository.dart';
import '../../repository/shared_prefs/local_storage.dart';
import '../../util/constants/pref_constants.dart';

@injectable
class SelectionVm with ChangeNotifierEx {
  late final SelectionNavigator selectionNavigator;
  final WebRepository web;
  final DbRepository db;
  final LocalStorage localStorage;

  int progress = 0;
  String state = '';
  String time = '00:00';

  SelectionVm(this.web, this.db, this.localStorage);

  final ScrollController listScrollController = ScrollController();

  bool isBusy = false;
  List<Selectable<Book>?> selectables = [];
  List<Selectable<Book>?> listedBooks = [];
  List<Book>? books = [];
  List<Song>? songs = [];
  String selectedBooks = "";

  Future<void> init(SelectionNavigator navigator) async {
    selectionNavigator = navigator;
  }

  void onBookSelected(int index) {
    try {
      listedBooks[index]!.isSelected = !listedBooks[index]!.isSelected;
      notifyListeners();

      if (listedBooks[index]!.isSelected) {
        selectables.add(listedBooks[index]);
      } else {
        selectables.remove(listedBooks[index]);
      }
    } catch (_) {}
  }

  /// Get the list of books
  Future<List<Book>?> fetchBooks() async {
    books = await web.fetchBooks();
    if (books!.isNotEmpty) {
      for (int i = 0; i < books!.length; i++) {
        try {
          listedBooks.add(Selectable<Book>(books![i]));
        } catch (_) {}
      }
      return books;
    }
    return null;
  }

  /// Proceed to a saving books data
  Future<void> saveBooks() async {
    for (int i = 0; i < selectables.length; i++) {
      try {
        final Book book = selectables[i]!.data;
        selectedBooks = "$selectedBooks${book.bookNo},";
        await db.saveBook(book);
      } catch (_) {}
    }

    try {
      selectedBooks = selectedBooks.substring(0, selectedBooks.length - 1);
    } catch (_) {}
    // ignore: avoid_print
    print('Selected books: $selectedBooks');

    localStorage.setPrefString(PrefConstants.selectedBooksKey, selectedBooks);
    await fetchSaveSongs();
  }

  /// Get the list of songs and save theme
  Future<void> fetchSaveSongs() async {
    isBusy = true;
    notifyListeners();

    songs = await web.fetchSongs(selectedBooks);
    if (songs!.isNotEmpty) {
      for (int i = 0; i < songs!.length; i++) {
        try {
          progress = (i / songs!.length * 100).toInt();

          switch (progress) {
            case 1:
              state = "On your marks ...";
              break;
            case 5:
              state = "Set, Ready ...";
              break;
            case 10:
              state = "Loading songs ...";
              break;
            case 20:
              state = "Patience pays ...";
              break;
            case 40:
              state = "Loading songs ...";
              break;
            case 75:
              state = "Thanks for your patience!";
              break;
            case 85:
              state = "Finishing up";
              break;
            case 95:
              state = "Almost done";
              break;
          }
          notifyListeners();

          await db.saveSong(songs![i]);
        } catch (_) {}
      }
    }

    isBusy = false;
    notifyListeners();

    localStorage.setPrefBool(PrefConstants.dataLoadedCheckKey, true);
    selectionNavigator.goToSearch();
  }
}

abstract class SelectionNavigator {
  void goToHome();
  void goToSearch();
}
