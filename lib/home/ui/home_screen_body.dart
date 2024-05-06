part of 'home_screen.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => HomeScreenBodyState();
}

class HomeScreenBodyState extends State<HomeScreenBody> {
  late HomeBloc _bloc;
  bool updateFound = false;
  int currentPage = 0;
  late AppLocalizations tr;

  @override
  void initState() {
    _bloc = context.read<HomeBloc>();

    /*if (isMobile) {
      checkPermissions();
      if (FlavorConfig.isProd()) {
        _bloc.add(const HomeCheckUpdates());
      }
    }*/
    _bloc.add(const HomeFetchData());
    super.initState();
  }

  Future<void> checkPermissions() async {
    final PermissionStatus permission = await Permission.storage.status;
    if (permission != PermissionStatus.granted) {
      await Permission.storage.request();
      // access media location needed for android 10/Q
      await Permission.accessMediaLocation.request();
      // manage external storage needed for android 11/R
      await Permission.manageExternalStorage.request();
      //showToast(text: 'Permission granted', state: ToastStates.success);
    } else if (permission != PermissionStatus.denied) {
      //showToast(text: 'Permission denied', state: ToastStates.error);
    } else if (permission != PermissionStatus.permanentlyDenied) {
      showPermanentlyDeniedDialog();
    }
  }

  Future<void> showPermanentlyDeniedDialog() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(tr.labelPermissionTitle),
          content: Text(tr.labelPermissionText),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(tr.cancel),
            ),
            TextButton(
              onPressed: () => openAppSettings(),
              child: Text(tr.openSettings),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    tr = AppLocalizations.of(context)!;
    Size size = MediaQuery.of(context).size;
    bool isTabletOrIpad = size.shortestSide > 550;

    var homeBody = BlocConsumer<HomeBloc, HomeState>(
      bloc: _bloc,
      listener: (context, state) {
        if (state.status == Status.updateFound) {
          setState(() => updateFound = true);
          CustomSnackbar.show(context, feedbackMessage(state.feedback, tr),
              isSuccess: true);
        }
        if (state.status == Status.success) {
          setState(() => updateFound = false);
        }
      },
      builder: (context, state) {
        if (state.status == Status.inProgress) {
          return const CircularProgress();
        } else if (state.status == Status.updateFound) {
          return UpdateWidget(
            size: size.width / 3,
            onPressed: () => _bloc.add(const HomeUpdateApp()),
          );
        } else {
          return <Widget>[
            MobileSearchTab(),
            const SizedBox.expand(child: Center(child: Text('Page 2'))),
            const SizedBox.expand(child: Center(child: Text('Page 3'))),
            const SizedBox.expand(child: Center(child: Text('Page 4'))),
          ][currentPage];
        }
      },
    );

    var bottomNavigation = NavigationBar(
      onDestinationSelected: (int index) {
        setState(() => currentPage = index);
      },
      height: 50,
      indicatorColor: ThemeColors.primaryDark,
      backgroundColor: Colors.white,
      selectedIndex: currentPage,
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

    return Scaffold(
      backgroundColor: ThemeColors.gray,
      appBar: AppBar(
        title: Text(tr.appName),
        actions: [
          InkWell(
            onTap: () {
              if (updateFound) {
                _bloc.add(const HomeUpdateApp());
              } else {
                Navigator.pushNamed(context, RouteNames.account);
              }
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Icon(
                updateFound ? Icons.system_update : Iconsax.profile_circle,
              ),
            ),
          ),
        ],
      ),
      body: homeBody,
      bottomNavigationBar:
          isDesktop || isMobile && isTabletOrIpad ? null : bottomNavigation,
    );
  }
}
