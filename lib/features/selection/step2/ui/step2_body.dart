part of 'step2_screen.dart';

class Step2Body extends StatefulWidget {
  final Step2ScreenState parent;
  const Step2Body({super.key, required this.parent});

  @override
  State<Step2Body> createState() => Step2BodyState();
}

class Step2BodyState extends State<Step2Body> {
  late Step2ScreenState parent;
  late AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    parent = widget.parent;
    l10n = AppLocalizations.of(context)!;
    final size = MediaQuery.of(context).size;
    final double radius = isDesktop ? size.height / 2.5 : size.width / 2.5;

    return BlocConsumer<Step2Bloc, Step2State>(
      bloc: parent.bloc,
      listener: (context, state) {
        if (state is FetchedState) {
          parent.bloc.add(SaveSongs(state.songs));
        }
        if (state is FailureState) {
          CustomSnackbar.show(
            context,
            feedbackMessage(state.feedback, l10n),
          );
        }
        if (state is SavedState) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            RouteNames.home,
            (route) => false,
          );
        }
      },
      builder: (context, state) {
        if (state is ProgressState) {
          return const CircularProgress();
        } else if (state is FailureState) {
          return EmptyState(
            title: emptyStateMessage(state.feedback, l10n),
            showRetry: true,
            onRetry: () => parent.bloc.add(const FetchSongs()),
          );
        } else if (state is SavingState) {
          return Stack(
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
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
