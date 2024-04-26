part of 'selecting_screen.dart';

class SelectingScreenBody extends StatefulWidget {
  const SelectingScreenBody({super.key});

  @override
  State<SelectingScreenBody> createState() => _SelectingScreenBodyState();
}

class _SelectingScreenBodyState extends State<SelectingScreenBody> {
  late SelectingBloc _bloc;
  late LocalStorage _prefs;
  String selectedBooks = "";
  List<String> bookNos = [];

  @override
  void initState() {
    super.initState();
    _prefs = getIt<LocalStorage>();
    _bloc = context.read<SelectingBloc>();

    selectedBooks = _prefs.getPrefString(PrefConstants.selectedBooksKey);
    if (selectedBooks.isNotEmpty) {
      bookNos = selectedBooks.split(",");
    }
    _bloc.add(const SelectingBooksFetch());
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations? tr = AppLocalizations.of(context)!;

    return BlocBuilder<SelectingBloc, SelectingState>(
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
          body: const SelectingScreenBodyDetails(),
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
