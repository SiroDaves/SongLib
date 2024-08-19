part of 'selecting_screen.dart';

class SelectingBody extends StatefulWidget {
  const SelectingBody({super.key});

  @override
  State<SelectingBody> createState() => SelectingBodyState();
}

class SelectingBodyState extends State<SelectingBody> {
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
        _handleStateChanges(context, state);
      },
      builder: (context, state) {
        return Scaffold(
          appBar: _buildAppBar(state),
          body: SelectingDetails(parent: this),
          floatingActionButton: _buildFloatingActionButton(state),
        );
      },
    );
  }

  void _handleStateChanges(BuildContext context, SelectingState state) {
    switch (state.status) {
      case Status.booksSaved:
        Navigator.pushNamed(context, RouteNames.saving);
        break;
      case Status.failure:
        CustomSnackbar.show(
          context,
          feedbackMessage(state.feedback, l10n),
        );
        CustomSnackbar.show(
          context,
          'We encountered an error while trying to perform your request',
        );
        break;
      case Status.booksFetched:
        CustomSnackbar.show(
          context,
          'Here are the available books, please select as many as you like to proceed',
          isSuccess: true,
        );
        break;
      default:
        break;
    }
  }

  AppBar _buildAppBar(SelectingState state) {
    return AppBar(
      title: Text(
        state.status == Status.inProgress
            ? l10n.booksTitleLoading
            : l10n.booksTitle,
      ),
      actions: state.status == Status.inProgress
          ? null
          : [
              _buildRefreshButton(),
              _buildSettingsButton(),
            ],
    );
  }

  Widget _buildRefreshButton() {
    return IconButton(
      icon: const Icon(Icons.refresh),
      onPressed: () => _bloc.add(const SelectingBooksFetch()),
    );
  }

  Widget _buildSettingsButton() {
    return IconButton(
      icon: const Icon(Icons.settings),
      onPressed: () => Navigator.pushNamed(context, RouteNames.settings),
    );
  }

  Widget? _buildFloatingActionButton(SelectingState state) {
    if (state.status == Status.inProgress || state.status == Status.failure) {
      return null;
    }

    return FloatingActionButton.extended(
      backgroundColor: Theme.of(context).brightness == Brightness.light
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
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      icon: const Icon(Icons.check, color: Colors.white),
    );
  }
}
