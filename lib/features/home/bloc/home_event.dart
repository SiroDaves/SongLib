part of 'home_bloc.dart';

@freezed
sealed class HomeEvent with _$HomeEvent {
  const factory HomeEvent.checkUpdates() = HomeCheckUpdates;

  const factory HomeEvent.updateApp() = HomeUpdateApp;

  const factory HomeEvent.fetch() = HomeFetchData;

  const factory HomeEvent.sort(int book) = HomeSortByBook;
}
