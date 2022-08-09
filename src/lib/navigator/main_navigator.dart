import 'package:drift/drift.dart';
import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:flutter/material.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

import '../screen/tours/active_tour_screen.dart';
import '../screen/careers/career_calendar_screen.dart';
import '../screen/careers/career_finish_screen.dart';
import '../screen/careers/career_overview_screen.dart';
import '../screen/careers/career_reset_screen.dart';
import '../screen/careers/career_select_riders_screen.dart';
import '../screen/careers/career_standings_screen.dart';
import '../screen/game/change_cyclist_names_screen.dart';
import '../screen/information/credits_screen.dart';
import '../screen/debug/debug_platform_selector_screen.dart';
import '../screen/debug/debug_screen.dart';
import '../screen/game/game_screen.dart';
import '../screen/information/information_screen.dart';
import '../screen/information/license_screen.dart';
import '../screen/menu/main_menu_screen.dart';
import '../screen/results_screen.dart';
import '../screen/selection_screen.dart';
import '../screen/settings/settings_screen.dart';
import '../screen/menu/single_race_menu_screen.dart';
import '../screen/splash_screen.dart';
import '../screen/settings/theme_mode_selector.dart';
import '../screen/tours/tour_in_progress_screen.dart';
import '../screen/tours/tour_select_screen.dart';
import '../util/env/flavor_config.dart';
import '../vm/results_vm.dart';
import '../widget/dialog/edit_name_dialog.dart';
import '../widget/general/text_scale_factor.dart';
import '../widget_game/data/play_settings.dart';
import '../widget_game/positions/sprint.dart';
import 'main_navigation.dart';

class MainNavigatorWidget extends StatefulWidget {
  final Widget? child;

  const MainNavigatorWidget({
    this.child,
    Key? key,
  }) : super(key: key);

  @override
  MainNavigatorWidgetState createState() => MainNavigatorWidgetState();

  static MainNavigationMixin of(BuildContext context,
      {bool rootNavigator = false}) {
    final navigator = rootNavigator
        ? context.findRootAncestorStateOfType<MainNavigationMixin>()
        : context.findAncestorStateOfType<MainNavigationMixin>();
    assert(() {
      if (navigator == null) {
        throw FlutterError(
            'MainNavigation operation requested with a context that does not include a MainNavigation.\n'
            'The context used to push or pop routes from the MainNavigation must be that of a '
            'widget that is a descendant of a MainNavigatorWidget widget.');
      }
      return true;
    }());
    return navigator!;
  }
}

