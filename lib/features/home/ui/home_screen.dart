import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../common/utils/app_util.dart';
import '../../../common/utils/constants/app_constants.dart';
//import '../../../common/widgets/bottom_nav/bottom_nav_bar.dart';
import '../../../common/widgets/page_item.dart';
import '../../../core/navigator/route_names.dart';
import '../../../core/theme/theme_fonts.dart';
import '../../home_drafts/ui/drafts_screen.dart';
import '../../home_likes/ui/likes_screen.dart';
import '../../home_lists/ui/lists_screen.dart';
import '../../home_songs/ui/songs_screen.dart';
import '../../home_songs/ui/songs_search.dart';
import '../bloc/home_bloc.dart';

/// Default Screen to handle all the UIs after the Splash Screen
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: const HomeScreenBody(),
    );
  }
}

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => HomeScreenBodyState();
}

class HomeScreenBodyState extends State<HomeScreenBody> {
  late HomeBloc _bloc;
  int selectedPageIndex = 0;
  PageController pageController = PageController();
  PackageInfo packageInfo = PackageInfo(
    appName: '',
    packageName: '',
    version: '',
    buildNumber: '',
  );

  Future<void> getPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() => packageInfo = info);
  }

  @override
  void initState() {
    super.initState();
    _bloc = context.read<HomeBloc>();

    /*if (isMobile) {
      checkPermissions();
      if (Platform.isAndroid && FlavorConfig.isProd()) {
        getPackageInfo();
        _bloc.add(HomeCheckVersion(packageInfo.version));
      }
    }*/
    _bloc.add(const HomeFetchData());
    selectedPageIndex = pageController.initialPage;
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
    Size size = MediaQuery.of(context).size;
    final List<PageItem> pages = [
      PageItem(
        title: 'Songs',
        icon: Icons.search,
        screen: SongsScreen(parent: this),
      ),
      PageItem(
        title: 'Lists',
        icon: Icons.list,
        screen: ListsScreen(parent: this),
      ),
      PageItem(
        title: 'Likes',
        icon: Icons.favorite,
        screen: LikesScreen(parent: this),
      ),
      PageItem(
        title: 'Drafts',
        icon: Icons.edit,
        screen: DraftsScreen(parent: this),
      ),
    ];

    return Scaffold(
      appBar: isMobile
          ? AppBar(
              title: Text(
                AppConstants.appTitle,
                style: TextStyles.pageTitle1,
              ),
              actions: <Widget>[
                InkWell(
                  onTap: () async {
                    await showSearch(
                      context: context,
                      delegate: SongsSearch(context, _bloc, size.height),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(Icons.search),
                  ),
                ),
                InkWell(
                  onTap: () =>
                      Navigator.pushNamed(context, RouteNames.settings),
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(Icons.settings),
                  ),
                ),
              ],
            )
          : null,
      /*bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: selectedPageIndex,
        onPageChange: (int index) {
          setState(() {
            selectedPageIndex = index;
            pageController.jumpToPage(index);
          });
        },
        pages: pages,
      ),*/
      body: PageView(
        controller: pageController,
        onPageChanged: (index) => setState(() => selectedPageIndex = index),
        physics: const NeverScrollableScrollPhysics(),
        children: pages.map<Widget>((item) => item.screen).toList(),
      ),
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
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            const TextButton(
              onPressed: openAppSettings,
              child: Text('Open Settings'),
            ),
          ],
        );
      },
    );
  }
}
