part of 'saving_screen.dart';

class SavingScreenBody extends StatefulWidget {
  const SavingScreenBody({super.key});

  @override
  State<SavingScreenBody> createState() => _SavingScreenBodyState();
}

class _SavingScreenBodyState extends State<SavingScreenBody> {
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
    AppLocalizations? tr = AppLocalizations.of(context)!;
    Size size = MediaQuery.of(context).size;
    double radius = isDesktop ? size.height / 2.5 : size.width / 2.5;
    return BlocConsumer<SavingBloc, SavingState>(
      bloc: _bloc,
      listener: (context, state) {
        if (state.status == Status.songsFetched) {
          _bloc.add(const SavingSubmitData());
        }
        if (state.status == Status.songsSaved) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            RouteNames.home,
            (route) => false,
          );
        }
      },
      builder: (context, state) {
        var backgroundProgress = RotatedBox(
          quarterTurns: 7,
          child: SizedBox(
            height: size.width,
            child: LinearPercentIndicator(
              percent: double.parse(
                (state.progress / 100).toStringAsFixed(1),
              ),
              lineHeight: size.width,
              backgroundColor: Colors.black,
              progressColor: ThemeColors.primaryDark,
            ),
          ),
        );
        var progressPercentage = Text(
          '${state.progress} %',
          textAlign: TextAlign.center,
          style: TextStyle(
            letterSpacing: 1.5,
            fontWeight: FontWeight.w400,
            fontSize: radius / 1.5,
            color: Colors.white,
          ),
        );
        var progressState = Center(
          child: Text(
            state.feedback.toUpperCase(),
            textAlign: TextAlign.center,
            style: TextStyle(
              letterSpacing: 1.5,
              fontWeight: FontWeight.w800,
              fontSize: radius / 8,
              color: Colors.white24,
            ),
          ),
        );

        var foregroundProgress = Center(
          child: AdvancedProgress(
            radius: radius,
            levelAmount: 100,
            levelLowHeight: 16,
            levelHighHeight: 20,
            division: 10,
            secondaryWidth: 10,
            progressGap: 10,
            primaryValue: state.progress / 100,
            secondaryValue: state.progress / 100,
            primaryColor: Colors.yellow,
            secondaryColor: Colors.red,
            tertiaryColor: Colors.white24,
            child: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(height: radius / 2.1),
                  progressPercentage,
                  progressState,
                  //timeLeft,
                ],
              ),
            ),
          ),
        );
        var progressStack = Stack(
          children: [
            backgroundProgress,
            foregroundProgress,
          ],
        );

        return Scaffold(
          backgroundColor:
              state.status == Status.songsSaving ? Colors.black : Colors.white,
          body: SafeArea(
            child: Stack(
              children: [
                state.status == Status.inProgress
                    ? const CircularProgress()
                    : (state.status == Status.songsSaving &&
                            state.songs.isNotEmpty)
                        ? progressStack
                        : const SizedBox.shrink(),
                state.status == Status.failure
                    ? EmptyState(
                        title: emptyStateMessage(state.feedback, tr),
                        showRetry: true,
                        onRetry: () => _bloc.add(const SavingSongsFetch()),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
        );
      },
    );
  }
}
