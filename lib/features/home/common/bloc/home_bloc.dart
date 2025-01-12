import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../../../../../common/repository/database_repository.dart';
import '../../../../../core/di/injectable.dart';
import '../../../../common/data/models/models.dart';
import '../../../../common/repository/local_storage.dart';
import '../../../../common/utils/app_util.dart';
import '../../../../common/utils/constants/pref_constants.dart';
import '../../../selection/common/domain/selection_repository.dart';

part 'home_event.dart';
part 'home_state.dart';

part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const _HomeState()) {
    on<SyncData>(_onSyncData);
    on<FetchData>(_onFetchData);
    on<FilterData>(_onFilterData);
    on<ResetData>(_onResetData);
  }

  final _selectRepo = SelectionRepository();
  final _localStorage = getIt<LocalStorage>();
  final _dbRepo = getIt<DatabaseRepository>();

  Future<void> _onSyncData(
    SyncData event,
    Emitter<HomeState> emit,
  ) async {
    String selectedBooks =
        _localStorage.getPrefString(PrefConstants.selectedBooksKey);
    var resp = await _selectRepo.getSongsByBooks(selectedBooks);
    try {
      if (resp.statusCode == 200) {
        List<dynamic> dataList = List<Map<String, dynamic>>.from(
          jsonDecode(resp.body)['data'],
        );
        var songs = dataList.map((item) => Song.fromJson(item)).toList();
        if (songs.isNotEmpty) {
          for (final song in songs) {
            await _dbRepo.syncSong(
              song.songId!,
              song.title!,
              song.alias!,
              song.content!,
            );
          }
        }
        emit(HomeDataSyncedState());
      }
    } catch (e) {
      logger("Error log: $e");
    }
  }

  Future<void> _onFetchData(
    FetchData event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeFetchingState());
    try {
      var books = await _dbRepo.fetchBooks();
      var songs = await _dbRepo.fetchSongs();
      emit(HomeDataFetchedState(books, songs));
    } catch (e) {
      logger('Unable to: $e');
      Sentry.captureException(e);
      emit(HomeFailureState('Unable to fetch songs'));
    }
  }

  Future<void> _onFilterData(
    FilterData event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeFilteringState());
    try {
      var songs = await _dbRepo.fetchSongs(bid: event.book.bookId!);
      var likes = await _dbRepo.fetchLikes();
      emit(HomeFilteredState(event.book, songs, likes));
    } catch (e) {
      logger('Unable to: $e');
      Sentry.captureException(e);
      emit(HomeFailureState('Unable to fetch songs'));
    }
  }

  Future<void> _onResetData(
    ResetData event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeFetchingState());
    try {
      await _dbRepo.removeAllBooks();
      await _dbRepo.removeAllSongs();
      _localStorage.clearData();
      emit(HomeResettedState());
    } catch (e) {
      logger('Unable to: $e');
      Sentry.captureException(e);
      emit(HomeResettedState());
    }
  }
}
