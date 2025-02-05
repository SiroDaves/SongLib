part of '../home_screen.dart';

class BigScreen extends StatefulWidget {
  final HomeScreenState parent;
  const BigScreen({super.key, required this.parent});

  @override
  State<BigScreen> createState() => BigScreenState();
}

class BigScreenState extends State<BigScreen> {
  late HomeScreenState parent;
  late AppLocalizations l10n;

  void setCurrentPage(PageType page) {
    setState(() => parent.setPage = page);
  }

  @override
  Widget build(BuildContext context) {
    parent = widget.parent;
    l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const SizedBox(width: 10),
            Image.asset(AppAssets.iconApp, height: 35, width: 35),
            const SizedBox(width: 10),
            Text(
              l10n.appName,
              style: TextStyle(fontSize: 25),
            ),
            const SizedBox(width: 60),
            parent.setPage == PageType.helpdesk ||
                    parent.setPage == PageType.settings
                ? const SizedBox.shrink()
                : SearchWidget(
                    onSearch: (query) {}, //=> vm.onSearch(query),
                    searchController: parent.searchController,
                  ),
            const SizedBox(width: 10),
          ],
        ),
        actions: [],
      ),
      /*body: PageView(
        controller: parent.pageController,
        onPageChanged: onPageChanged,
        physics: const NeverScrollableScrollPhysics(),
        children: homeScreens.map((item) => item.screen).toList(),
      ),*/
      body: Stack(
        children: [
          FadingIndexedStack(
            duration: AppDurations.slow,
            index: pages.indexOf(parent.setPage),
            children: <Widget>[
              //ListTabPc(vm),
              SongsScreen(books: parent.books, isBigScreen: true),
              LikesScreen(books: parent.books),
              //DraftsTabPc(vm),
              //const HelpDeskScreen(),
              const SettingsScreen(),
            ],
          )
              .positioned(left: 300, right: 0, bottom: 0, top: 0, animate: true)
              .animate(.35.seconds, Curves.bounceIn),
          Sidebar(
            pageType: parent.setPage,
            onSelect: (page) => setCurrentPage(page),
          )
              .positioned(left: 0, top: 0, bottom: 0, width: 300, animate: true)
              .animate(.35.seconds, Curves.easeOut),
        ],
      ),
    );
  }
}
