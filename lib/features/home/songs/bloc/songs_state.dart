part of 'songs_bloc.dart';

@freezed
class SongsState with _$SongsState {
  const factory SongsState.initial() = _SongsState;

  const factory SongsState.books(List<Book> books) = BooksFetchedState;

  const factory SongsState.songs(List<SongExt> songs) = SongsFetchedState;

  const factory SongsState.progress() = ProgressState;

  const factory SongsState.success() = SuccessState;

  const factory SongsState.failure(String feedback) = FailureState;
}
