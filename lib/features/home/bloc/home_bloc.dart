import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../common/data/models/models.dart';
import '../../../common/repository/database_repository.dart';
import '../../../common/utils/app_util.dart';
import '../../../core/di/injectable.dart';
import '../domain/home_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomeCheckVersion>(_onCheckVersion);
    on<HomeFetchData>(_onFetch);
    on<HomeSortByBook>(_onSortByBook);
  }

  final _dbRepo = getIt<DatabaseRepository>();
  final _homeRepo = HomeRepository();

  void _onCheckVersion(
    HomeCheckVersion event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: Status.inProgress));
    try {
      var resp = await _homeRepo.checkPlaystoreVersion();
      if (resp.status == 200) {
        if (event.currentVersion != resp.response['version']) {
          emit(state.copyWith(status: Status.updateFound, update: resp.response));
        } else {
          emit(state.copyWith(status: Status.loaded));
        }
        emit(state.copyWith(status: Status.loaded));
      } else {
        emit(state.copyWith(status: Status.loaded));
      }
    } catch (e) {
      logger("Error log: $e");
      emit(state.copyWith(status: Status.failure));
    }
  }

  Future<void> _onFetch(
    HomeFetchData event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: Status.inProgress));
    var books = await _dbRepo.fetchBooks();
    var songs = await _dbRepo.fetchSongExts();

    emit(state.copyWith(status: Status.loaded, books: books, songs: songs));
  }

  Future<void> _onSortByBook(
    HomeSortByBook event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: Status.inProgress));
    var filtered =
        state.songs.where((song) => song.book == event.book).toList();
    emit(state.copyWith(status: Status.filtered, filtered: filtered));
  }
}
