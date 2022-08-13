import 'package:flutter/material.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

import '../../model/base/book.dart';
import '../../model/base/selectable.dart';
import '../../model/base/song.dart';
import '../../repository/selection_repository.dart';
import '../../repository/shared_prefs/local_storage.dart';
import '../../util/constants/pref_constants.dart';

@injectable
class SelectionVm with ChangeNotifierEx {
  late final SelectionNavigator selectionNavigator;
  final SelectionRepository selectionRepo;
  final LocalStorage localStorage;

  SelectionVm(this.selectionRepo, this.localStorage);

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
    books = await selectionRepo.fetchBooks();
    if (books!.isNotEmpty) {
      return books;
    }
    return null;
  }

  /// Proceed to a saving books data
  Future<void> saveBooks() async {
    for (int i = 0; i < selectables.length; i++) {
      final Book book = selectables[i]!.data;
      selectedBooks = "$selectedBooks${book.bookNo},";
      await selectionRepo.saveBook(book);
    }

    try {
      selectedBooks = selectedBooks.substring(0, selectedBooks.length - 1);
      // ignore: empty_catches
    } on Exception {}
    // ignore: avoid_print
    print('Selected books: $selectedBooks');

    localStorage.setPreferenceString(
        PrefConstants.selectedBooksKey, selectedBooks);
    await fetchSongs();
  }

  /// Get the list of songs
  Future<List<Song>?> fetchSongs() async {
    isBusy = true;
    notifyListeners();

    songs = await selectionRepo.fetchSongs(selectedBooks);
    return songs;
  }

  /// Proceed to a saving songs data
  Future<void> saveSongs() async {
    for (int i = 0; i < songs!.length; i++) {
      await selectionRepo.saveSong(songs![i]);
    }

    isBusy = false;
    notifyListeners();

    localStorage.setPreferenceBool(PrefConstants.dataLoadedCheckKey, true);
    selectionNavigator.goToHome();
  }
}

abstract class SelectionNavigator {
  void goToHome();
}
