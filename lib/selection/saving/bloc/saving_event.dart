part of 'saving_bloc.dart';

@freezed
sealed class SavingEvent with _$SavingEvent {
  const factory SavingEvent.fetch() = SavingBooksFetch;

  const factory SavingEvent.submit() = SavingSubmit;
}
