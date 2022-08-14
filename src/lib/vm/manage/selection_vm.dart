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
    listedBooks[index]!.isSelected = !listedBooks[index]!.isSelected;
    notifyListeners();

    if (listedBooks[index]!.isSelected) {
      selectables.add(listedBooks[index]);
    } else {
      selectables.remove(listedBooks[index]);
    }
  }

  /// Get the list of books
  Future<List<Book>?> fetchBooks() async {
    books = await web.fetchBooks();
    if (books!.isNotEmpty) {
      for (int i = 0; i < books!.length; i++) {
        listedBooks.add(Selectable<Book>(books![i]));
      }
      return books;
    }
    return null;
  }

  /// Proceed to a saving books data
  Future<void> saveBooks() async {
    for (int i = 0; i < selectables.length; i++) {
      final Book book = selectables[i]!.data;
      selectedBooks = "$selectedBooks${book.bookNo},";
      await db.saveBook(book);
    }

    try {
      selectedBooks = selectedBooks.substring(0, selectedBooks.length - 1);
      // ignore: empty_catches
    } on Exception {}
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
        await db.saveSong(songs![i]);
      }
    }

    isBusy = false;
    notifyListeners();

    localStorage.setPrefBool(PrefConstants.dataLoadedCheckKey, true);
    selectionNavigator.goToHome();
  }
}

abstract class SelectionNavigator {
  void goToHome();
}
