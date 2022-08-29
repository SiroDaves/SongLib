import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../model/base/book.dart';
import '../../model/base/draft.dart';
import '../../model/base/listed.dart';
import '../../model/base/songext.dart';
import '../../navigator/main_navigator.dart';
import '../../navigator/route_names.dart';
import '../../theme/theme_colors.dart';
import '../../util/constants/app_constants.dart';
import '../../vm/home/home_vm.dart';
import '../../widget/general/labels.dart';
import '../../widget/general/list_items.dart';
import '../../widget/progress/line_progress.dart';
import '../../widget/provider/provider_widget.dart';
import '../lists/list_edit_screen.dart';
import '../lists/list_view_screen.dart';
import '../songs/editor_screen.dart';
import '../songs/presentor_screen.dart';
import 'widgets/tab1_search.dart';
import 'widgets/tab2_search.dart';
import 'widgets/tab3_search.dart';
import 'widgets/tabs_indicator.dart';

part 'tabs/listeds_tab.dart';
part 'tabs/notes_tab.dart';
part 'tabs/search_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = RouteNames.homeScreen;

  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

@visibleForTesting
class HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin
    implements HomeNavigator {
  Size? size;
  TabController? pages;
  int activeIndex = 1;

  void onItemTapped(int index) {
    switch (index) {
      case 0:
        return goToLikes();
      case 1:
        return goToSettings();
      case 2:
        return goToSettings();
    }
  }

  @override
  void initState() {
    super.initState();
    pages = TabController(vsync: this, length: 3, initialIndex: activeIndex)
      ..addListener(() {
        setState(() {
          activeIndex = pages!.index;
        });
      });
  }

  @override
  void dispose() {
    super.dispose();
    pages!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<HomeVm>(
      create: () => GetIt.I()..init(this),
      consumerWithThemeAndLocalization:
          (context, viewModel, child, theme, localization) => Scaffold(
        body: Stack(
          children: [
            TabBarView(
              controller: pages,
              children: [
                ListedsTab(viewModel: viewModel),
                SearchTab(viewModel: viewModel),
                NotesTab(viewModel: viewModel),
              ],
            ),
            TabsIndicator(controller: pages!),
            TabsIcons(controller: pages!),
          ],
        ),
        bottomNavigationBar: extraActions(viewModel),
      ),
    );
  }

  Widget extraActions(HomeVm viewModel) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: '',
        ),
        /*BottomNavigationBarItem(
          icon: Icon(Icons.history),
          label: '',
        ),*/
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: '',
        ),
      ],
      currentIndex: 0,
      onTap: onItemTapped,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: viewModel.isBusy ? ThemeColors.primary : Colors.white,
      unselectedItemColor:
          viewModel.isBusy ? ThemeColors.primary : Colors.white,
      backgroundColor: ThemeColors.primary,
    );
  }

  @override
  void goToLikes() => MainNavigatorWidget.of(context).goToLikes();

  @override
  void goToHistories() => MainNavigatorWidget.of(context).goToHistories();

  @override
  void goToSettings() => MainNavigatorWidget.of(context).goToSettings();
}
