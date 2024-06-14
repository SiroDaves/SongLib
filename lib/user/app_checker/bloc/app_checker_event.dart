part of 'app_checker_bloc.dart';

@freezed
sealed class AppCheckerEvent with _$AppCheckerEvent {
  const factory AppCheckerEvent.checkUpdates() = AppCheckerCheckUpdates;

  const factory AppCheckerEvent.updateApp() = AppCheckerUpdateApp;
}
