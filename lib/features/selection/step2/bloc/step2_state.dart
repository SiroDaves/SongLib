part of 'step2_bloc.dart';

@freezed
class Step2State with _$Step2State {
  const factory Step2State.initial() = _Step2State;

  const factory Step2State.loaded() = LoadedState;

  const factory Step2State.progress() = ProgressState;

  const factory Step2State.success() = SuccessState;

  const factory Step2State.fetched(List<Song> songs) = FetchedState;

  const factory Step2State.saving(int progress, String feedback) = SavingState;

  const factory Step2State.saved() = SavedState;

  const factory Step2State.failure(String feedback) = FailureState;
}
