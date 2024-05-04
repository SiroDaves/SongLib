part of 'saving_bloc.dart';

enum Status {
  // Generic statuses
  /// No action has been taken so far.
  initial,

  /// An action is being processed.
  inProgress,

  /// A process has been completed successfully.
  success,

  /// A process has failed.
  failure,

  /// A process has been canceled.
  canceled,

  // status specific with this bloc
  /// Songs data fetched successfully.
  songsFetched,

  /// Songs data is being saved.
  songsSaving,

  /// Songs data saved successfully.
  songsSaved,
}

final class SavingState extends Equatable {
  const SavingState({
    this.status = Status.initial,
    this.songs = const [],
    this.progress = 0,
    this.feedback = '',
    this.isValid = false,
  });

  final Status status;
  final List<Song> songs;
  final int progress;
  final String feedback;
  final bool isValid;

  SavingState copyWith({
    Status? status,
    List<Song>? songs,
    int? progress,
    String? feedback,
    bool? isValid,
  }) {
    return SavingState(
      status: status ?? this.status,
      songs: songs ?? this.songs,
      progress: progress ?? this.progress,
      feedback: feedback ?? this.feedback,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object> get props => [status, progress, songs, feedback];
}
