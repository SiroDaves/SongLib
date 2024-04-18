import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../common/utils/logger.dart';
import '../../../../data/models/inputs/code_input.dart';
import '../../../common/utils/date_util.dart';
import '../../../data/models/book.dart';
import '../../../data/repository/auth_repository.dart';
import '../../../di/injectable.dart';
import '../domain/selecting_repository.dart';

part 'selecting_event.dart';
part 'selecting_state.dart';
part 'selecting_bloc.freezed.dart';

@injectable
class SelectingBloc extends Bloc<SelectingEvent, SelectingState> {
  
}
