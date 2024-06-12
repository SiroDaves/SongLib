part of 'home_screen.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => HomeScreenBodyState();
}

class HomeScreenBodyState extends State<HomeScreenBody> {
  late HomeBloc bloc;
  late LocalStorage _localStorage;
  late HomeScreenState parent;
  int _currentPage = 0;

  bool updateFound = false;
  bool isTabletOrIpad = false;
  late AppLocalizations l10n;
  List<Widget> homePages = <Widget>[];

  @override
  void initState() {
    super.initState();
    _localStorage = getIt<LocalStorage>();
    bloc = context.read<HomeBloc>();
    bloc.add(const HomeFetchData());
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void onThemeChanged(ThemeMode themeMode) {
    setState(() {
      _localStorage.updateThemeMode(themeMode);
    });
  }

  @override
  Widget build(BuildContext context) {
    l10n = AppLocalizations.of(context)!;
    Size size = MediaQuery.of(context).size;
    isTabletOrIpad = size.shortestSide > 550;

    homePages = <Widget>[
      SearchScreen(parent: this),
      const Center(child: Text('Index 1: Business')),
      const Center(child: Text('Index 2: School')),
      const Center(child: Text('Index 3: Settings')),
    ];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.brightness_6),
          onPressed: () {
            selectThemeDialog(context);
          },
        ),
        title: const Text(AppConstants.appTitle),
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
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: Icon(Icons.help),
            ),
          ),
          InkWell(
            onTap: () {},
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: Icon(Icons.settings),
            ),
          ),
        ],
      ),
      body: const SizedBox(),//homePages.elementAt(_currentPage),
      bottomNavigationBar: HomeScreenBottomNavBar(parent: this),
    );
  }

  Future<void> selectThemeDialog(BuildContext context) async {
    String appTheme = getThemeModeString(_localStorage.getThemeMode());
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Choose Theme'),
          content: SizedBox(
            height: 135,
            child: RadioInput(
              initValue: appTheme,
              options: const ['System Theme', 'Light', 'Dark'],
              vertical: true,
              onChanged: (String? newValue) {
                setState(() {
                  switch (newValue) {
                    case 'Light':
                      onThemeChanged(ThemeMode.light);
                      break;
                    case 'Dark':
                      onThemeChanged(ThemeMode.dark);
                      break;
                    default:
                      onThemeChanged(ThemeMode.system);
                      break;
                  }
                  Navigator.of(context).pop();
                });
              },
            ),
          ),
        );
      },
    );
  }
}
