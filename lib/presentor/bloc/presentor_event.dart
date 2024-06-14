part of 'presentor_bloc.dart';

@freezed
sealed class PresentorEvent with _$PresentorEvent {
  const factory PresentorEvent.loadSong(SongExt song) = PresentorLoadSong;

  const factory PresentorEvent.likeSong(SongExt song) = PresentorLikeSong;

  const factory PresentorEvent.history(SongExt song) = PresentorSaveHistory;
}
