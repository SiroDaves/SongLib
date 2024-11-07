import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/data/models/book.dart';
import '../../../../common/data/models/songext.dart';
import '../../../../common/repository/database_repository.dart';
import '../../../../core/di/injectable.dart';

part 'likes_event.dart';
part 'likes_state.dart';

part 'likes_bloc.freezed.dart';

@injectable
class LikesBloc extends Bloc<LikesEvent, LikesState> {
  LikesBloc() : super(const _LikesState()) {
    on<FetchBooks>(_onFetchBooks);
    on<FetchLikes>(_onFetchLikes);
  }

  final _dbRepo = getIt<DatabaseRepository>();

  Future<void> _onFetchBooks(
    FetchBooks event,
    Emitter<LikesState> emit,
  ) async {
    emit(ProgressState());
    var books = await _dbRepo.fetchBooks();
    emit(BooksFetchedState(books));
  }

  Future<void> _onFetchLikes(
    FetchLikes event,
    Emitter<LikesState> emit,
  ) async {
    emit(ProgressState());
    var likes = await _dbRepo.fetchLikes(event.book);
    emit(LikesFetchedState(likes));
  }
}
