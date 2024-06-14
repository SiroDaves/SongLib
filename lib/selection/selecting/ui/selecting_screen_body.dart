part of 'selecting_screen.dart';

class SelectingScreenBody extends StatefulWidget {
  const SelectingScreenBody({super.key});

  @override
  State<SelectingScreenBody> createState() => SelectingScreenBodyState();
}

class SelectingScreenBodyState extends State<SelectingScreenBody> {
  late SelectingBloc _bloc;
  late AppLocalizations l10n;
  List<Book> booksSelected = [];

  @override
  void initState() {
    super.initState();
    _bloc = context.read<SelectingBloc>();
    _bloc.add(const SelectingBooksFetch());
  }

  @override
  Widget build(BuildContext context) {
    l10n = AppLocalizations.of(context)!;

    return BlocConsumer<SelectingBloc, SelectingState>(
      bloc: _bloc,
      listener: (context, state) {
        if (state.status == Status.booksSaved) {
          Navigator.pushNamed(context, RouteNames.saving);
        }
        if (state.status == Status.failure) {
          CustomSnackbar.show(
            context,
            feedbackMessage(state.feedback, l10n),
          );
        }
        if (state.status == Status.booksFetched) {
          CustomSnackbar.show(
            context,
            'Here are the available books, please select as much as you like to proceed',
            isSuccess: true,
          );
        }
        if (state.status == Status.failure) {
          CustomSnackbar.show(
            context,
            feedbackMessage(state.feedback, l10n),
          );
        }
        if (state.status == Status.failure) {
          CustomSnackbar.show(
            context,
            'We encountered an error while trying to perfom your request',
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              state.status == Status.inProgress
                  ? l10n.booksTitleLoading
                  : l10n.booksTitle,
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
                          title: l10n.proceed,
                        ),
            ],
          ),
          body: SelectingScreenBodyDetails(parent: this),
          floatingActionButton: state.status == Status.inProgress
              ? const SizedBox.shrink()
              : state.status == Status.failure
                  ? const SizedBox.shrink()
                  : FloatingActionButton(
                      backgroundColor:
                          Theme.of(context).brightness == Brightness.light
                              ? ThemeColors.primary
                              : ThemeColors.kPrimaryDeepOrange,
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
    var l10n = AppLocalizations.of(context)!;
    if (isValid) {
      var result = await FlutterPlatformAlert.showCustomAlert(
        windowTitle: l10n.doneSelecting,
        text: l10n.doneSelectingBody,
        iconStyle: IconStyle.information,
        neutralButtonTitle: l10n.cancel,
        positiveButtonTitle: l10n.proceed,
      );
      if (result == CustomButton.positiveButton) {
        _bloc.add(SelectingSubmitData(booksSelected));
      }
    } else {
      await FlutterPlatformAlert.showCustomAlert(
        windowTitle: l10n.noSelection,
        text: l10n.noSelectionBody,
        iconStyle: IconStyle.warning,
        neutralButtonTitle: l10n.okay,
      );
    }
  }
}
