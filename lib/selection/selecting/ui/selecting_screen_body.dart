part of 'selecting_screen.dart';

class SelectingScreenBody extends StatefulWidget {
  const SelectingScreenBody({super.key});

  @override
  State<SelectingScreenBody> createState() => _SelectingBodyState();
}

class _SelectingBodyState extends State<SelectingScreenBody> {
  late SelectingBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = context.read<SelectingBloc>();
    _bloc.add(const SelectingBooksFetch());
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations? tr = AppLocalizations.of(context)!;

    return BlocBuilder<SelectingBloc, SelectingState>(
      buildWhen: (previous, current) => previous.books != current.books,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              state.status.isInProgress ? tr.booksTitleLoading : tr.booksTitle,
            ),
            actions: [
              state.status.isInProgress
                  ? const SmallCircularProgress()
                  : InkWell(
                      onTap: () => _bloc.add(const SelectingBooksFetch()),
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Icon(Icons.refresh),
                      ),
                    ),
              state.status.isInProgress
                  ? const SizedBox.shrink()
                  : state.status.isFailure
                      ? const SizedBox.shrink()
                      : IconTextBtn(
                          onPressed: () => {}, //areYouDoneDialog(context, vm),
                          title: tr.proceed,
                        ),
            ],
          ),
          body: _SelectingBodyDetails(),
          floatingActionButton: state.status.isInProgress
              ? const SizedBox.shrink()
              : FloatingActionButton(
                  backgroundColor: ThemeColors.primary,
                  onPressed: () => {}, //areYouDoneDialog(context, vm),
                  child: const Icon(Icons.check, color: Colors.white),
                ),
        );
      },
    );
  }
}
