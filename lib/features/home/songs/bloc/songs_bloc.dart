import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/data/models/book.dart';
import '../../../../common/data/models/songext.dart';
import '../../../../common/repository/database_repository.dart';
import '../../../../core/di/injectable.dart';

part 'songs_event.dart';
part 'songs_state.dart';

part 'songs_bloc.freezed.dart';

@injectable
class SongsBloc extends Bloc<SongsEvent, SongsState> {
  SongsBloc() : super(const _SongsState()) {
    on<FetchBooks>(_onFetchBooks);
    on<FetchSongs>(_onFetchSongs);
  }

  final _dbRepo = getIt<DatabaseRepository>();

  Future<void> _onFetchBooks(
    FetchBooks event,
    Emitter<SongsState> emit,
  ) async {
    emit(ProgressState());
    var books = await _dbRepo.fetchBooks();
    emit(BooksFetchedState(books));
  }

  Future<void> _onFetchSongs(
    FetchSongs event,
    Emitter<SongsState> emit,
  ) async {
    emit(ProgressState());
    var songs = await _dbRepo.fetchSongs(event.book);
    emit(SongsFetchedState(songs));
  }
}
