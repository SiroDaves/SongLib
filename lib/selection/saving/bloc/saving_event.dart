part of 'saving_bloc.dart';

@freezed
sealed class SavingEvent with _$SavingEvent {
  const factory SavingEvent.fetch() = SavingSongsFetch;

  const factory SavingEvent.save() = SavingSubmitData;
}
