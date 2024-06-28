part of 'home_screen.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => HomeScreenBodyState();
}

class HomeScreenBodyState extends State<HomeScreenBody> {
  late HomeBloc bloc;
  late HomeScreenState parent;
  int _currentPage = 0;

  bool updateFound = false;
  bool isTabletOrIpad = false;
  List<Widget> homePages = <Widget>[];

  List<PageType> pages = [
    PageType.search,
  ];
  PageType setPage = PageType.search;

  @override
  void initState() {
    super.initState();
    bloc = context.read<HomeBloc>();

    if (isMobile) {
      checkPermissions(context);
      if (FlavorConfig.isProd()) {
        bloc.add(const HomeCheckUpdates());
      }
    }
    bloc.add(const HomeFetchData());
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  Future<void> openSettingsWindow() async {
    final window = await DesktopMultiWindow.createWindow(jsonEncode({
      'args1': 'Sub window',
      'args2': 100,
      'args3': true,
      'business': 'business_test',
    }));
    window
      ..setFrame(const Offset(0, 0) & const Size(360, 720))
      ..center()
      ..setTitle('App Settings')
      ..show();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    isTabletOrIpad = size.shortestSide > 550;

    homePages = <Widget>[
      SearchScreen(parent: this),
    ];
    var mainContentBody = FadingIndexedStack(
            duration: AppDurations.slow,
            index: _currentPage,
            children: homePages)
        .positioned(left: 220, right: 0, bottom: 0, top: 0, animate: true)
        .animate(.35.seconds, Curves.bounceIn);

    var largeScreenBody = Stack(
      children: [
        mainContentBody,
        Sidebar(
          pageType: setPage,
          onPageSelect: (page) => setState(() => setPage = page),
          onSettingsSelect: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return Dialog(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Sizes.l),
                  ),
                  child: const SizedBox(
                    height: 350,
                    width: 500,
                    child: SettingsScreen(),
                  ),
                );
              },
            );
          },
        )
            .positioned(left: 0, top: 0, bottom: 0, width: 220, animate: true)
            .animate(.35.seconds, Curves.easeOut)
      ],
    );

    return bloc.state.status == Status.inProgress
        ? const SkeletonLoading()
        : Scaffold(
            appBar: isMobile
                ? AppBar(
                    title: Text(
                      AppConstants.appTitle,
                      style: TextStyles.pageTitle1,
                    ),
                    actions: <Widget>[
                      InkWell(
                        onTap: () async {
                          await showSearch(
                            context: context,
                            delegate: SearchSongs(context, bloc, size.height),
                          );
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(Icons.search),
                        ),
                      ),
                      InkWell(
                        onTap: () =>
                            Navigator.pushNamed(context, RouteNames.settings),
                        child: const Padding(
                          padding: EdgeInsets.all(10),
                          child: Icon(Icons.settings),
                        ),
                      ),
                    ],
                  )
                : null,
            body: isMobile ? mainContentBody : largeScreenBody,
            //bottomNavigationBar: HomeScreenBottomNavBar(parent: this),
          );
  }
}
