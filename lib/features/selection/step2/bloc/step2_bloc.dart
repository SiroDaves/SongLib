import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../common/utils/app_util.dart';
import '../../../../common/utils/constants/pref_constants.dart';
import '../../../../common/data/models/song.dart';
import '../../../../common/repository/database_repository.dart';
import '../../../../common/repository/local_storage.dart';
import '../../../../core/di/injectable.dart';
import '../../common/domain/selection_repository.dart';

part 'step2_event.dart';
part 'step2_state.dart';

part 'step2_bloc.freezed.dart';

class Step2Bloc extends Bloc<Step2Event, Step2State> {
  Step2Bloc() : super(const _Step2State()) {
    on<FetchSongs>(_onFetchSongs);
    on<SaveSongs>(_onSaveSongs);
  }

  final _selectRepo = SelectionRepository();
  final _localStorage = getIt<LocalStorage>();
  final _dbRepo = getIt<DatabaseRepository>();

  void _onFetchSongs(
    FetchSongs event,
    Emitter<Step2State> emit,
  ) async {
    emit(Step2ProgressState());
    String selectedBooks =
        _localStorage.getPrefString(PrefConstants.selectedBooksKey);
    var resp = await _selectRepo.getSongsByBooks(selectedBooks);

    try {
      switch (resp.statusCode) {
        case 200:
          List<dynamic> dataList = List<Map<String, dynamic>>.from(
            jsonDecode(resp.body)['data'],
          );
          emit(
            Step2FetchedState(
              dataList.map((item) => Song.fromJson(item)).toList(),
            ),
          );
          break;
        default:
          emit(Step2FailureState(resp.statusCode.toString()));
          break;
      }
    } catch (e) {
      logger("Error log: $e");
      emit(Step2FailureState('100'));
    }
  }

  void _onSaveSongs(
    SaveSongs event,
    Emitter<Step2State> emit,
  ) async {
    emit(Step2ProgressState());

    if (event.songs.isNotEmpty) {
      int index = 0;
      for (final song in event.songs) {
        try {
          String feedback = '';
          int progress = ((index / event.songs.length) * 100).toInt();

          switch (progress) {
            case 1:
              feedback = "On your\nmarks ...";
              break;
            case 5:
              feedback = "Set. \nReady ...";
              break;
            case 10:
              feedback = "Loading\nsongs ...";
              break;
            case 20:
              feedback = "Patience\npays ...";
              break;
            case 40:
              feedback = "Loading\nsongs ...";
              break;
            case 75:
              feedback = "Thanks for\nyour patience!";
              break;
            case 85:
              feedback = "Finishing up";
              break;
            case 95:
              feedback = "We're almost done";
              break;
          }

          emit(Step2SavingState(progress, feedback));
          await _dbRepo.saveSong(song);

          index++;
        } catch (_) {}
      }
    }

    _localStorage.setPrefBool(PrefConstants.dataIsLoadedKey, true);
    _localStorage.setPrefBool(PrefConstants.wakeLockCheckKey, true);

    emit(Step2SavedState());
  }
}
