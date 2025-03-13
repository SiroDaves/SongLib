part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _HomeState;

  const factory HomeState.loaded() = HomeLoadedState;

  const factory HomeState.fetched(
    List<Book> books,
    List<SongExt> songs,
  ) = HomeDataFetchedState;

  const factory HomeState.synced(
    List<Book> books,
    List<SongExt> songs,
  ) = HomeDataSyncedState;

  const factory HomeState.filtered(
    Book book,
    List<SongExt> songs,
    List<SongExt> likes,
  ) = HomeFilteredState;

  const factory HomeState.fetching() = HomeFetchingState;

  const factory HomeState.filtering() = HomeFilteringState;

  const factory HomeState.success() = HomeSuccessState;

  const factory HomeState.reset() = HomeResettedState;

  const factory HomeState.failure(String feedback) = HomeFailureState;
}
