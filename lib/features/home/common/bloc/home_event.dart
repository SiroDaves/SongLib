part of 'home_bloc.dart';

@freezed
sealed class HomeEvent with _$HomeEvent {
  const factory HomeEvent.fetch(bool refreshing) = FetchData;

  const factory HomeEvent.sync() = SyncData;

  const factory HomeEvent.filter(Book book) = FilterData;
  
  const factory HomeEvent.reset() = ResetData;
  
}
