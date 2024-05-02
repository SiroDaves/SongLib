part of 'home_bloc.dart';

@freezed
sealed class HomeEvent with _$HomeEvent {
  const factory HomeEvent.checkUpdates() = HomeCheckUpdates;
  const factory HomeEvent.updateApp() = HomeUpdateApp;
}
