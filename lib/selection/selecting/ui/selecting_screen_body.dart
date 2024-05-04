part of 'selecting_screen.dart';

class SelectingScreenBody extends StatefulWidget {
  const SelectingScreenBody({super.key});

  @override
  State<SelectingScreenBody> createState() => SelectingScreenBodyState();
}

class SelectingScreenBodyState extends State<SelectingScreenBody> {
  late SelectingBloc _bloc;
  List<Book> booksSelected = [];

  @override
  void initState() {
    super.initState();
    _bloc = context.read<SelectingBloc>();
    _bloc.add(const SelectingBooksFetch());
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations? tr = AppLocalizations.of(context)!;

    return BlocConsumer<SelectingBloc, SelectingState>(
      bloc: _bloc,
      listener: (context, state) {
        if (state.status == Status.booksSaved) {
          Navigator.pushNamed(context, RouteNames.saving);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              state.status == Status.inProgress
                  ? tr.booksTitleLoading
                  : tr.booksTitle,
            ),
            actions: [
              state.status == Status.inProgress
                  ? const SizedBox.shrink()
                  : InkWell(
                      onTap: () => _bloc.add(const SelectingBooksFetch()),
                      child: const Padding(
                        padding: EdgeInsets.all(10),
                        child: Icon(Icons.refresh),
                      ),
                    ),
              state.status == Status.inProgress
                  ? const SizedBox.shrink()
                  : state.status == Status.failure
                      ? const SizedBox.shrink()
                      : IconTextBtn(
                          onPressed: () => areYouDoneDialog(
                            context,
                            booksSelected.isNotEmpty,
                          ),
                          title: tr.proceed,
                        ),
            ],
          ),
          body: SelectingScreenBodyDetails(parent: this),
          floatingActionButton: state.status == Status.inProgress
              ? const SizedBox.shrink()
              : state.status == Status.failure
                  ? const SizedBox.shrink()
                  : FloatingActionButton(
                      backgroundColor: ThemeColors.primary,
                      onPressed: () => areYouDoneDialog(
                        context,
                        booksSelected.isNotEmpty,
                      ),
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
        _bloc.add(SelectingSubmitData(booksSelected));
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
