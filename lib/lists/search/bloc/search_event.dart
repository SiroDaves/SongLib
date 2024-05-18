part of 'search_bloc.dart';

@freezed
sealed class SearchEvent with _$SearchEvent {
  const factory SearchEvent.fetch() = SearchFetchData;

  const factory SearchEvent.select(Book book) = SearchSelect;

  const factory SearchEvent.search(String query) = SearchSongs;
}
