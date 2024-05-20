import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../data/models/book.dart';
import '../../data/models/songext.dart';
import '../../data/repository/database_repository.dart';
import '../../di/injectable.dart';
import '../common/sorting_utils.dart';

part 'home_event.dart';
part 'home_state.dart';

part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomeFetchData>(_onFetch);
    on<HomeSelect>(_onSelect);
    on<HomeSearch>(_onSearch);
  }

  final _dbRepo = getIt<DatabaseRepository>();

  Future<void> _onFetch(
    HomeFetchData event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: Status.inProgress));
    var books = await _dbRepo.fetchBooks();
    var songs = await _dbRepo.fetchSongExts();

    emit(state.copyWith(status: Status.loaded, books: books, songs: songs));
  }

  Future<void> _onSelect(
    HomeSelect event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: Status.inProgress));

    var filtered = await compute(
      sortSongsByBook,
      SongExtSort(event.book.bookNo!, state.songs),
    );

    emit(state.copyWith(status: Status.sorted, filtered: filtered));
  }

  Future<void> _onSearch(
    HomeSearch event,
    Emitter<HomeState> emit,
  ) async {}
}
