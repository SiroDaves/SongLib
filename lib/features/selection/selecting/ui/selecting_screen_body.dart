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
    l10n = AppLocalizations.of(context);

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
            actions: state.status == Status.inProgress
                ? []
                : [
                    InkWell(
                      onTap: () => _bloc.add(const SelectingBooksFetch()),
                      child: const Padding(
                        padding: EdgeInsets.all(Sizes.sm),
                        child: Icon(Icons.refresh),
                      ),
                    ),
                    InkWell(
                      onTap: () =>
                          Navigator.pushNamed(context, RouteNames.settings),
                      child: const Padding(
                        padding: EdgeInsets.all(Sizes.sm),
                        child: Icon(Icons.settings),
                      ),
                    ),
                  ],
          ),
          body: SelectingScreenBodyDetails(parent: this),
          floatingActionButton: state.status == Status.inProgress
              ? const SizedBox.shrink()
              : state.status == Status.failure
                  ? const SizedBox.shrink()
                  : FloatingActionButton.extended(
                      backgroundColor:
                          Theme.of(context).brightness == Brightness.light
                              ? ThemeColors.primary
                              : ThemeColors.kPrimaryDeepOrange,
                      onPressed: () => areYouDoneDialog(
                        this,
                        l10n,
                        booksSelected.isNotEmpty,
                      ),
                      label: Text(
                        l10n.proceed.toUpperCase(),
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      icon: const Icon(Icons.check, color: Colors.white),
                    ),
        );
      },
    );
  }
}
