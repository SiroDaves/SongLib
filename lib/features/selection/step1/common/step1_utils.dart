import 'package:flutter_platform_alert/flutter_platform_alert.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../bloc/step1_bloc.dart';
import '../ui/step1_screen.dart';

Future<void> areYouDoneDialog(
  Step1ScreenState parent,
  AppLocalizations l10n,
  bool isValid,
) async {
  if (isValid) {
    var result = await FlutterPlatformAlert.showCustomAlert(
      windowTitle: l10n.doneSelecting,
      text: l10n.doneSelecting,
      iconStyle: IconStyle.information,
      neutralButtonTitle: l10n.cancel.toUpperCase(),
      positiveButtonTitle: l10n.proceed.toUpperCase(),
    );
    if (result == CustomButton.positiveButton) {
      parent.bloc.add(SaveBooks('', parent.booksSelected));
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
