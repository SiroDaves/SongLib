import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../common/utils/app_util.dart';
import '../../../../common/widgets/progress/custom_snackbar.dart';
import '../../../../common/widgets/progress/general_progress.dart';
import '../../../../core/navigator/route_names.dart';
import '../bloc/step2_bloc.dart';
import 'widgets/step2_widgets.dart';

class Step2Screen extends StatefulWidget {
  const Step2Screen({super.key});

  @override
  State<Step2Screen> createState() => Step2ScreenState();
}

class Step2ScreenState extends State<Step2Screen> {
  String selectedBooks = "";
  List<String> bookNos = [];

  @override
  Widget build(BuildContext context) {
    var l10n = AppLocalizations.of(context)!;
    final size = MediaQuery.of(context).size;
    final double radius = isDesktop ? size.height / 2.5 : size.width / 2.5;

    return BlocProvider(
      create: (context) => Step2Bloc()..add(FetchSongs()),
      child: BlocConsumer<Step2Bloc, Step2State>(
        listener: (context, state) {
          if (state is Step2FetchedState) {
            context.read<Step2Bloc>().add(SaveSongs(state.songs));
          } else if (state is Step2FailureState) {
            CustomSnackbar.show(
              context,
              feedbackMessage(state.feedback, l10n),
            );
          } else if (state is Step2SavedState) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              RouteNames.home,
              (route) => false,
            );
          }
        },
        builder: (context, state) {
          var bloc = context.read<Step2Bloc>();
          Widget bodyWidget = EmptyState(
            title: 'Sorry nothing to show here at the moment.',
            showRetry: true,
            onRetry: () => bloc.add(const FetchSongs()),
          );

          if (state is Step2ProgressState) {
            bodyWidget = WaveProgress();
          } else if (state is Step2SavingState) {
            bodyWidget = Stack(
              children: [
                BackgroundProgress(
                  size: size,
                  progress: state.progress,
                ),
                ForegroundProgress(
                  progress: state.progress,
                  radius: radius,
                  feedback: state.feedback,
                ),
              ],
            );
          }
          return Scaffold(body: bodyWidget);
        },
      ),
    );
  }
}
