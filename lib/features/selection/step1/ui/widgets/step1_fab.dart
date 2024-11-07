part of '../step1_screen.dart';

class Step1Fab extends StatefulWidget {
  final Step1ScreenState parent;
  const Step1Fab({Key? key, required this.parent}) : super(key: key);

  @override
  State<Step1Fab> createState() => Step1FabState();
}

class Step1FabState extends State<Step1Fab> {
  late Step1ScreenState parent;

  @override
  Widget build(BuildContext context) {
    parent = widget.parent;
    var l10n = AppLocalizations.of(context)!;

    return BlocBuilder(
      bloc: parent.bloc,
      builder: (context, state) {
        if (state is ProgressState || state is FailureState) {
          return const SizedBox.shrink();
        } else {
          return FloatingActionButton.extended(
            backgroundColor: Theme.of(context).brightness == Brightness.light
                ? ThemeColors.primary
                : ThemeColors.kPrimaryDeepOrange,
            onPressed: () => areYouDoneDialog(
              parent,
              l10n,
              parent.booksSelected.isNotEmpty,
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
      },
    );
  }
}
