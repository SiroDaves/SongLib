part of 'presentor_bloc.dart';

@freezed
sealed class PresentorEvent with _$PresentorEvent {
  const factory PresentorEvent.like(SongExt song) = PresentorLike;
  const factory PresentorEvent.history(SongExt song) = PresentorHistory;
}
