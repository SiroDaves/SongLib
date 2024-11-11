import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import '../../../../../common/repository/database_repository.dart';
import '../../../../../core/di/injectable.dart';
import '../../../../common/data/models/models.dart';
import '../../../../common/utils/app_util.dart';

part 'home_event.dart';
part 'home_state.dart';

part 'home_bloc.freezed.dart';

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
    emit(HomeFetchingState());
    try {
      var books = await _dbRepo.fetchBooks();
      var songs = await _dbRepo.fetchSongs();
      emit(HomeFetchedState(books, songs));
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
}