class MainNavigatorWidgetState extends State<MainNavigatorWidget>
    with MainNavigationMixin {
  static final GlobalKey<NavigatorState> _navigationKey =
      GlobalKey<NavigatorState>();
  static final List<NavigatorObserver> _navigatorObservers = [];

  static String get initialRoute =>
      FlavorConfig.isInTest() ? 'test_route' : SplashScreen.routeName;

  static GlobalKey<NavigatorState> get navigationKey => _navigationKey;

  static List<NavigatorObserver> get navigatorObservers => _navigatorObservers;

  NavigatorState get _navigator => _navigationKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return TextScaleFactor(
      child: widget.child ?? const SizedBox.shrink(),
    );
  }

  static Route? onGenerateRoute(RouteSettings settings) {
    final strippedPath = settings.name?.replaceFirst('/', '');
    switch (strippedPath) {
      case '':
      case SplashScreen.routeName:
        return MaterialPageRoute<void>(
            builder: (context) => const SplashScreen(), settings: settings);
      case MainMenuScreen.routeName:
        return FadeInRoute<void>(
            child: const MainMenuScreen(), settings: settings);
      case DebugPlatformSelectorScreen.routeName:
        return MaterialPageRoute<void>(
            builder: (context) => const DebugPlatformSelectorScreen(),
            settings: settings);
      case ThemeModeSelectorScreen.routeName:
        return MaterialPageRoute<void>(
            builder: (context) => const ThemeModeSelectorScreen(),
            settings: settings);
      case DebugScreen.routeName:
        return MaterialPageRoute<void>(
            builder: (context) => const DebugScreen(), settings: settings);
      case LicenseScreen.routeName:
        return MaterialPageRoute<void>(
            builder: (context) => const LicenseScreen(), settings: settings);
      case 'test_route':
        if (!FlavorConfig.isInTest()) return null;
        return MaterialPageRoute<void>(
            builder: (context) => Container(color: Colors.grey),
            settings: settings);
      case SelectionScreen.routeName:
        return MaterialPageRoute<void>(
            builder: (context) => const SelectionScreen(), settings: settings);
      case InformationScreen.routeName:
        return FadeInRoute<void>(
            child: const InformationScreen(), settings: settings);
      case CareerFinishScreen.routeName:
        return FadeInRoute<void>(
            child: const CareerFinishScreen(), settings: settings);
      case CareerResetScreen.routeName:
        return FadeInRoute<void>(
            child: const CareerResetScreen(), settings: settings);
      case CareerSelectRidersScreen.routeName:
        return FadeInRoute<void>(
            child: const CareerSelectRidersScreen(), settings: settings);
      case CareerCalendarScreen.routeName:
        return FadeInRoute<void>(
            child: const CareerCalendarScreen(), settings: settings);
      case CareerStandingsScreen.routeName:
        return FadeInRoute<void>(
            child: const CareerStandingsScreen(), settings: settings);
      case CareerOverviewScreen.routeName:
        return FadeInRoute<void>(
            child: const CareerOverviewScreen(), settings: settings);
      case TourInProgressScreen.routeName:
        return FadeInRoute<void>(
            child: const TourInProgressScreen(), settings: settings);
      case ActiveTourScreen.routeName:
        return FadeInRoute<void>(
            child: const ActiveTourScreen(), settings: settings);
      case TourSelectScreen.routeName:
        return FadeInRoute<void>(
            child: const TourSelectScreen(), settings: settings);
      case ChangeCyclistNamesScreen.routeName:
        return FadeInRoute<void>(
            child: const ChangeCyclistNamesScreen(), settings: settings);
      case CreditsScreen.routeName:
        return FadeInRoute<void>(
            child: const CreditsScreen(), settings: settings);
      case SettingsScreen.routeName:
        return FadeInRoute<void>(
            child: const SettingsScreen(), settings: settings);
      case ResultsScreen.routeName:
        return FadeInRoute<void>(
            child: ResultsScreen(
                arguments: settings.arguments as ResultsArguments),
            settings: settings);
      case GameScreen.routeName:
        return MaterialPageRoute<void>(
            builder: (context) =>
                GameScreen(playSettings: settings.arguments as PlaySettings),
            settings: settings);
      case SingleRaceMenuScreen.routeName:
        return FadeInRoute<void>(
            child: const SingleRaceMenuScreen(), settings: settings);
      default:
        return null;
    }
  }

  @override
  void goToSplash() => _navigator.pushReplacementNamed(SplashScreen.routeName);

  @override
  void goToHome() => _navigator.pushNamedAndRemoveUntil(
      MainMenuScreen.routeName, (route) => false);

  @override
  void goToDebugPlatformSelector() =>
      _navigator.pushNamed(DebugPlatformSelectorScreen.routeName);

  @override
  void goToThemeModeSelector() =>
      _navigator.pushNamed(ThemeModeSelectorScreen.routeName);

  @override
  void goToDebug() => _navigator.pushNamed(DebugScreen.routeName);

  @override
  void goToLicense() => _navigator.pushNamed(LicenseScreen.routeName);

  @override
  void closeDialog() => _navigator.pop();

  @override
  void goToDatabase(GeneratedDatabase db) => _navigator.push<MaterialPageRoute>(
      MaterialPageRoute(builder: (context) => DriftDbViewer(db)));

  @override
  void goBack<T>({T? result}) => _navigator.pop(result);

  @override
  void goToSelection() => _navigator.pushNamed(SelectionScreen.routeName);

  @override
  void goToInformation() => _navigator.pushNamed(InformationScreen.routeName);

  @override
  void goToCareerFinish() => _navigator.pushNamed(CareerFinishScreen.routeName);

  @override
  void goToCareerReset() => _navigator.pushNamed(CareerResetScreen.routeName);

  @override
  void goToCareerSelectRiders() =>
      _navigator.pushNamed(CareerSelectRidersScreen.routeName);

  @override
  void goToCareerCalendar() =>
      _navigator.pushNamed(CareerCalendarScreen.routeName);

  @override
  void goToCareerStandings() =>
      _navigator.pushNamed(CareerStandingsScreen.routeName);

  @override
  Future<void> goToCareerOverview() =>
      _navigator.pushNamed(CareerOverviewScreen.routeName);

  @override
  Future<void> goToTourInProgress() =>
      _navigator.pushNamed(TourInProgressScreen.routeName);

  @override
  void goToActiveTour() => _navigator.pushNamed(ActiveTourScreen.routeName);

  @override
  Future<void> goToTourSelect() =>
      _navigator.pushNamed(TourSelectScreen.routeName);

  @override
  void goToChangeCyclistNames() =>
      _navigator.pushNamed(ChangeCyclistNamesScreen.routeName);

  @override
  void goToCredits() => _navigator.pushNamed(CreditsScreen.routeName);

  @override
  void goToSettings() => _navigator.pushNamed(SettingsScreen.routeName);

  @override
  void goToResults(List<Sprint> sprints, bool isTour, bool isCareer) =>
      _navigator.pushNamedAndRemoveUntil(
          ResultsScreen.routeName,
          arguments: ResultsArguments(sprints, isTour, isCareer),
          (route) => false);

  @override
  Future<void> goToGame(PlaySettings playSettings) =>
      _navigator.pushNamed(GameScreen.routeName, arguments: playSettings);

  @override
  Future<void> goToSingleRaceMenu() =>
      _navigator.pushNamed(SingleRaceMenuScreen.routeName);

  @override
  Future<String?> showEditNameDialog(String value) => showCustomDialog(
        builder: (context) => EditNameDialog(initialValue: value),
      );

  @override
  Future<T?> showCustomDialog<T>({required WidgetBuilder builder}) =>
      showDialog<T>(
        context: _navigationKey.currentContext!,
        builder: builder,
        useRootNavigator: true,
        barrierColor: Colors.black,
      );
}
