part of 'presentor_bloc.dart';

@freezed
class PresentorState with _$PresentorState {
  const factory PresentorState.initial() = _PresentorState;

  const factory PresentorState.loaded(
    List<String>? songVerses,
    List<Tab>? widgetTabs,
    List<Widget>? widgetContent,
  ) = LoadedState;

  const factory PresentorState.progress() = ProgressState;

  const factory PresentorState.success() = SuccessState;

  const factory PresentorState.liked(bool liked) = LikedState;

  const factory PresentorState.history() = HistoryState;

  const factory PresentorState.failure(String feedback) = FailureState;
}
