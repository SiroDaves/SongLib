part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _HomeState;

  const factory HomeState.fetched(
    List<Book> books,
    List<SongExt> songs,
  ) = FetchedState;

  const factory HomeState.filtered(
    Book book,
    List<SongExt> songs,
    List<SongExt> likes,
  ) = FilteredState;

  const factory HomeState.fetching() = FetchingState;

  const factory HomeState.filtering() = FilteringState;

  const factory HomeState.success() = SuccessState;

  const factory HomeState.failure(String feedback) = FailureState;
}
