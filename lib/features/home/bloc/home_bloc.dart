import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../common/utils/env/flavor_config.dart';
import '../../../common/data/models/book.dart';
import '../../../common/data/models/songext.dart';
import '../../../common/repository/database_repository.dart';
import '../../../core/di/injectable.dart';

part 'home_event.dart';
part 'home_state.dart';

part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomeCheckVersion>(_onCheckVersion);
    on<HomeFetchData>(_onFetchData);
    on<HomeSortByBook>(_onSortByBook);
  }

  final _dbRepo = getIt<DatabaseRepository>();
  //final _homeRepo = HomeRepository();

  void _onCheckVersion(
    HomeCheckVersion event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: Status.inProgress));
    if (FlavorConfig.isProd()) {
      try {} catch (e) {
        emit(state.copyWith(status: Status.success, feedback: ''));
      }
    } else {
      emit(state.copyWith(status: Status.success, feedback: ''));
    }
  }

  Future<void> _onFetchData(
    HomeFetchData event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: Status.inProgress));
    var books = await _dbRepo.fetchBooks();
    var songs = await _dbRepo.fetchSongExts();
    var likes = await _dbRepo.fetchLikedSongs();

    emit(
      state.copyWith(
        status: Status.loaded,
        books: books,
        songs: songs,
        likes: likes,
      ),
    );
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
