part of 'presentor_bloc.dart';

@freezed
sealed class PresentorEvent with _$PresentorEvent {
  const factory PresentorEvent.load(SongExt song) = LoadSong;

  const factory PresentorEvent.like(SongExt song) = LikeSong;

  const factory PresentorEvent.history(SongExt song) = SaveHistory;
}
