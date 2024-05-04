import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../common/theme/theme_colors.dart';
import '../../../common/utils/app_util.dart';
import '../../../common/widgets/progress/advanced/advanced_progress.dart';
import '../../../common/widgets/progress/custom_snackbar.dart';
import '../../../common/widgets/progress/general_progress.dart';
import '../../../navigator/route_names.dart';
import '../bloc/saving_bloc.dart';

part 'saving_screen_body.dart';

class SavingScreen extends StatelessWidget {
  const SavingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations? tr = AppLocalizations.of(context)!;
    return BlocProvider(
      create: (context) {
        return SavingBloc();
      },
      child: BlocListener<SavingBloc, SavingState>(
        listener: (context, state) {
          if (state.status == Status.failure) {
            CustomSnackbar.show(
              context,
              feedbackMessage(state.feedback, tr),
            );
          }
        },
        child: const SavingScreenBody(),
      ),
    );
  }
}
