part of 'selecting_bloc.dart';

final class SelectingState extends Equatable {
  const SelectingState({
    this.status = FormzSubmissionStatus.initial,
    this.selectables = const [],
    this.books = const [],
    this.feedback = '',
    this.isValid = false,
  });

  final FormzSubmissionStatus status;

  final List<Selectable<Book>> selectables;
  final List<Book> books;
  final String feedback;
  final bool isValid;

  SelectingState copyWith({
    FormzSubmissionStatus? status,
    List<Selectable<Book>>? selectables,
    List<Book>? books,
    String? feedback,
    bool? isValid,
  }) {
    return SelectingState(
      status: status ?? this.status,
      selectables: selectables ?? this.selectables,
      books: books ?? this.books,
      feedback: feedback ?? this.feedback,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object> get props => [status, selectables, books];
}
