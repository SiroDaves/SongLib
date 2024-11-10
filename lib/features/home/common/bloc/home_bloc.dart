import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../../common/repository/database_repository.dart';
import '../../../../../core/di/injectable.dart';
import '../../../../common/data/models/models.dart';

part 'home_event.dart';
part 'home_state.dart';

part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const _HomeState()) {
    on<FetchData>(_onFetchData);
    on<FilterData>(_onFilterData);
  }

  final _dbRepo = getIt<DatabaseRepository>();

  Future<void> _onFetchData(
    FetchData event,
    Emitter<HomeState> emit,
  ) async {
    emit(FetchingState());
    var books = await _dbRepo.fetchBooks();
    var songs = await _dbRepo.fetchSongs(books[0].bookId!);
    emit(FetchedState(books, songs));
  }

  Future<void> _onFilterData(
    FilterData event,
    Emitter<HomeState> emit,
  ) async {
    emit(FilteringState());
    var songs = await _dbRepo.fetchSongs(event.book.bookId!);
    var likes = await _dbRepo.fetchLikes();
    emit(FilteredState(event.book, songs, likes));
  }
}
