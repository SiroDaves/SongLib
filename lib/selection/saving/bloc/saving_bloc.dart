import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/utils/logger.dart';
import '../../../data/models/basic_model.dart';
import '../../../data/models/book.dart';
import '../../common/domain/selection_repository.dart';

part 'saving_event.dart';
part 'saving_state.dart';
part 'saving_bloc.freezed.dart';

@injectable
class SavingBloc extends Bloc<SavingEvent, SavingState> {
  SavingBloc() : super(const SavingState()) {
    on<SavingBooksFetch>(_onFetchData);
    on<SavingSubmit>(_onSubmit);
  }

  final _selectingRepo = SelectionRepository();

  void _onFetchData(
    SavingBooksFetch event,
    Emitter<SavingState> emit,
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
    SavingSubmit event,
    Emitter<SavingState> emit,
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
