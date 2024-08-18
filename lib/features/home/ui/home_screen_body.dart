part of 'home_screen.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => HomeScreenBodyState();
}

class HomeScreenBodyState extends State<HomeScreenBody> {
  late final HomeBloc bloc;
  late final PageController pageController;
  late final List<PageItem> pages;

  int selectedPageIndex = 0;
  bool isTabletOrIpad = false;

  @override
  void initState() {
    super.initState();
    bloc = context.read<HomeBloc>();
    pageController = PageController();

    if (isMobile) {
      checkPermissions(context);
      if (FlavorConfig.isProd()) {
        // bloc.add(const HomeCheckVersion());
      }
    }
    bloc.add(const HomeFetchData());

    pages = _buildPages();
  }

  List<PageItem> _buildPages() {
    return [
      PageItem(
        title: 'Songs',
        icon: Icons.search,
        screen: SongsScreen(parent: this),
      ),
      PageItem(
        title: 'Likes',
        icon: Icons.favorite,
        screen: LikesScreen(parent: this),
      ),
      // Uncomment the following lines if needed in the future
      // PageItem(
      //   title: 'Lists',
      //   icon: Icons.list,
      //   screen: ListsScreen(parent: this),
      // ),
      // PageItem(
      //   title: 'Drafts',
      //   icon: Icons.edit,
      //   screen: DraftsScreen(parent: this),
      // ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    isTabletOrIpad = size.shortestSide > 550;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppConstants.appTitle,
          style: TextStyles.pageTitle1,
        ),
        actions: _buildAppBarActions(size.height),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: selectedPageIndex,
        onPageChange: _onPageChanged,
        pages: pages,
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: _onPageChanged,
        physics: const NeverScrollableScrollPhysics(),
        children: pages.map((item) => item.screen).toList(),
      ),
    );
  }

  List<Widget> _buildAppBarActions(double height) {
    return [
      InkWell(
        onTap: () async {
          await showSearch(
            context: context,
            delegate: SongsSearch(context, bloc, height),
          );
        },
        child: const Padding(
          padding: EdgeInsets.all(10),
          child: Icon(Icons.search),
        ),
      ),
      // Uncomment the following lines if needed in the future
      // InkWell(
      //   onTap: () {},
      //   child: const Padding(
      //     padding: EdgeInsets.all(10),
      //     child: Icon(Icons.help),
      //   ),
      // ),
      InkWell(
        onTap: () => Navigator.pushNamed(context, RouteNames.settings),
        child: const Padding(
          padding: EdgeInsets.all(10),
          child: Icon(Icons.settings),
        ),
      ),
    ];
  }

  void _onPageChanged(int index) {
    setState(() {
      selectedPageIndex = index;
      pageController.jumpToPage(index);
    });
  }
}
