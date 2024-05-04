part of 'selecting_bloc.dart';

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
  /// Books data fetched successfully.
  booksFetched,

  /// Books data saved successfully.
  booksSaved,
}

final class SelectingState extends Equatable {
  const SelectingState({
    this.status = Status.initial,
    this.selectedBooksIds = "",
    this.booksListing = const [],
    this.booksSelected = const [],
    this.feedback = '',
    this.isValid = false,
  });

  final Status status;
  final String selectedBooksIds;
  final List<Selectable<Book>> booksListing;
  final List<Book> booksSelected;
  final String feedback;
  final bool isValid;

  SelectingState copyWith({
    Status? status,
    String? selectedBooksIds,
    List<Selectable<Book>>? booksListing,
    List<Book>? booksSelected,
    String? feedback,
    bool? isValid,
  }) {
    return SelectingState(
      status: status ?? this.status,
      selectedBooksIds: selectedBooksIds ?? this.selectedBooksIds,
      booksListing: booksListing ?? this.booksListing,
      booksSelected: booksSelected ?? this.booksSelected,
      feedback: feedback ?? this.feedback,
      isValid: isValid ?? this.isValid,
    );
  }

  @override
  List<Object> get props => [
        status,
        selectedBooksIds,
        booksListing,
        booksSelected,
        feedback,
      ];
}
