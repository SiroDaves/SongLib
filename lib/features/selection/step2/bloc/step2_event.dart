part of 'step2_bloc.dart';

@freezed
sealed class Step2Event with _$Step2Event {
  const factory Step2Event.fetch() = FetchSongs;

  const factory Step2Event.save(List<Song> songs) = SaveSongs;
}
