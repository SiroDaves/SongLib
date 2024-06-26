part of '../home_screen.dart';

class HomeScreenBottomNavBar extends StatefulWidget {
  final HomeScreenBodyState parent;
  const HomeScreenBottomNavBar({super.key, required this.parent});

  @override
  State<HomeScreenBottomNavBar> createState() => HomeScreenBottomNavBarState();
}

class HomeScreenBottomNavBarState extends State<HomeScreenBottomNavBar> {
  late HomeScreenBodyState parent;

  @override
  Widget build(BuildContext context) {
    parent = widget.parent;

    return NavigationBar(
      selectedIndex: parent._currentPage,
      onDestinationSelected: parent._onItemTapped,
      height: 50,
      elevation: 3,
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          label: 'HOME',
        ),
        NavigationDestination(
          icon: Icon(Icons.list),
          label: 'LIST',
        ),
        NavigationDestination(
          icon: Icon(Icons.favorite),
          label: 'LIKES',
        ),
        NavigationDestination(
          icon: Icon(Icons.edit),
          label: 'DRAFTS',
        ),
      ],
    );
  }
}
