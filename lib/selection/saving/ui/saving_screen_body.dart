part of 'saving_screen.dart';

class SavingScreenBody extends StatefulWidget {
  const SavingScreenBody({super.key});

  @override
  State<SavingScreenBody> createState() => _SavingScreenBodyState();
}

class _SavingScreenBodyState extends State<SavingScreenBody> {
  late SavingBloc _bloc;
  late LocalStorage _prefs;
  String selectedBooks = "";
  List<String> bookNos = [];

  @override
  void initState() {
    super.initState();
    _prefs = getIt<LocalStorage>();
    _bloc = context.read<SavingBloc>();

    selectedBooks = _prefs.getPrefString(PrefConstants.selectedBooksKey);
    if (selectedBooks.isNotEmpty) {
      bookNos = selectedBooks.split(",");
    }
    _bloc.add(const SavingBooksFetch());
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations? tr = AppLocalizations.of(context)!;

    BlocBuilder<SavingBloc, SavingState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              state.status.isInProgress ? tr.booksTitleLoading : tr.booksTitle,
            ),
            actions: [
              state.status.isInProgress
                  ? const SizedBox.shrink()
                  : InkWell(
                      onTap: () => _bloc.add(const SavingBooksFetch()),
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
                          onPressed: () {},
                          title: tr.proceed,
                        ),
            ],
          ),
          body: const SavingScreenBodyDetails(),
          floatingActionButton: state.status.isInProgress
              ? const SizedBox.shrink()
              : FloatingActionButton(
                  backgroundColor: ThemeColors.primary,
                  onPressed: () {},
                  child: const Icon(Icons.check, color: Colors.white),
                ),
        );
      },
    );

    return BlocConsumer<SavingBloc, SavingState>(
      bloc: _bloc,
      listener: (context, state) {
        //
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              state.status.isInProgress ? tr.booksTitleLoading : tr.booksTitle,
            ),
            actions: [
              state.status.isInProgress
                  ? const SizedBox.shrink()
                  : InkWell(
                      onTap: () => _bloc.add(const SavingBooksFetch()),
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
                          onPressed: () {},
                          title: tr.proceed,
                        ),
            ],
          ),
          body: const SavingScreenBodyDetails(),
          floatingActionButton: state.status.isInProgress
              ? const SizedBox.shrink()
              : FloatingActionButton(
                  backgroundColor: ThemeColors.primary,
                  onPressed: () {},
                  child: const Icon(Icons.check, color: Colors.white),
                ),
        );
      },
    );
  }
}
