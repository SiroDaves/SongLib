import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/utils/logger.dart';
import '../../../common/utils/constants/pref_constants.dart';
import '../../../data/models/song.dart';
import '../../../data/repository/db_repository.dart';
import '../../../data/repository/local_storage.dart';
import '../../../di/injectable.dart';
import '../../common/domain/selection_repository.dart';

part 'saving_event.dart';
part 'saving_state.dart';
part 'saving_bloc.freezed.dart';

@injectable
class SavingBloc extends Bloc<SavingEvent, SavingState> {
  SavingBloc() : super(const SavingState()) {
    on<SavingSongsFetch>(_onFetchData);
    on<SavingSubmitData>(_onSubmitData);
  }

  final _selectingRepo = SelectionRepository();
  final _localStorage = getIt<LocalStorage>();
  final _dbRepo = getIt<DatabaseRepository>();

  void _onFetchData(
    SavingSongsFetch event,
    Emitter<SavingState> emit,
  ) async {
    emit(state.copyWith(status: Status.inProgress));
    String selectedBooks =
        _localStorage.getPrefString(PrefConstants.selectedBooksKey);
    var resp = await _selectingRepo.getSongsByBooks(selectedBooks);

    try {
      switch (resp.statusCode) {
        case 200:
          List<dynamic> dataList = List<Map<String, dynamic>>.from(
            jsonDecode(resp.body)['data'],
          );
          emit(
            state.copyWith(
              status: Status.songsFetched,
              songs: dataList.map((item) => Song.fromJson(item)).toList(),
            ),
          );
          break;
        default:
          emit(
            state.copyWith(
              status: Status.failure,
              feedback: resp.statusCode.toString(),
            ),
          );
          break;
      }
    } catch (e) {
      logger("Error log: $e");
      emit(
        state.copyWith(
          status: Status.failure,
          feedback: '100',
        ),
      );
    }
  }

  void _onSubmitData(
    SavingSubmitData event,
    Emitter<SavingState> emit,
  ) async {
    emit(state.copyWith(status: Status.songsSaving));

    if (state.songs.isNotEmpty) {
      for (int i = 0; i < state.songs.length; i++) {
        try {
          int progress = (i / state.songs.length * 100).toInt();

          emit(state.copyWith(progress: progress));
          switch (progress) {
            case 1:
              emit(state.copyWith(feedback: "On your\nmarks ..."));
              break;
            case 5:
              emit(state.copyWith(feedback: "Set,\nReady ..."));
              break;
            case 10:
              emit(state.copyWith(feedback: "Loading\nsongs ..."));
              break;
            case 20:
              emit(state.copyWith(feedback: "Patience\npays ..."));
              break;
            case 40:
              emit(state.copyWith(feedback: "Loading\nsongs ..."));
              break;
            case 75:
              emit(state.copyWith(feedback: "Thanks for\nyour patience!"));
              break;
            case 85:
              emit(state.copyWith(feedback: "Finishing up"));
              break;
            case 95:
              emit(state.copyWith(feedback: "Almost done"));
              break;
          }

          await _dbRepo.saveSong(state.songs[i]);
        } catch (_) {}
      }
    }

    _localStorage.setPrefBool(PrefConstants.dataLoadedCheckKey, true);
    _localStorage.setPrefBool(PrefConstants.wakeLockCheckKey, true);

    emit(state.copyWith(status: Status.songsSaved));
  }
}
