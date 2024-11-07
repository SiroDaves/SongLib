part of 'likes_bloc.dart';

@freezed
sealed class LikesEvent with _$LikesEvent {
  const factory LikesEvent.books() = FetchBooks;

  const factory LikesEvent.likes(int book) = FetchLikes;
}
