part of 'step1_screen.dart';

class Step1Body extends StatefulWidget {
  final Step1ScreenState parent;
  const Step1Body({super.key, required this.parent});

  @override
  State<Step1Body> createState() => Step1BodyState();
}

class Step1BodyState extends State<Step1Body> {
  late Step1ScreenState parent;
  late AppLocalizations l10n;
  List<Book> booksSelected = [];

  @override
  Widget build(BuildContext context) {
    parent = widget.parent;
    l10n = AppLocalizations.of(context)!;

    return BlocConsumer<Step1Bloc, Step1State>(
      bloc: parent.bloc,
      listener: (context, state) {
        if (state is SavedState) {
          Navigator.pushNamed(context, RouteNames.step2);
        }
        if (state is FailureState) {
          CustomSnackbar.show(
            context,
            feedbackMessage(state.feedback, l10n),
          );
          CustomSnackbar.show(
            context,
            'We encountered an error while trying to perform your request',
          );
        }
        if (state is FetchedState) {
          parent.booksListing = state.booksListing;
          CustomSnackbar.show(
            context,
            'Here are the available books, please select as many as you like to proceed',
            isSuccess: true,
          );
        }
      },
      builder: (context, state) {
        if (state is ProgressState) {
          return const SkeletonLoading();
        } else if (state is FailureState) {
          return EmptyState(
            title: emptyStateMessage(state.feedback, l10n),
            showRetry: true,
            onRetry: () => context.read<Step1Bloc>().add(const FetchBooks()),
          );
        } else if (state is FetchedState) {
          if (parent.booksListing.isNotEmpty) {
            return Step1Details(parent: parent);
          } else {
            return EmptyState(
              title: 'Sorry nothing to show here at the moment.',
              showRetry: true,
              onRetry: () => context.read<Step1Bloc>().add(const FetchBooks()),
            );
          }
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }
}
