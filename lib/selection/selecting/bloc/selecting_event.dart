part of 'selecting_bloc.dart';

sealed class SelectingEvent extends Equatable {
  const SelectingEvent();

  @override
  List<Object> get props => [];
}

final class SelectingBooksFetch extends SelectingEvent {
  const SelectingBooksFetch();
}

final class SelectingChanged extends SelectingEvent {
  const SelectingChanged(this.username);

  final String username;

  @override
  List<Object> get props => [username];
}

final class SelectingSubmitted extends SelectingEvent {
  const SelectingSubmitted(this.books);

  final List<Book> books;

  @override
  List<Object> get props => [books];
}
