import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:iconsax/iconsax.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:textstyle_extensions/textstyle_extensions.dart';

import '../../../common/theme/theme_colors.dart';
import '../../../common/utils/app_util.dart';
import '../../widgets/progress/general_progress.dart';
import '../../../di/injectable.dart';
import '../../../navigator/route_names.dart';
import '../../theme/theme_fonts.dart';
import '../../utils/env/flavor_config.dart';
import '../../widgets/action/base_buttons.dart';
import '../../widgets/progress/custom_snackbar.dart';
import '../bloc/home_bloc.dart';

part 'home_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  late HomeBloc _bloc;
  String username = "Guest";
  bool updateFound = false;

  @override
  void initState() {
    _bloc = getIt<HomeBloc>();

    if (isMobile) {
      checkPermissions();
      if (FlavorConfig.isProd()) {
        _bloc.add(const HomeCheckUpdates());
      }
    }
    super.initState();
  }

  Future<void> checkPermissions() async {
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
      showPermanentlyDeniedDialog();
    }
  }

  @override
  Widget build(BuildContext context) {
    var tr = AppLocalizations.of(context)!;
    Size size = MediaQuery.of(context).size;

    var homeBody = BlocConsumer(
      bloc: _bloc,
      listener: (context, state) {
        if (state is HomeUpdateState) {
          setState(() => updateFound = true);
          CustomSnackbar.show(context, feedbackMessage(state.feedback, tr),
              isSuccess: true);
        }
        if (state is HomeSuccessState) {
          setState(() => updateFound = false);
        }
      },
      builder: (context, state) {
        if (state is HomeProgressState) {
          return const CircularProgress();
        } else if (state is HomeUpdateState) {
          return UpdateWidget(
            size: size.width / 3,
            onPressed: () => _bloc.add(const HomeUpdateApp()),
          );
        } else if (state is HomeSuccessState) {
          return const EmptyState();
        } else {
          return const EmptyState();
        }
      },
    );

    return Scaffold(
      backgroundColor: ThemeColors.gray,
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'Home',
          style: TextStyle(
            color: ThemeColors.primary,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        automaticallyImplyLeading: false,
        elevation: 0,
        actions: [
          InkWell(
            onTap: () {
              if (updateFound) {
                _bloc.add(const HomeUpdateApp());
              } else {
                Navigator.pushNamed(context, RouteNames.account);
              }
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(
                updateFound ? Icons.system_update : Iconsax.profile_circle,
                size: 50,
                color: ThemeColors.primary,
              ),
            ),
          ),
        ],
      ),
      body: homeBody,
    );
  }

  Future<void> showPermanentlyDeniedDialog() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Permission Required'),
          content: const Text(
              'This app requires storage permission to function properly.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                openAppSettings(); // Open app settings manually
              },
              child: const Text('Open Settings'),
            ),
          ],
        );
      },
    );
  }
}
