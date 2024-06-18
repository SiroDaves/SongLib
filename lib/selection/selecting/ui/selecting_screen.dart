import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_platform_alert/flutter_platform_alert.dart';

import '../../../common/theme/theme_colors.dart';
import '../../../common/theme/theme_styles.dart';
import '../../../common/utils/app_util.dart';
import '../../../common/utils/logger.dart';
import '../../../common/widgets/general/list_items.dart';
import '../../../common/widgets/progress/custom_snackbar.dart';
import '../../../common/widgets/progress/general_progress.dart';
import '../../../common/widgets/progress/skeleton.dart';
import '../../../data/models/basic_model.dart';
import '../../../data/models/book.dart';
import '../../../navigator/route_names.dart';
import '../bloc/selecting_bloc.dart';

part 'selecting_screen_body.dart';
part 'selecting_screen_body_details.dart';

class SelectingScreen extends StatelessWidget {
  const SelectingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return SelectingBloc();
      },
      child: const SelectingScreenBody(),
    );
  }
}

Future<void> areYouDoneDialog(
  SelectingScreenBodyState parent,
  AppLocalizations l10n,
  bool isValid,
) async {
  if (isValid) {
    var result = await FlutterPlatformAlert.showCustomAlert(
      windowTitle: l10n.doneSelecting,
      text: l10n.doneSelectingBody,
      iconStyle: IconStyle.information,
      neutralButtonTitle: l10n.cancel.toUpperCase(),
      positiveButtonTitle: l10n.proceed.toUpperCase(),
    );
    if (result == CustomButton.positiveButton) {
      parent._bloc.add(SelectingSubmitData(parent.booksSelected));
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
