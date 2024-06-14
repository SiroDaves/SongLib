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
}

final class HomeState extends Equatable {
  const HomeState({
    this.status = Status.initial,
    this.books = const <Book>[],
    this.songs = const <SongExt>[],
    this.feedback = '',
  });

  final Status status;
  final List<Book> books;
  final List<SongExt> songs;
  final String feedback;

  HomeState copyWith({
    Status? status,
    Book? setBook,
    List<Book>? books,
    List<SongExt>? songs,
    String? feedback,
  }) {
    return HomeState(
      status: status ?? this.status,
      books: books ?? this.books,
      songs: songs ?? this.songs,
      feedback: feedback ?? this.feedback,
    );
  }

  @override
  List<Object> get props => [status, books, songs, feedback];
}
