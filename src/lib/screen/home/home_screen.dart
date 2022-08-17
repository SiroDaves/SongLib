import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../navigator/route_names.dart';
import '../../theme/theme_colors.dart';
import '../../util/constants/app_constants.dart';
import '../../vm/home/home_vm.dart';
import '../../widget/general/labels.dart';
import '../../widget/general/list_items.dart';
import '../../widget/general/swiper_widgets.dart';
import '../../widget/progress/line_progress.dart';
import '../../widget/provider/provider_widget.dart';
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
class HomeScreenState extends State<HomeScreen>implements HomeNavigator {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<HomeVm>(
      create: () => GetIt.I()..init(this),
      consumerWithThemeAndLocalization:
          (context, viewModel, child, theme, localization) => Scaffold(
        body: Swiper(
          index: 1,
          itemBuilder: (context, index) {
            final appPages = <Widget>[
              ListedsTab(viewModel: viewModel),
              SearchTab(viewModel: viewModel),
              NotesTab(viewModel: viewModel),
            ];
            return appPages[index];
          },
          indicatorLayout: PageIndicatorLayout.COLOR,
          autoplay: false,
          itemCount: 3,
          pagination: const PageSwiper(
            margin: EdgeInsets.only(top: 35),
          ),
          control: PageSwiperControl(
            icons: [
              indicatorIcon1(),
              indicatorIcon2(),
              indicatorIcon3(),
            ],
          ),
        ),
      ),
    );
  }

  Widget indicatorIcon1() {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: const [
          Icon(
            Icons.list_alt,
            color: ThemeColors.primary,
            size: 20,
          ),
          Text(
            'Lists',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: ThemeColors.primary,
            ),
          ),
        ],
      ),
    );
  }

  Widget indicatorIcon2() {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: const [
          Icon(
            Icons.search,
            color: ThemeColors.primary,
            size: 20,
          ),
          Text(
            'Search',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: ThemeColors.primary,
            ),
          ),
        ],
      ),
    );
  }

  Widget indicatorIcon3() {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: const [
          Icon(
            Icons.edit,
            color: ThemeColors.primary,
            size: 20,
          ),
          Text(
            'Notes',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: ThemeColors.primary,
            ),
          ),
        ],
      ),
    );
  }

}
