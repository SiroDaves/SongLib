import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'settings_event.dart';
part 'settings_state.dart';

part 'settings_bloc.freezed.dart';

@injectable
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(const SettingsState()) {
    on<SettingsInit>(_onInit);
  }

  Future<void> _onInit(
    SettingsInit event,
    Emitter<SettingsState> emit,
  ) async {
    emit(state.copyWith(status: Status.inProgress));

    emit(
      state.copyWith(status: Status.loaded),
    );
  }
}
