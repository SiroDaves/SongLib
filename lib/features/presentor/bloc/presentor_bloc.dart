import 'dart:async';

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
  PresentorBloc() : super(const _PresentorState()) {
    on<LoadSong>(_onLoadSong);
    on<LikeSong>(_onLikeSong);
    on<SaveHistory>(_onSaveHistory);
  }

  final _dbRepo = getIt<DatabaseRepository>();

  Future<void> _onLoadSong(
    LoadSong event,
    Emitter<PresentorState> emit,
  ) async {
    emit(ProgressState());
    var presentor = await loadSong(event.song);
    emit(LoadedState(
      presentor.songVerses,
      presentor.widgetTabs,
      presentor.widgetContent,
    ));
  }

  Future<void> _onLikeSong(
    LikeSong event,
    Emitter<PresentorState> emit,
  ) async {
    emit(ProgressState());
    Song? song = await _dbRepo.findSongById(event.song.rid);
    event.song.liked = !event.song.liked;
    await _dbRepo.updateSong(song!);
    emit(LikedState(event.song.liked));
  }

  Future<void> _onSaveHistory(
    SaveHistory event,
    Emitter<PresentorState> emit,
  ) async {
    await _dbRepo.saveHistory(
      History(song: event.song.rid, created: getCurrentDate()),
    );

    emit(HistoryState());
  }
}
