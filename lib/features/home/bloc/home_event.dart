part of 'home_bloc.dart';

@freezed
sealed class HomeEvent with _$HomeEvent {
  const factory HomeEvent.version(String currentVersion) = HomeCheckVersion;

  const factory HomeEvent.fetch() = HomeFetchData;

  const factory HomeEvent.sort(int book) = HomeSortByBook;
}
