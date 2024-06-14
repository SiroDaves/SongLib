part of 'presentor_bloc.dart';

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

  /// Song loaded successfully.
  loaded,

  /// Done liking song.
  liked,

  /// Done unliking song.
  unliked,
}

final class PresentorState extends Equatable {
  const PresentorState({
    this.status = Status.initial,
    this.songBook = '',
    this.songTitle = '...',
    this.hasChorus = false,
    this.songVerses = const <String>[],
    this.widgetTabs = const <Tab>[],
    this.widgetContent = const <Widget>[],
    this.feedback = '',
  });

  final Status status;
  final String songBook;
  final String songTitle;
  final bool hasChorus;
  final List<String> songVerses;
  final List<Tab> widgetTabs;
  final List<Widget> widgetContent;
  final String feedback;

  PresentorState copyWith({
    Status? status,
    String? songBook,
    String? songTitle,
    bool? hasChorus,
    List<String>? songVerses,
    List<Tab>? widgetTabs,
    List<Widget>? widgetContent,
    String? feedback,
  }) {
    return PresentorState(
      status: status ?? this.status,
      songBook: songBook ?? this.songBook,
      songTitle: songTitle ?? this.songTitle,
      hasChorus: hasChorus ?? this.hasChorus,
      songVerses: songVerses ?? this.songVerses,
      widgetTabs: widgetTabs ?? this.widgetTabs,
      widgetContent: widgetContent ?? this.widgetContent,
      feedback: feedback ?? this.feedback,
    );
  }

  @override
  List<Object> get props => [
        status,
        songBook,
        songTitle,
        hasChorus,
        songVerses,
        widgetTabs,
        widgetContent,
        feedback
      ];
}
