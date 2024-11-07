part of 'step1_bloc.dart';

@freezed
class Step1State with _$Step1State {
  const factory Step1State.initial() = _Step1State;

  const factory Step1State.loaded() = LoadedState;

  const factory Step1State.progress() = ProgressState;

  const factory Step1State.success() = SuccessState;

  const factory Step1State.fetched(
    String selectedBooksIds,
    List<Book> books,
    List<Selectable<Book>> booksListing,
  ) = FetchedState;

  const factory Step1State.saved(String selectedBooks) = SavedState;

  const factory Step1State.failure(String feedback) = FailureState;
}
