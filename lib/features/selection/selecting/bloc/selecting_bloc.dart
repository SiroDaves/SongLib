import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/utils/app_util.dart';
import '../../../../common/utils/constants/pref_constants.dart';
import '../../../../common/data/models/basic_model.dart';
import '../../../../common/data/models/book.dart';
import '../../../../common/repository/database_repository.dart';
import '../../../../common/repository/local_storage.dart';
import '../../../../core/di/injectable.dart';
import '../../common/domain/selection_repository.dart';

part 'selecting_event.dart';
part 'selecting_state.dart';
part 'selecting_bloc.freezed.dart';

@injectable
class SelectingBloc extends Bloc<SelectingEvent, SelectingState> {
  SelectingBloc() : super(const SelectingState()) {
    on<SelectingBooksFetch>(_onFetchData);
    on<SelectingSubmitData>(_onSubmitData);
  }

  final _selectingRepo = SelectionRepository();
  final _localStorage = getIt<LocalStorage>();
  final _dbRepo = getIt<DatabaseRepository>();

  void _onFetchData(
    SelectingBooksFetch event,
    Emitter<SelectingState> emit,
  ) async {
    emit(state.copyWith(status: Status.inProgress));
    var resp = await _selectingRepo.getBooks();
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
          emit(
            state.copyWith(
              status: Status.booksFetched,
              selectedBooksIds: selectedBooksIds,
              booksListing: booksListing,
            ),
          );
          break;

        default:
          emit(
            state.copyWith(
              status: Status.failure,
              feedback: resp.statusCode.toString(),
            ),
          );
          break;
      }
    } catch (e) {
      logger("Error log: $e");
      emit(state.copyWith(status: Status.failure, feedback: '100'));
    }
  }

  void _onSubmitData(
    SelectingSubmitData event,
    Emitter<SelectingState> emit,
  ) async {
    emit(state.copyWith(status: Status.inProgress));
    String selectedBooks = state.selectedBooksIds;
    try {
      if (state.selectedBooksIds.isNotEmpty) {
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

    emit(state.copyWith(
      status: Status.booksSaved,
      selectedBooksIds: selectedBooks,
    ));
  }
}
