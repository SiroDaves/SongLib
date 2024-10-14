import 'dart:async';

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
  HomeBloc() : super(const _HomeState()) {
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
    emit(ProgressState());
    if (FlavorConfig.isProd()) {
      try {} catch (e) {
        emit(SuccessState());
      }
    } else {
      emit(SuccessState());
    }
  }

  Future<void> _onFetchData(
    HomeFetchData event,
    Emitter<HomeState> emit,
  ) async {
    emit(ProgressState());
    var books = await _dbRepo.fetchBooks();
    var songs = await _dbRepo.fetchSongExts();
    var likes = await _dbRepo.fetchLikedSongs();

    emit(
      LoadedState(books, songs, likes),
    );
  }

  Future<void> _onSortByBook(
    HomeSortByBook event,
    Emitter<HomeState> emit,
  ) async {
    emit(ProgressState());
    var filtered =
        event.songs.where((song) => song.book == event.book).toList();
    emit(FilteredState(filtered));
  }
}
