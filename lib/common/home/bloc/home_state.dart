part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _HomeState;

  const factory HomeState.loaded(
    int timestamp,
    bool isValid,
  ) = HomeLoadedState;

  const factory HomeState.progress(
    int timestamp,
    String feedback,
  ) = HomeProgressState;

  const factory HomeState.success(
    int timestamp,
    String feedback,
  ) = HomeSuccessState;

  const factory HomeState.update(
    int timestamp,
    String feedback,
  ) = HomeUpdateState;

  const factory HomeState.failure(
    int timestamp,
    String feedback,
  ) = HomeFailureState;

  const factory HomeState.canceled(int timestamp) = HomeCanceledState;
}
