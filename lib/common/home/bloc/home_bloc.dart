import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:in_app_update/in_app_update.dart';
import 'package:injectable/injectable.dart';

import '../../../common/utils/date_util.dart';
import '../../utils/env/flavor_config.dart';

part 'home_event.dart';
part 'home_state.dart';

part 'home_bloc.freezed.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const _HomeState()) {
    on<HomeCheckUpdates>(_onCheckUpdates);
    on<HomeUpdateApp>(_onUpdateApp);
  }

  Future<void> _onCheckUpdates(
    HomeCheckUpdates event,
    Emitter<HomeState> emit,
  ) async {
    emit(HomeProgressState(timeStamp(), ''));
    if (FlavorConfig.isProd()) {
      try {
        await InAppUpdate.checkForUpdate().then((updateInfo) {
          if (updateInfo.updateAvailability ==
              UpdateAvailability.updateAvailable) {
            emit(HomeUpdateState(timeStamp(), 'There is a new app update'));
          } else {
            emit(HomeSuccessState(timeStamp(), ''));
          }
        });
      } catch (e) {
        emit(HomeSuccessState(timeStamp(), ''));
      }
    } else {
      emit(HomeSuccessState(timeStamp(), ''));
    }
  }

  Future<void> _onUpdateApp(
    HomeUpdateApp event,
    Emitter<HomeState> emit,
  ) async {
    InAppUpdate.performImmediateUpdate().then((appUpdateResult) {
      if (appUpdateResult == AppUpdateResult.success) {
        emit(HomeSuccessState(
          timeStamp(),
          'Songlib successfully Updated',
        ));
      }
    });
  }
}
