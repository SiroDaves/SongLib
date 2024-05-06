part of 'home_bloc.dart';

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
  /// App update found.
  updateFound,

  /// App has been updated.
  updated,

  /// Data fetched successfully.
  dataFetched,
}

final class HomeState extends Equatable {
  const HomeState({
    this.status = Status.initial,
    this.books = const [],
    this.songs = const [],
    this.filtered = const [],
    this.progress = 0,
    this.feedback = '',
    this.isValid = false,
  });

  final Status status;
  final List<Book> books;
  final List<SongExt> songs;
  final List<SongExt> filtered;
  final int progress;
  final String feedback;
  final bool isValid;

  HomeState copyWith({
    Status? status,
    List<Book>? books,
    List<SongExt>? songs,
    List<SongExt>? filtered,
    int? progress,
    String? feedback,
    bool? isValid,
  }) {
    return HomeState(
      status: status ?? this.status,
      books: books ?? this.books,
      songs: songs ?? this.songs,
      filtered: filtered ?? this.filtered,
      progress: progress ?? this.progress,
      feedback: feedback ?? this.feedback,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object> get props =>
      [status, progress, books, songs, filtered, feedback];
}
