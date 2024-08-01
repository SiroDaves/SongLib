import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'splash_event.dart';
part 'splash_state.dart';

part 'splash_bloc.freezed.dart';

@injectable
class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(const SplashState()) {
    on<SplashCheckUpdates>(_onCheckUpdates);
  }

  Future<void> _onCheckUpdates(
    SplashCheckUpdates event,
    Emitter<SplashState> emit,
  ) async {
    emit(state.copyWith(status: Status.inProgress));
    try {
        
      } catch (e) {
        emit(state.copyWith(status: Status.success, feedback: ''));
      }
  }

}
