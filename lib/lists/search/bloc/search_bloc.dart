import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../data/models/book.dart';
import '../../../data/models/songext.dart';
import '../../../data/repository/database_repository.dart';
import '../../../di/injectable.dart';

part 'search_event.dart';
part 'search_state.dart';

part 'search_bloc.freezed.dart';

@injectable
class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(const SearchState()) {
    on<SearchFetchData>(_onFetch);
    on<SearchSelect>(_onSelect);
    on<SearchSongs>(_onSearch);
  }

  final _dbRepo = getIt<DatabaseRepository>();

  Future<void> _onFetch(
    SearchFetchData event,
    Emitter<SearchState> emit,
  ) async {
    emit(state.copyWith(status: Status.inProgress));
    var books = await _dbRepo.fetchBooks();
    var songs = await _dbRepo.fetchSongExts();

    emit(state.copyWith(status: Status.loaded, books: books, songs: songs));
  }

  Future<void> _onSelect(
    SearchSelect event,
    Emitter<SearchState> emit,
  ) async {
    emit(state.copyWith(status: Status.inProgress));

    List<SongExt> tempList = [];
    for (int i = 0; i < state.songs.length; i++) {
      if (state.songs[i].book == event.book.bookNo) {
        tempList.add(state.songs[i]);
      }
    }

    emit(state.copyWith(status: Status.selected, filtered: tempList));
  }

  Future<void> _onSearch(
    SearchSongs event,
    Emitter<SearchState> emit,
  ) async {}
}
