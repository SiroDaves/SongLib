import 'package:context_menus/context_menus.dart';
import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../model/base/book.dart';
import '../../model/base/draft.dart';
import '../../model/base/listed.dart';
import '../../model/base/songext.dart';
import '../../navigator/main_navigator.dart';
import '../../navigator/route_names.dart';
import '../../theme/theme_assets.dart';
import '../../theme/theme_colors.dart';
import '../../theme/theme_styles.dart';
import '../../util/constants/app_constants.dart';
import '../../util/constants/pref_constants.dart';
import '../../util/constants/utilities.dart';
import '../../vm/home/home_vm.dart';
import '../../widget/action/sidebar.dart';
import '../../widget/general/app_bar.dart';
import '../../widget/general/fading_index_stack.dart';
import '../../widget/general/inputs.dart';
import '../../widget/general/labels.dart';
import '../../widget/general/list_items.dart';
import '../../widget/general/toast.dart';
import '../../widget/progress/circular_progress.dart';
import '../../widget/progress/line_progress.dart';
import '../../widget/provider/provider_widget.dart';
import '../../widget/search/search_list.dart';
import '../../widget/search/search_songs.dart';
import '../manage/settings_screen.dart';

part '../../widget/search/pc_headers.dart';
part 'home_screen_helpers.dart';
part 'mobile/drafts_tab.dart';
part 'mobile/history_tab.dart';
part 'mobile/search_tab.dart';
part 'mobile/list_popup.dart';
part 'mobile/likes_tab.dart';
part 'mobile/list_tab.dart';
part 'pc/drafts_tab_pc.dart';
part 'pc/help_desk_pc.dart';
part 'pc/likes_tab_pc.dart';
part 'pc/list_tab_pc.dart';
part 'pc/search_tab_pc.dart';

/// Home screen with 3 tabs of list, search and notes screens
class HomeScreen extends StatefulWidget {
  static const String routeName = RouteNames.homeScreen;
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>
    with TickerProviderStateMixin
    implements HomeNavigator {
  late TabController tabController;
  Size? size;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      length: 4,
      vsync: this,
      initialIndex: 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return ProviderWidget<HomeVm>(
      create: () => GetIt.I()..init(this),
      consumerWithThemeAndLocalization:
          (context, vm, child, theme, localization) {
        vm.context = context;
        vm.tr = AppLocalizations.of(context)!;
        var mobileAppbar = AppBar(
          title: Row(
            children: [
              Image.asset(ThemeAssets.appIcon, height: 35, width: 35),
              const SizedBox(width: 10),
              const Text(
                AppConstants.appTitle,
                style: TextStyle(
                  fontSize: 25,
                  letterSpacing: 3,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          actions: <Widget>[
            InkWell(
              onTap: () async {
                await showSearch(
                  context: context,
                  delegate: SearchSongs(context, vm, size!.height),
                );
              },
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Icon(Icons.search),
              ),
            ),
            InkWell(
              onTap: goToHelpDesk,
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Icon(Icons.help),
              ),
            ),
            InkWell(
              onTap: goToSettings,
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Icon(Icons.settings),
              ),
            ),
          ],
          bottom: TabBar(
            controller: tabController,
            tabs: <Widget>[
              Tab(text: 'Lists'.toUpperCase()),
              Tab(text: 'Search'.toUpperCase()),
              Tab(text: 'Likes'.toUpperCase()),
              Tab(text: 'Drafts'.toUpperCase()),
            ],
          ),
        );
        var desktopAppbar = AppBar(
          title: Row(
            children: [
              const SizedBox(width: 10),
              Image.asset(ThemeAssets.appIcon, height: 35, width: 35),
              const SizedBox(width: 10),
              const Text(
                '${AppConstants.appTitle} ${AppConstants.appVersion}',
                style: TextStyle(fontSize: 25),
              ),
              const SizedBox(width: 60),
              PcSearch(vm),
              const SizedBox(width: 10),
            ],
          ),
          actions: <Widget>[
            PcActionBtn1(vm),
            /*const SizedBox(width: 0),
            InkWell(
              onTap: () {},
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Icon(Icons.notifications),
              ),
            ),*/
            const SizedBox(width: 20),
          ],
        );
        var desktopBody = Stack(
          children: [
            FadingIndexedStack(
              duration: Durations.slow,
              index: vm.pages.indexOf(vm.setPage),
              children: <Widget>[
                ListTabPc(vm),
                SearchTabPc(vm),
                LikesTabPc(vm),
                DraftsTabPc(vm),
                HelpDeskPc(vm),
                const SettingsScreen(),
              ],
            )
                .decorated(color: ThemeColors.accentLight)
                .positioned(
                    left: 300, right: 0, bottom: 0, top: 0, animate: true)
                .animate(.35.seconds, Curves.bounceIn),
            Sidebar(vm)
                .positioned(
                    left: 0, top: 0, bottom: 0, width: 300, animate: true)
                .animate(.35.seconds, Curves.easeOut),
          ],
        );

        return Scaffold(
          appBar: isDesktop ? desktopAppbar : mobileAppbar,
          body: TweenAnimationBuilder<double>(
            duration: Durations.slow,
            tween: Tween(begin: 0, end: 1),
            builder: (_, value, ___) {
              return FocusTraversalGroup(
                child: isDesktop
                    ? desktopBody
                    : TabBarView(
                        controller: tabController,
                        children: <Widget>[
                          ListTab(vm),
                          SearchTab(vm),
                          LikesTab(vm),
                          DraftsTab(vm),
                        ],
                      ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  void goToSongPresentor() => MainNavigator.of(context).goToSongPresentor();

  @override
  void goToSongPresentorPc() => MainNavigator.of(context).goToSongPresentorPc();

  @override
  void goToDraftPresentor() => MainNavigator.of(context).goToDraftPresentor();

  @override
  void goToDraftPresentorPc() =>
      MainNavigator.of(context).goToDraftPresentorPc();

  @override
  void goToSongEditor() => MainNavigator.of(context).goToSongEditor();

  @override
  void goToSongEditorPc() => MainNavigator.of(context).goToSongEditorPc();

  @override
  void goToDraftEditor(bool notEmpty) =>
      MainNavigator.of(context).goToDraftEditor(notEmpty);

  @override
  void goToDraftEditorPc(bool notEmpty) =>
      MainNavigator.of(context).goToDraftEditorPc(notEmpty);

  @override
  void goToListView() => MainNavigator.of(context).goToListView();

  @override
  void goToHelpDesk() => MainNavigator.of(context).goToHelpDesk();

  @override
  void goToDonation() => MainNavigator.of(context).goToDonation();

  @override
  void goToSettings() => MainNavigator.of(context).goToSettings();
}
