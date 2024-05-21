import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../common/utils/date_util.dart';
import '../../data/models/book.dart';
import '../../data/models/history.dart';
import '../../data/models/song.dart';
import '../../data/models/songext.dart';
import '../../data/repository/database_repository.dart';
import '../../di/injectable.dart';

part 'presentor_event.dart';
part 'presentor_state.dart';

part 'presentor_bloc.freezed.dart';

@injectable
class PresentorBloc extends Bloc<PresentorEvent, PresentorState> {
  PresentorBloc() : super(const PresentorState()) {
    on<PresentorLike>(_onLike);
    on<PresentorHistory>(_onHistory);
  }

  final _dbRepo = getIt<DatabaseRepository>();

  Future<void> _onLike(
    PresentorLike event,
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

  Future<void> _onHistory(
    PresentorHistory event,
    Emitter<PresentorState> emit,
  ) async {
    emit(state.copyWith(status: Status.inProgress));

    await _dbRepo.saveHistory(
      History(song: event.song.rid, created: getCurrentDate()),
    );

    emit(state.copyWith(status: Status.loaded));
  }
}
