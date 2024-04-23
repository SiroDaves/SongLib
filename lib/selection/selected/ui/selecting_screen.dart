import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:formz/formz.dart';

import '../../../common/theme/theme_colors.dart';
import '../../../common/utils/app_util.dart';
import '../../../common/widgets/action/base_buttons.dart';
import '../../../common/widgets/general/list_items.dart';
import '../../../common/widgets/progress/custom_snackbar.dart';
import '../../../common/widgets/progress/general_progress.dart';
import '../bloc/selecting_bloc.dart';

part 'selecting_body.dart';
part 'selecting_body_details.dart';

class SelectingScreen extends StatelessWidget {
  const SelectingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations? tr = AppLocalizations.of(context)!;
    return BlocProvider(
      create: (context) {
        return SelectingBloc();
      },
      child: BlocListener<SelectingBloc, SelectingState>(
        listener: (context, state) {
          if (state.status.isFailure) {
            CustomSnackbar.show(
              context,
              feedbackMessage(state.feedback, tr),
            );
          }
        },
        child: const SelectingBody(),
      ),
    );
  }
}
