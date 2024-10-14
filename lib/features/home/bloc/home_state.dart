part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _HomeState;

  const factory HomeState.loaded(
    List<Book> books,
    List<SongExt> songs,
    List<SongExt> likes,
  ) = LoadedState;

  const factory HomeState.progress() = ProgressState;

  const factory HomeState.success() = SuccessState;

  const factory HomeState.updateFound(
    String version,
    String releaseNotes,
  ) = UpdatedState;

  const factory HomeState.filtered(
    List<SongExt> filtered,
  ) = FilteredState;

  const factory HomeState.failure(String feedback) = FailureState;

}
