part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _HomeState;

  const factory HomeState.fetched(
    List<Book> books,
    List<SongExt> songs,
  ) = HomeFetchedState;

  const factory HomeState.filtered(
    Book book,
    List<SongExt> songs,
    List<SongExt> likes,
  ) = HomeFilteredState;

  const factory HomeState.fetching() = HomeFetchingState;

  const factory HomeState.filtering() = HomeFilteringState;

  const factory HomeState.success() = HomeSuccessState;

  const factory HomeState.failure(String feedback) = HomeFailureState;
}
