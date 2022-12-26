import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../model/base/book.dart';
import '../../model/general/general.dart';
import '../../repository/db_repository.dart';
import '../../repository/shared_prefs/local_storage.dart';
import '../../util/constants/pref_constants.dart';
import '../../webservice/book/book_web_service.dart';

@injectable
class SelectionVm with ChangeNotifierEx {
  late final SelectionNavigator navigator;
  final BookWebService api;
  final DbRepository db;
  final LocalStorage localStorage;

  SelectionVm(this.api, this.db, this.localStorage);

  bool isBusy = false;
  List<Selectable<Book>?> selectables = [];
  List<Selectable<Book>?> listedBooks = [];
  List<Book>? books = [];
  String selectedBooks = "";
  List<String> bookNos = [];

  RefreshController refreshController = RefreshController(initialRefresh: true);
  
  Future<void> init(SelectionNavigator screenNavigator) async {
    navigator = screenNavigator;
    selectedBooks = localStorage.getPrefString(PrefConstants.selectedBooksKey);
    if (selectedBooks.isNotEmpty) {
      bookNos = selectedBooks.split(",");
    }
    await fetchBooks();
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

  void onRefresh() async {
    await fetchBooks();
    refreshController.refreshCompleted();
  }

  void onLoading() async {
    await fetchBooks();
    refreshController.loadComplete();
  }

  /// Get the list of books
  Future<List<Book>?> fetchBooks() async {
    isBusy = true;
    notifyListeners();

    books = await api.fetchBooks();
    if (books!.isNotEmpty) {
      for (final book in books!) {
        bool predistinated = false;
        if (bookNos.contains(book.bookNo.toString())) predistinated = true;
        listedBooks.add(Selectable<Book>(book, predistinated));
      }
    }

    isBusy = false;
    notifyListeners();
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
    navigator.goToProgress();
  }
}

abstract class SelectionNavigator {
  void goToProgress();
}
