import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../common/data/models/basic_model.dart';
import '../../../common/data/models/models.dart';
import '../../../common/widgets/action/bottom_nav_bar.dart';
import '../../../common/widgets/action/sidebar_btn.dart';
import '../../../common/widgets/general/fading_index_stack.dart';
import '../../../core/theme/theme_colors.dart';
import '../../../core/theme/theme_fonts.dart';
import '../../../common/utils/app_util.dart';
import '../../../common/utils/constants/app_constants.dart';
import '../../../core/navigator/route_names.dart';
import '../../../core/theme/theme_styles.dart';
import '../likes/ui/likes_screen.dart';
import '../songs/ui/songs_screen.dart';
import '../../settings/ui/settings_screen.dart';

part 'widgets/home_mobile.dart';
part 'widgets/home_pc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  late AppLocalizations l10n;

  PageController pageController = PageController();
  bool isTabletOrIpad = false;
  int selectedPageIndex = 0;

  List<PageItem> pages = [
    PageItem(title: 'Songs', icon: Icons.search, screen: SongsScreen()),
    PageItem(title: 'Likes', icon: Icons.favorite, screen: LikesScreen()),
    //PageItem(title: 'Lists', icon: Icons.list, screen: ListsScreen()),
    //PageItem(title: 'Drafts', icon: Icons.edit, screen: DraftsScreen()),
  ];

  @override
  void initState() {
    super.initState();
    selectedPageIndex = pageController.initialPage;

    if (isMobile) {
      checkPermissions(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    l10n = AppLocalizations.of(context)!;

    return isTabletOrIpad ? HomePc(parent: this) : HomeMobile(parent: this);
  }

  void onPageChanged(int index) {
    setState(() {
      selectedPageIndex = index;
      if (!isTabletOrIpad) {
        pageController.jumpToPage(index);
      }
    });
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
