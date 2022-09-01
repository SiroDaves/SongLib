import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

import '../../model/base/book.dart';
import '../../model/base/selectable.dart';
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

  bool isBusy = false;
  List<Selectable<Book>?> selectables = [];
  List<Selectable<Book>?> listedBooks = [];
  List<Book>? books = [];
  String selectedBooks = "";
  List<String> bookNos = [];

  Future<void> init(SelectionNavigator navigator) async {
    selectionNavigator = navigator;
    selectedBooks = localStorage.getPrefString(PrefConstants.selectedBooksKey);
    if (selectedBooks.isNotEmpty) {
      bookNos = selectedBooks.split(",");
    }
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
      for (final book in books!) {
        bool predistinated = false;
        if (bookNos.contains(book.bookNo.toString())) predistinated = true;
        listedBooks.add(Selectable<Book>(book, predistinated));
      }
    }
    return books;
  }

  /// Proceed to a saving books data
  Future<void> saveBooks() async {
    isBusy = true;
    notifyListeners();

    try {
      if (selectedBooks.isNotEmpty) {
        await db.deleteBooks();
        localStorage.setPrefString(
            PrefConstants.predistinatedBooksKey, selectedBooks);
        selectedBooks = "";
      }
      for (int i = 0; i < selectables.length; i++) {
        final Book book = selectables[i]!.data;
        selectedBooks = "$selectedBooks${book.bookNo},";
        await db.saveBook(book);
      }
    } catch (_) {}

    try {
      selectedBooks = selectedBooks.substring(0, selectedBooks.length - 1);
    } catch (_) {}

    isBusy = false;
    notifyListeners();

    localStorage.setPrefString(PrefConstants.selectedBooksKey, selectedBooks);
    selectionNavigator.goToProgress();
  }
}

abstract class SelectionNavigator {
  void goToProgress();
}
