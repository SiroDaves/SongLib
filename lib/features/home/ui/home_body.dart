part of 'home_screen.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => HomeBodyState();
}

class HomeBodyState extends State<HomeBody> {
  late final HomeBloc _bloc;

  PageController pageController = PageController();
  bool isTabletOrIpad = false;
  int selectedPageIndex = 0;

  List<PageItem> pages = [
    PageItem(title: 'Songs', icon: Icons.search, screen: SongsScreen()),
    PageItem(title: 'Likes', icon: Icons.favorite, screen: LikesScreen()),
    //PageItem(title: 'Lists', icon: Icons.list, screen: ListsScreen()),
    //PageItem(title: 'Drafts', icon: Icons.edit, screen: DraftsScreen()),
  ];

  @override
  void initState() {
    super.initState();
    _bloc = context.read<HomeBloc>();
    selectedPageIndex = pageController.initialPage;

    if (isMobile) {
      checkPermissions(context);
      if (FlavorConfig.isProd()) {
        PackageInfo packageInfo = PackageInfo(
          appName: '',
          packageName: '',
          version: '',
          buildNumber: '',
        );
        _bloc.add(HomeCheckVersion(packageInfo.version));
      }
    }
    _bloc.add(const HomeFetchData());
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    isTabletOrIpad = size.shortestSide > 550;

    return isTabletOrIpad ? HomePc(parent: this) : HomeMobile(parent: this);
  }

  void onPageChanged(int index) {
    setState(() {
      selectedPageIndex = index;
      if (!isTabletOrIpad) {
        pageController.jumpToPage(index);
      }
    });
  }
}
