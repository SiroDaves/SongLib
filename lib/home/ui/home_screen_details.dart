part of 'home_screen.dart';

class HomeScreenBottomNavigation extends StatefulWidget {
  final HomeScreenBodyState parent;
  const HomeScreenBottomNavigation({super.key, required this.parent});

  @override
  State<HomeScreenBottomNavigation> createState() =>
      HomeScreenBottomNavigationState();
}

class HomeScreenBottomNavigationState
    extends State<HomeScreenBottomNavigation> {
  late HomeBloc _bloc;
  late AppLocalizations tr;

  @override
  void initState() {
    _bloc = context.read<HomeBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    tr = AppLocalizations.of(context)!;
    
    var bottomNavigation = BlocBuilder<HomeBloc, HomeState>(
      bloc: _bloc,
      builder: (context, state) {
        if (state.status == Status.dataFetched && state.songs.isNotEmpty) {
          return NavigationBar(
            onDestinationSelected: (int index) {
              setState(() => widget.parent.currentPage = index);
            },
            height: 50,
            indicatorColor: ThemeColors.primaryDark,
            backgroundColor: Colors.white,
            selectedIndex: widget.parent.currentPage,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            destinations: const <Widget>[
              NavigationDestination(
                selectedIcon: Icon(Icons.home),
                icon: Icon(Icons.home_outlined),
                label: 'HOME',
              ),
              NavigationDestination(
                icon: Badge(child: Icon(Icons.list)),
                label: 'LIST',
              ),
              NavigationDestination(
                icon: Badge(child: Icon(Icons.favorite)),
                label: 'LIKES',
              ),
              NavigationDestination(
                icon: Badge(child: Icon(Icons.edit)),
                label: 'DRAFTS',
              ),
            ],
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );

    if (isDesktop || isMobile && widget.parent.isTabletOrIpad) {
      return const SizedBox.shrink();
    } else {
      return bottomNavigation;
    }
  }
}
