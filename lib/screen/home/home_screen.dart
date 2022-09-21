import 'package:context_menus/context_menus.dart';
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
import '../../widget/general/inputs.dart';
import '../../widget/general/labels.dart';
import '../../widget/general/list_items.dart';
import '../../widget/progress/line_progress.dart';
import '../../widget/provider/provider_widget.dart';
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
  HomeVm? viewModel;
  Size? size;
  TabController? pages;
  int activeIndex = 1;

  @override
  void initState() {
    pages = TabController(vsync: this, length: 3, initialIndex: activeIndex)
      ..addListener(() {
        setState(() {
          activeIndex = pages!.index;
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    pages!.dispose();
    super.dispose();
  }

  void onItemTapped(int index) {
    switch (index) {
      case 0:
        return goToLikes();
      case 1:
        return goToHelpDesk();
      case 2:
        return goToSettings();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<HomeVm>(
      create: () => GetIt.I()..init(this),
      consumerWithThemeAndLocalization:
          (context, viewModel, child, theme, localization) {
        viewModel = viewModel;
        return Scaffold(
          body: mainWidget(),
          bottomNavigationBar: extraActions(),
        );
      },
    );
  }

  Widget mainWidget() {
    return Stack(
      children: [
        TabBarView(
          controller: pages,
          children: [
            ListedsTab(viewModel: viewModel!),
            SearchTab(viewModel: viewModel!),
            NotesTab(viewModel: viewModel!),
          ],
        ),
        TabsIndicator(controller: pages!),
        TabsIcons(controller: pages!),
      ],
    );
  }

  Widget extraActions() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.favorite,
            color: viewModel!.isBusy ? ThemeColors.primary : Colors.white,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.help,
            color: viewModel!.isBusy ? ThemeColors.primary : Colors.white,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.settings,
            color: viewModel!.isBusy ? ThemeColors.primary : Colors.white,
          ),
          label: '',
        ),
      ],
      currentIndex: 0,
      onTap: onItemTapped,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white,
      backgroundColor: ThemeColors.primary,
    );
  }

  @override
  void goToPresentor() => MainNavigatorWidget.of(context).goToPresentor();

  @override
  void goToEditor() => MainNavigatorWidget.of(context).goToEditor();

  @override
  void goToLikes() => MainNavigatorWidget.of(context).goToLikes();

  @override
  void goToListView() => MainNavigatorWidget.of(context).goToListView();

  @override
  void goToHistories() => MainNavigatorWidget.of(context).goToHistories();

  @override
  void goToHelpDesk() => MainNavigatorWidget.of(context).goToHelpDesk();

  @override
  void goToSettings() => MainNavigatorWidget.of(context).goToSettings();
}
