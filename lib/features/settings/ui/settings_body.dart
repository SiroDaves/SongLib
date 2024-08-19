part of 'settings_screen.dart';

class SettingsScreenBody extends StatefulWidget {
  final SettingsScreenState parent;
  const SettingsScreenBody({super.key, required this.parent});

  @override
  State<SettingsScreenBody> createState() => _SettingsScreenBodyState();
}

class _SettingsScreenBodyState extends State<SettingsScreenBody> {
  late SettingsBloc _bloc;
  late SettingsScreenState parent;
  late LocalStorage _localStorage;

  bool updateFound = false;
  bool isTabletOrIpad = false;
  late AppLocalizations tr;

  String appTheme = '';

  @override
  void initState() {
    super.initState();
    _localStorage = getIt<LocalStorage>();
    _bloc = context.read<SettingsBloc>();
    _bloc.add(const SettingsInit());
    appTheme = getThemeModeString(_localStorage.getThemeMode());
  }

  void onThemeChanged(ThemeMode themeMode) {
    _localStorage.updateThemeMode(themeMode);
    context.read<ThemeBloc>().add(ThemeModeChanged(themeMode));
  }

  @override
  Widget build(BuildContext context) {
    parent = widget.parent;
    tr = AppLocalizations.of(context)!;
    Size size = MediaQuery.of(context).size;
    isTabletOrIpad = size.shortestSide > 550;

    return BlocConsumer<SettingsBloc, SettingsState>(
      bloc: _bloc,
      listener: (context, state) {},
      builder: (context, state) {
        return ListView(
          children: [
            Card(
              margin: EdgeInsets.all(Sizes.xs),
              color: ThemeColors.bgColorBW(context),
              child: ListTile(
                leading: Icon(Icons.color_lens),
                title: const Text('App Theme'),
                subtitle: Text(appTheme),
                onTap: () => selectThemeDialog(context),
              ),
            ),
          ],
        );
      },
    );
  }

  Future<void> selectThemeDialog(BuildContext context) async {
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
