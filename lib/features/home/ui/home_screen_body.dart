part of 'home_screen.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => HomeScreenBodyState();
}

class HomeScreenBodyState extends State<HomeScreenBody> {
  late HomeBloc bloc;
  late HomeScreenState parent;
  PageController pageController = PageController();
  int selectedPageIndex = 0;

  bool updateFound = false;
  bool isTabletOrIpad = false;
  List<Widget> homePages = <Widget>[];

  @override
  void initState() {
    super.initState();
    bloc = context.read<HomeBloc>();

    if (isMobile) {
      checkPermissions(context);
      if (FlavorConfig.isProd()) {
        //bloc.add(const HomeCheckVersion());
      }
    }
    bloc.add(const HomeFetchData());
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    isTabletOrIpad = size.shortestSide > 550;

    final List<PageItem> pages = [
      PageItem(
        title: 'Songs',
        icon: Icons.search,
        screen: SongsScreen(parent: this),
      ),
      /*PageItem(
        title: 'Lists',
        icon: Icons.list,
        screen: ListsScreen(parent: this),
      ),*/
      PageItem(
        title: 'Likes',
        icon: Icons.favorite,
        screen: LikesScreen(parent: this),
      ),
      /*PageItem(
        title: 'Drafts',
        icon: Icons.edit,
        screen: DraftsScreen(parent: this),
      ),*/
    ];


    return bloc.state.status == Status.inProgress
        ? const SkeletonLoading()
        : Scaffold(
            appBar: AppBar(
              title: Text(
                AppConstants.appTitle,
                style: TextStyles.pageTitle1,
              ),
              actions: <Widget>[
                InkWell(
                  onTap: () async {
                    await showSearch(
                      context: context,
                      delegate: SongsSearch(context, bloc, size.height),
                    );
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(Icons.search),
                  ),
                ),
                /*InkWell(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: Icon(Icons.help),
            ),
          ),*/
                InkWell(
                  onTap: () =>
                      Navigator.pushNamed(context, RouteNames.settings),
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(Icons.settings),
                  ),
                ),
              ],
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
              onPageChanged: (index) =>
                  setState(() => selectedPageIndex = index),
              physics: const NeverScrollableScrollPhysics(),
              children: pages.map<Widget>((item) => item.screen).toList(),
            ),
          );
  }
}
