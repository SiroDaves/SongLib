import 'package:flutter/material.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

import '../model/base/book.dart';
import '../model/base/selectable.dart';
import '../model/base/song.dart';
import '../repository/selection_repository.dart';
import '../repository/shared_prefs/local_storage.dart';

@injectable
class SelectionVm with ChangeNotifierEx {
  late final SelectionNavigator selectionNavigator;
  final LocalStorage localStorage;
  final SelectionRepository selectionRepo;

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
    return books;
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

    localStorage.setPreferenceString(localStorage.selectedBooks, selectedBooks);
    //fetchSongs();
  }

  /// Get the list of songs
  Future<List<Song>?> fetchSongs() async {
    songs = await selectionRepo.fetchSongs(selectedBooks);
    return songs;
  }
}

mixin SelectionNavigator {
  void goToHome();
}
