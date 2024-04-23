import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/utils/logger.dart';
import '../../../data/models/book.dart';
import '../../common/domain/selection_repository.dart';

part 'selecting_event.dart';
part 'selecting_state.dart';
part 'selecting_bloc.freezed.dart';

@injectable
class SelectingBloc extends Bloc<SelectingEvent, SelectingState> {
  SelectingBloc() : super(const SelectingState()) {
    on<SelectingBooksFetch>(_onFetchData);
    on<SelectingSubmit>(_onSubmit);
  }

  final _selectingRepo = SelectionRepository();

  void _onFetchData(
    SelectingBooksFetch event,
    Emitter<SelectingState> emit,
  ) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    var resp = await _selectingRepo.getBooks();

    try {
      switch (resp.statusCode) {
        case 200:
          List<dynamic> dataList = List<Map<String, dynamic>>.from(
            jsonDecode(resp.body)['data'],
          );
          emit(
            state.copyWith(
              status: FormzSubmissionStatus.success,
              books: dataList.map((item) => Book.fromJson(item)).toList(),
            ),
          );
          break;
        default:
          emit(
            state.copyWith(
              status: FormzSubmissionStatus.failure,
              feedback: resp.statusCode.toString(),
            ),
          );
          break;
      }
    } catch (e) {
      logger("Error log: $e");
      emit(
        state.copyWith(
          status: FormzSubmissionStatus.failure,
          feedback: '100',
        ),
      );
    }
  }

  void _onSubmit(
    SelectingSubmit event,
    Emitter<SelectingState> emit,
  ) {
    /*final username = Username.dirty(event.username);
    emit(
      state.copyWith(
        username: username,
        isValid: Formz.validate([state.password, username]),
      ),
    );*/
  }
}
