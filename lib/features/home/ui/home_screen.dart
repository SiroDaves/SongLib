import 'package:flutter/material.dart';

import '../../../common/widgets/app_bar/app_bar.dart';
import '../../../common/widgets/bottom_nav/bottom_nav_bar.dart';
import '../../../common/widgets/page_item.dart';
import '../../about/ui/about_screen.dart';
import '../../feed/ui/feed_screen.dart';
import '../../search/ui/search_screen.dart';
import '../../sessions/ui/sessions_screen.dart';

/// Default Screen to handle all the UIs after the Splash Screen
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController pageController = PageController();
  int selectedPageIndex = 0;

  final List<PageItem> pages = [
    const PageItem(title: 'Search', icon: 'search', screen: SearchScreen()),
    const PageItem(title: 'Feed', icon: 'bell', screen: FeedScreen()),
    const PageItem(title: 'Sessions', icon: 'time', screen: SessionsScreen()),
    const PageItem(title: 'About', icon: 'flower', screen: AboutScreen()),
  ];

  @override
  void initState() {
    super.initState();
    selectedPageIndex = pageController.initialPage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: CustomAppBar(selectedIndex: selectedPageIndex),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: selectedPageIndex,
        onPageChange: (int index) {
          setState(() {
            selectedPageIndex = index;
            pageController.jumpToPage(index);
          });
        },
        pages: pages,
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: (index) => setState(() => selectedPageIndex = index),
        physics: const NeverScrollableScrollPhysics(),
        children: pages.map<Widget>((item) => item.screen).toList(),
      ),
    );
  }
}
