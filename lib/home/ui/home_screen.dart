import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../common/theme/theme_fonts.dart';
import '../../common/theme/theme_styles.dart';
import '../../common/utils/app_util.dart';
import '../../common/utils/constants/app_constants.dart';
import '../../common/utils/env/flavor_config.dart';
import '../../common/widgets/general/fading_index_stack.dart';
import '../../common/widgets/progress/skeleton.dart';
import '../../data/models/basic_model.dart';
import '../../search/ui/search_screen.dart';
import '../../search/ui/search_songs.dart';
import '../../navigator/route_names.dart';
import '../../settings/ui/settings_screen.dart';
import '../bloc/home_bloc.dart';
import 'large_screen/sidebar.dart';

part 'home_screen_body.dart';
part 'small_screen/home_screen_bottom_navbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  late AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    l10n = AppLocalizations.of(context)!;

    return BlocProvider(
      create: (context) {
        return HomeBloc();
      },
      child: const HomeScreenBody(),
    );
  }
}

Future<void> checkPermissions(BuildContext context) async {
  final PermissionStatus permission = await Permission.storage.status;
  if (permission != PermissionStatus.granted) {
    await Permission.storage.request();
    // access media location needed for android 10/Q
    await Permission.accessMediaLocation.request();
    // manage external storage needed for android 11/R
    await Permission.manageExternalStorage.request();
    //showToast(text: 'Permission granted', state: ToastStates.success);
  } else if (permission != PermissionStatus.denied) {
    //showToast(text: 'Permission denied', state: ToastStates.error);
  } else if (permission != PermissionStatus.permanentlyDenied) {
    showPermanentlyDeniedDialog(context);
  }
}

Future<void> showPermanentlyDeniedDialog(BuildContext context) async {
  late AppLocalizations l10n = AppLocalizations.of(context)!;
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(l10n.labelPermissionTitle),
        content: Text(l10n.labelPermissionText),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () => openAppSettings(),
            child: Text(l10n.openSettings),
          ),
        ],
      );
    },
  );
}
