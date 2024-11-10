part of '../step1_screen.dart';

class Step1Fab extends StatefulWidget {
  final Step1ScreenState parent;
  const Step1Fab({Key? key, required this.parent}) : super(key: key);

  @override
  State<Step1Fab> createState() => Step1FabState();
}

class Step1FabState extends State<Step1Fab> {
  late Step1ScreenState parent;
  late AppLocalizations l10n;

  Future<void> areYouDoneDialog() async {
    if (parent.booksSelected.isNotEmpty) {
      var result = await FlutterPlatformAlert.showCustomAlert(
        windowTitle: l10n.doneSelecting,
        text: l10n.doneSelecting,
        iconStyle: IconStyle.information,
        neutralButtonTitle: l10n.cancel.toUpperCase(),
        positiveButtonTitle: l10n.proceed.toUpperCase(),
      );
      if (result == CustomButton.positiveButton) {
        context.read<Step1Bloc>().add(SaveBooks('', parent.booksSelected));
      }
    } else {
      await FlutterPlatformAlert.showCustomAlert(
        windowTitle: l10n.noSelection,
        text: l10n.noSelectionBody,
        iconStyle: IconStyle.warning,
        neutralButtonTitle: l10n.okay.toUpperCase(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    parent = widget.parent;
    l10n = AppLocalizations.of(context)!;
    var fabBgColor = Theme.of(context).brightness == Brightness.light
        ? ThemeColors.primary
        : ThemeColors.kPrimaryDeepOrange;

    return BlocBuilder<Step1Bloc, Step1State>(
      builder: (context, state) {
        if (state is Step1ProgressState || state is Step1FailureState) {
          return const SizedBox.shrink();
        } else {
          return FloatingActionButton.extended(
            backgroundColor: fabBgColor,
            onPressed: () => areYouDoneDialog(),
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
