part of 'step1_bloc.dart';

@freezed
sealed class Step1Event with _$Step1Event {
  const factory Step1Event.fetch() = FetchBooks;

  const factory Step1Event.submit(
    String selectedBooksIds,
    List<Book> books,
  ) = SaveBooks;
}
