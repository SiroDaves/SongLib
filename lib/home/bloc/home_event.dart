part of 'home_bloc.dart';

@freezed
sealed class HomeEvent with _$HomeEvent {
  const factory HomeEvent.fetch() = HomeFetchData;

  const factory HomeEvent.select(Book book) = HomeSelect;

  const factory HomeEvent.search(String query) = HomeSearch;
}
