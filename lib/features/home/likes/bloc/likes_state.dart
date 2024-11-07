part of 'likes_bloc.dart';

@freezed
class LikesState with _$LikesState {
  const factory LikesState.initial() = _LikesState;

  const factory LikesState.books(List<Book> books) = BooksFetchedState;

  const factory LikesState.likes(List<SongExt> likes) = LikesFetchedState;

  const factory LikesState.progress() = ProgressState;

  const factory LikesState.success() = SuccessState;

  const factory LikesState.failure(String feedback) = FailureState;
}
