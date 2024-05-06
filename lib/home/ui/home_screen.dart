import 'package:context_menus/context_menus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:iconsax/iconsax.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:textstyle_extensions/textstyle_extensions.dart';

import '../../common/theme/theme_colors.dart';
import '../../common/utils/app_util.dart';
import '../../common/widgets/general/list_items.dart';
import '../../data/models/book.dart';
import '../../data/models/songext.dart';
import '../../navigator/route_names.dart';
import '../../common/theme/theme_fonts.dart';
import '../../common/utils/env/flavor_config.dart';
import '../../common/widgets/action/base_buttons.dart';
import '../../common/widgets/progress/custom_snackbar.dart';
import '../../common/widgets/progress/general_progress.dart';
import '../../common/widgets/progress/line_progress.dart';
import '../bloc/home_bloc.dart';

part 'home_screen_widgets.dart';
part 'mobile/search_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  late HomeBloc _bloc;
  bool updateFound = false;
  int currentPage = 0;

  @override
  void initState() {
    _bloc = context.read<HomeBloc>();

    if (isMobile) {
      checkPermissions();
      if (FlavorConfig.isProd()) {
        _bloc.add(const HomeCheckUpdates());
      }
    }
    _bloc.add(const HomeFetchData());
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

  @override
  Widget build(BuildContext context) {
    var tr = AppLocalizations.of(context)!;
    Size size = MediaQuery.of(context).size;
    bool isTabletOrIpad = size.shortestSide > 550;

    var homeBody = BlocConsumer<HomeBloc, HomeState>(
      bloc: _bloc,
      listener: (context, state) {
        if (state.status == Status.updateFound) {
          setState(() => updateFound = true);
          CustomSnackbar.show(context, feedbackMessage(state.feedback, tr),
              isSuccess: true);
        }
        if (state.status == Status.success) {
          setState(() => updateFound = false);
        }
      },
      builder: (context, state) {
        if (state.status == Status.inProgress) {
          return const CircularProgress();
        } else if (state.status == Status.updateFound) {
          return UpdateWidget(
            size: size.width / 3,
            onPressed: () => _bloc.add(const HomeUpdateApp()),
          );
        } else if (state.status == Status.success) {
          return HomeScreenBody(parent: this);
        } else {
          return HomeScreenBody(parent: this);
        }
      },
    );

    var bottomNavigation = NavigationBar(
      onDestinationSelected: (int index) {
        setState(() => currentPage = index);
      },
      height: 50,
      indicatorColor: ThemeColors.primaryDark,
      backgroundColor: Colors.white,
      selectedIndex: currentPage,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      destinations: const <Widget>[
        NavigationDestination(
          selectedIcon: Icon(Icons.home),
          icon: Icon(Icons.home_outlined),
          label: 'HOME',
        ),
        NavigationDestination(
          icon: Badge(child: Icon(Icons.list)),
          label: 'LIST',
        ),
        NavigationDestination(
          icon: Badge(child: Icon(Icons.favorite)),
          label: 'LIKES',
        ),
        NavigationDestination(
          icon: Badge(child: Icon(Icons.edit)),
          label: 'DRAFTS',
        ),
      ],
    );

    return Scaffold(
      backgroundColor: ThemeColors.gray,
      appBar: AppBar(
        title: const Text('Home'),
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
              ),
            ),
          ),
        ],
      ),
      body: homeBody,
      bottomNavigationBar:
          isDesktop || isMobile && isTabletOrIpad ? null : bottomNavigation,
    );
  }
}
