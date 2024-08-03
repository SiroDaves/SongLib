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

  /// Data loaded successfully.
  loaded,

  /// Data filtered successfully.
  filtered,

  // status specific with this bloc
  /// App update found.
  updateFound,
}

final class HomeState extends Equatable {
  const HomeState({
    this.status = Status.initial,
    this.books = const <Book>[],
    this.songs = const <SongExt>[],
    this.filtered = const <SongExt>[],
    this.feedback = '',
    this.update,
  });

  final Status status;
  final List<Book> books;
  final List<SongExt> songs;
  final List<SongExt> filtered;
  final String feedback;
  final dynamic update;

  HomeState copyWith({
    Status? status,
    Book? setBook,
    List<Book>? books,
    List<SongExt>? songs,
    List<SongExt>? filtered,
    String? feedback,
    dynamic update,
  }) {
    return HomeState(
      status: status ?? this.status,
      books: books ?? this.books,
      songs: songs ?? this.songs,
      filtered: filtered ?? this.filtered,
      feedback: feedback ?? this.feedback,
      update: update ?? this.update,
    );
  }

  @override
  List<Object> get props => [status, books, songs, filtered, update, feedback];
}
