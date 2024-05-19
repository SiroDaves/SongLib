import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:injectable/injectable.dart';

import '../../../common/utils/env/flavor_config.dart';

part 'app_checker_event.dart';
part 'app_checker_state.dart';

part 'app_checker_bloc.freezed.dart';

@injectable
class AppCheckerBloc extends Bloc<AppCheckerEvent, AppCheckerState> {
  AppCheckerBloc() : super(const AppCheckerState()) {
    on<AppCheckerCheckUpdates>(_onCheckUpdates);
    on<AppCheckerUpdateApp>(_onUpdateApp);
  }

  Future<void> _onCheckUpdates(
    AppCheckerCheckUpdates event,
    Emitter<AppCheckerState> emit,
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
    AppCheckerUpdateApp event,
    Emitter<AppCheckerState> emit,
  ) async {
    InAppUpdate.performImmediateUpdate().then((appUpdateResult) {
      if (appUpdateResult == AppUpdateResult.success) {
        emit(
          state.copyWith(
            status: Status.updated,
            feedback: 'Songlib successfully Updated',
          ),
        );
      }
    });
  }

}
