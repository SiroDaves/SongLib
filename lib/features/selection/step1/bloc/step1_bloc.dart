import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../common/data/models/basic_model.dart';
import '../../../../common/utils/app_util.dart';
import '../../../../common/utils/constants/pref_constants.dart';
import '../../../../common/data/models/book.dart';
import '../../../../common/repository/database_repository.dart';
import '../../../../common/repository/local_storage.dart';
import '../../../../core/di/injectable.dart';
import '../../common/domain/selection_repository.dart';

part 'step1_event.dart';
part 'step1_state.dart';
part 'step1_bloc.freezed.dart';

class Step1Bloc extends Bloc<Step1Event, Step1State> {
  Step1Bloc() : super(const _Step1State()) {
    on<FetchBooks>(_onFetchBooks);
    on<SaveBooks>(_onSaveBooks);
  }

  final _step1Repo = SelectionRepository();
  final _localStorage = getIt<LocalStorage>();
  final _dbRepo = getIt<DatabaseRepository>();

  void _onFetchBooks(
    FetchBooks event,
    Emitter<Step1State> emit,
  ) async {
    emit(Step1ProgressState());
    var resp = await _step1Repo.getBooks();
    String selectedBooksIds =
        _localStorage.getPrefString(PrefConstants.selectedBooksKey);
    List<String> selectedBooksNumbers = [];
    List<Selectable<Book>> booksListing = [];

    if (selectedBooksIds.isNotEmpty) {
      selectedBooksNumbers = selectedBooksIds.split(",");
    }
    try {
      switch (resp.statusCode) {
        case 200:
          List<dynamic> dataList = List<Map<String, dynamic>>.from(
            jsonDecode(resp.body)['data'],
          );
          var books = dataList.map((item) => Book.fromJson(item)).toList();
          for (final book in books) {
            bool setSelected = false;
            if (selectedBooksNumbers.contains(book.bookNo.toString())) {
              setSelected = true;
            }
            booksListing.add(Selectable<Book>(book, setSelected));
          }
          emit(Step1FetchedState(selectedBooksIds, books, booksListing));
          break;

        default:
          emit(Step1FailureState(resp.statusCode.toString()));
          break;
      }
    } catch (e) {
      logger("Error log: $e");
      emit(Step1FailureState('100'));
    }
  }

  void _onSaveBooks(
    SaveBooks event,
    Emitter<Step1State> emit,
  ) async {
    emit(Step1ProgressState());
    String selectedBooks = event.selectedBooksIds;
    try {
      if (event.selectedBooksIds.isNotEmpty) {
        await _dbRepo.removeAllBooks();
        _localStorage.setPrefString(
          PrefConstants.predistinatedBooksKey,
          selectedBooks,
        );
        selectedBooks = "";
      }
      for (int i = 0; i < event.books.length; i++) {
        final Book book = event.books[i];
        selectedBooks = "$selectedBooks${book.bookNo},";
        await _dbRepo.saveBook(book);
      }
      selectedBooks = selectedBooks.substring(0, selectedBooks.length - 1);
      _localStorage.setPrefString(
        PrefConstants.selectedBooksKey,
        selectedBooks,
      );

      _localStorage.setPrefBool(PrefConstants.dataIsSelectedKey, true);
    } catch (e) {
      logger('Unable to save books: $e');
    }

    emit(Step1SavedState(selectedBooks));
  }
}
