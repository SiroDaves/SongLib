part of 'home_bloc.dart';

@freezed
sealed class HomeEvent with _$HomeEvent {
  const factory HomeEvent.fetch() = FetchData;

  const factory HomeEvent.filter(Book book) = FilterData;
  
}
