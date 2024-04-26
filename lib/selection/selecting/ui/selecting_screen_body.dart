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

    BlocBuilder<SelectingBloc, SelectingState>(
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
                          onPressed: () =>
                              areYouDoneDialog(context, state.isValid),
                          title: tr.proceed,
                        ),
            ],
          ),
          body: const SelectingScreenBodyDetails(),
          floatingActionButton: state.status.isInProgress
              ? const SizedBox.shrink()
              : FloatingActionButton(
                  backgroundColor: ThemeColors.primary,
                  onPressed: () => areYouDoneDialog(context, state.isValid),
                  child: const Icon(Icons.check, color: Colors.white),
                ),
        );
      },
    );

    return BlocConsumer<SelectingBloc, SelectingState>(
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
                          onPressed: () =>
                              areYouDoneDialog(context, state.isValid),
                          title: tr.proceed,
                        ),
            ],
          ),
          body: const SelectingScreenBodyDetails(),
          floatingActionButton: state.status.isInProgress
              ? const SizedBox.shrink()
              : FloatingActionButton(
                  backgroundColor: ThemeColors.primary,
                  onPressed: () => areYouDoneDialog(context, state.isValid),
                  child: const Icon(Icons.check, color: Colors.white),
                ),
        );
      },
    );
  }

  Future<void> areYouDoneDialog(BuildContext context, bool isValid) async {
    var tr = AppLocalizations.of(context)!;
    if (isValid) {
      var result = await FlutterPlatformAlert.showCustomAlert(
        windowTitle: tr.doneSelecting,
        text: tr.doneSelectingBody,
        iconStyle: IconStyle.information,
        neutralButtonTitle: tr.cancel,
        positiveButtonTitle: tr.proceed,
      );
      if (result == CustomButton.positiveButton) {
        _bloc.add(const SelectingSubmit());
      }
    } else {
      await FlutterPlatformAlert.showCustomAlert(
        windowTitle: tr.noSelection,
        text: tr.noSelectionBody,
        iconStyle: IconStyle.warning,
        neutralButtonTitle: tr.okay,
      );
    }
  }
}
