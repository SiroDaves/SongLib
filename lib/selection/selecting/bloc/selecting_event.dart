part of 'selecting_bloc.dart';

@freezed
sealed class SelectingEvent with _$SelectingEvent {
  const factory SelectingEvent.fetch() = SelectingBooksFetch;

  const factory SelectingEvent.submit(List<Book> books) = SelectingSubmitData;
}
