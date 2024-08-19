part of 'saving_screen.dart';

class SavingBody extends StatefulWidget {
  const SavingBody({super.key});

  @override
  State<SavingBody> createState() => _SavingScreenBodyState();
}

class _SavingScreenBodyState extends State<SavingBody> {
  late SavingBloc _bloc;
  String selectedBooks = "";
  List<String> bookNos = [];

  @override
  void initState() {
    super.initState();
    _bloc = context.read<SavingBloc>();
    _bloc.add(const SavingSongsFetch());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final size = MediaQuery.of(context).size;
    final double radius = isDesktop ? size.height / 2.5 : size.width / 2.5;

    return BlocConsumer<SavingBloc, SavingState>(
      bloc: _bloc,
      listener: (context, state) => _handleStateChanges(context, state, l10n),
      builder: (context, state) {
        return Scaffold(
          backgroundColor:
              state.status == Status.songsSaving ? Colors.black : Colors.white,
          body: SafeArea(
            child: Stack(
              children: [
                _buildContent(state, size, radius),
                if (state.status == Status.failure)
                  _buildErrorState(state, l10n),
              ],
            ),
          ),
        );
      },
    );
  }

  void _handleStateChanges(
      BuildContext context, SavingState state, AppLocalizations l10n) {
    if (state.status == Status.songsFetched) {
      _bloc.add(const SavingSubmitData());
    }
    if (state.status == Status.failure) {
      CustomSnackbar.show(
        context,
        feedbackMessage(state.feedback, l10n),
      );
    }
    if (state.status == Status.songsSaved) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        RouteNames.home,
        (route) => false,
      );
    }
  }

  Widget _buildContent(SavingState state, Size size, double radius) {
    if (state.status == Status.inProgress) {
      return const CircularProgress();
    }

    if (state.status == Status.songsSaving && state.songs.isNotEmpty) {
      return Stack(
        children: [
          _buildBackgroundProgress(size, state.progress),
          _buildForegroundProgress(state.progress, radius, state.feedback),
        ],
      );
    }

    return const SizedBox.shrink();
  }

  Widget _buildBackgroundProgress(Size size, int progress) {
    return RotatedBox(
      quarterTurns: 7,
      child: SizedBox(
        height: size.width,
        child: LinearPercentIndicator(
          percent: progress / 100,
          lineHeight: size.width,
          backgroundColor: Colors.black,
          progressColor: ThemeColors.primaryDark,
        ),
      ),
    );
  }

  Widget _buildForegroundProgress(
      int progress, double radius, String feedback) {
    return Center(
      child: AdvancedProgress(
        radius: radius,
        levelAmount: 100,
        levelLowHeight: 16,
        levelHighHeight: 20,
        division: 10,
        secondaryWidth: 10,
        progressGap: 10,
        primaryValue: progress / 100,
        secondaryValue: progress / 100,
        primaryColor: Colors.yellow,
        secondaryColor: Colors.red,
        tertiaryColor: Colors.white24,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$progress %',
              textAlign: TextAlign.center,
              style: TextStyle(
                letterSpacing: 1.5,
                fontWeight: FontWeight.w400,
                fontSize: radius / 1.5,
                color: Colors.white,
              ),
            ),
            Text(
              feedback.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                letterSpacing: 1.5,
                fontWeight: FontWeight.w800,
                fontSize: radius / 8,
                color: Colors.white24,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorState(SavingState state, AppLocalizations l10n) {
    return EmptyState(
      title: emptyStateMessage(state.feedback, l10n),
      showRetry: true,
      onRetry: () => _bloc.add(const SavingSongsFetch()),
    );
  }
}
