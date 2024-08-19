import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../common/utils/date_util.dart';
import '../../../common/data/models/history.dart';
import '../../../common/data/models/song.dart';
import '../../../common/data/models/songext.dart';
import '../../../common/repository/database_repository.dart';
import '../../../core/di/injectable.dart';
import '../common/presentor_utils.dart';

part 'presentor_event.dart';
part 'presentor_state.dart';

part 'presentor_bloc.freezed.dart';

@injectable
class PresentorBloc extends Bloc<PresentorEvent, PresentorState> {
  PresentorBloc() : super(const PresentorState()) {
    on<PresentorLoadSong>(_onLoadSong);
    on<PresentorLikeSong>(_onLikeSong);
    on<PresentorSaveHistory>(_onSaveHistory);
  }

  final _dbRepo = getIt<DatabaseRepository>();

  Future<void> _onLoadSong(
    PresentorLoadSong event,
    Emitter<PresentorState> emit,
  ) async {
    emit(state.copyWith(status: Status.inProgress));
    var presentor = await loadSong(event.song);
    emit(state.copyWith(
      status: Status.loaded,
      songBook: presentor.songBook,
      songTitle: presentor.songTitle,
      hasChorus: presentor.hasChorus,
      songVerses: presentor.songVerses,
      widgetTabs: presentor.widgetTabs,
      widgetContent: presentor.widgetContent,
    ));
  }

  Future<void> _onLikeSong(
    PresentorLikeSong event,
    Emitter<PresentorState> emit,
  ) async {
    emit(state.copyWith(status: Status.inProgress));
    Song? song = await _dbRepo.findSongById(event.song.rid);
    event.song.liked = !event.song.liked;
    await _dbRepo.updateSong(song!);

    emit(
      state.copyWith(status: event.song.liked ? Status.liked : Status.unliked),
    );
  }

  Future<void> _onSaveHistory(
    PresentorSaveHistory event,
    Emitter<PresentorState> emit,
  ) async {
    await _dbRepo.saveHistory(
      History(song: event.song.rid, created: getCurrentDate()),
    );

    emit(state.copyWith(status: Status.loaded));
  }
}
