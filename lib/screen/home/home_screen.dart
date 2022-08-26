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
import 'searches/tab1_search.dart';
import 'searches/tab2_search.dart';
import 'searches/tab3_search.dart';

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
    pages = TabController(
      length: 3,
      vsync: this,
      initialIndex: activeIndex,
    );
  }

  @override
  void dispose() {
    super.dispose();
    pages!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    pages!.addListener(() {
      if (pages!.indexIsChanging) {
        setState(() {
          activeIndex = pages!.index;
          print("activeIndex is $activeIndex");
        });
      }
    });

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
            indicatorWidget(),
          ],
        ),
        bottomNavigationBar: extraActions(viewModel),
      ),
    );
  }

  Widget indicatorWidget() {
    final List<Widget> icons = [
      indicatorIcon('Lists', Icons.list_alt),
      indicatorIcon('Search', Icons.search),
      indicatorIcon('Notes', Icons.edit),
    ];
    return Container(
      margin: const EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          activeIndex == 0 ? Container() : icons[activeIndex - 1],
          activeIndex == (icons.length - 1)
              ? Container()
              : icons[activeIndex + 1],
        ],
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

  Widget indicatorIcon(String title, IconData iconData) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          Icon(
            iconData,
            color: ThemeColors.primary,
            size: 20,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: ThemeColors.primary,
            ),
          ),
        ],
      ),
    );
  }

  @override
  void goToLikes() => MainNavigatorWidget.of(context).goToLikes();

  @override
  void goToHistories() => MainNavigatorWidget.of(context).goToHistories();

  @override
  void goToSettings() => MainNavigatorWidget.of(context).goToSettings();
}
