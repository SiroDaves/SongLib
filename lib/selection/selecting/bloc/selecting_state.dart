part of 'selecting_bloc.dart';

final class SelectingState extends Equatable {
  const SelectingState({
    this.status = FormzSubmissionStatus.initial,
    this.books = const [],
    this.isValid = false,
  });

  final FormzSubmissionStatus status;
  final List<Book> books;
  final bool isValid;

  SelectingState copyWith({
    FormzSubmissionStatus? status,
    List<Book>? books,
    bool? isValid,
  }) {
    return SelectingState(
      status: status ?? this.status,
      books: books ?? this.books,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object> get props => [status, books];
}