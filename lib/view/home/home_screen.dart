import 'package:context_menus/context_menus.dart';
import 'package:flutter/material.dart';
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
import '../../util/constants/app_constants.dart';
import '../../viewmodel/home/home_vm.dart';
import '../../widget/general/app_bar.dart';
import '../../widget/general/inputs.dart';
import '../../widget/general/labels.dart';
import '../../widget/general/list_items.dart';
import '../../widget/progress/line_progress.dart';
import '../../widget/provider/provider_widget.dart';
import '../lists/list_view_popup.dart';
import 'widgets/search_list.dart';
import 'widgets/search_songs.dart';

part 'tabs/drafts_tab.dart';
part 'tabs/history_tab.dart';
part 'tabs/search_tab.dart';
part 'tabs/likes_tab.dart';
part 'tabs/list_tab.dart';

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
        return Scaffold(
          appBar: AppBar(
            title: [
              Image.asset(
                ThemeAssets.appIcon,
                height: 35,
                width: 35,
              ),
              const SizedBox(width: 10),
              const Text(
                AppConstants.appTitle,
                style: TextStyle(
                  fontSize: 25,
                  letterSpacing: 3,
                  fontWeight: FontWeight.bold,
                ),
              )
            ].toRow(),
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
                Tab(text: 'Notes'.toUpperCase()),
              ],
            ),
          ),
          body: TabBarView(
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
    );
  }

  @override
  void goToPresentor() => MainNavigatorWidget.of(context).goToPresentor();

  @override
  void goToEditor() => MainNavigatorWidget.of(context).goToEditor();

  @override
  void goToListView() => MainNavigatorWidget.of(context).goToListView();

  @override
  void goToHelpDesk() => MainNavigatorWidget.of(context).goToHelpDesk();

  @override
  void goToDonation() => MainNavigatorWidget.of(context).goToDonation();

  @override
  void goToMerchandise() => MainNavigatorWidget.of(context).goToMerchandise();

  @override
  void goToSettings() => MainNavigatorWidget.of(context).goToSettings();
}
