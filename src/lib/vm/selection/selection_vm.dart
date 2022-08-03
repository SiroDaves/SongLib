import 'package:flutter/material.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

import '../../model/base/book.dart';
import '../../model/base/selectable.dart';
import '../../model/base/song.dart';

@injectable
class SelectionVm with ChangeNotifierEx {
  late final SelectionNavigator selectionNavigator;

  SelectionVm();

  final ScrollController listScrollController = ScrollController();

  bool isBusy = false;
  List<Selectable<Book>?> selectables = [];
  List<Selectable<Book>?> listedBooks = [];
  List<Book>? books = [];
  List<Song>? songs = [];

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
    //books = await getBooks(dioService, listedBooks);
    return books;
  }
}

mixin SelectionNavigator {
  void goToHome();
}
