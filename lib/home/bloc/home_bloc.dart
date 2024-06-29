import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:injectable/injectable.dart';

import '../../common/utils/env/flavor_config.dart';
import '../../data/models/book.dart';
import '../../data/models/songext.dart';
import '../../data/repository/database_repository.dart';
import '../../di/injectable.dart';

part 'home_event.dart';
part 'home_state.dart';

part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomeCheckUpdates>(_onCheckUpdates);
    on<HomeUpdateApp>(_onUpdateApp);
    on<HomeFetchData>(_onFetch);
    on<HomeSortByBook>(_onSortByBook);
  }

  final _dbRepo = getIt<DatabaseRepository>();

  Future<void> _onCheckUpdates(
    HomeCheckUpdates event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: Status.inProgress));
    if (FlavorConfig.isProd()) {
      try {
        await InAppUpdate.checkForUpdate().then((updateInfo) {
          if (updateInfo.updateAvailability ==
              UpdateAvailability.updateAvailable) {
            emit(
              state.copyWith(
                status: Status.updateFound,
                feedback: 'There is a new app update',
              ),
            );
          } else {
            emit(state.copyWith(status: Status.success, feedback: ''));
          }
        });
      } catch (e) {
        emit(state.copyWith(status: Status.success, feedback: ''));
      }
    } else {
      emit(state.copyWith(status: Status.success, feedback: ''));
    }
  }

  Future<void> _onUpdateApp(
    HomeUpdateApp event,
    Emitter<HomeState> emit,
  ) async {
    InAppUpdate.performImmediateUpdate().then((appUpdateResult) {
      if (appUpdateResult == AppUpdateResult.success) {
        emit(
          state.copyWith(
            status: Status.updated,
            feedback: 'SongLib successfully Updated',
          ),
        );
      }
    });
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
