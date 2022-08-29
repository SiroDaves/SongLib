import 'package:flutter/material.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

import '../screen/home/home_screen.dart';
import '../screen/home/search_screen.dart';
import '../screen/home/histories_screen.dart';
import '../screen/home/likes_screen.dart';
import '../screen/manage/settings_screen.dart';
import '../screen/selection/progress_screen.dart';
import '../screen/selection/selection_screen.dart';
import '../screen/splash_screen.dart';
import '../screen/uitest_screen.dart';
import '../util/env/flavor_config.dart';
import '../widget/general/text_scale_factor.dart';
import 'main_navigation.dart';

class MainNavigatorWidget extends StatefulWidget {
  final Widget? child;

  const MainNavigatorWidget({this.child, Key? key}) : super(key: key);

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

  NavigatorState get navigator => _navigationKey.currentState!;

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
          builder: (context) => const SplashScreen(),
          settings: settings,
        );
      case UiTestScreen.routeName:
        return MaterialPageRoute<void>(
          builder: (context) => const UiTestScreen(),
          settings: settings,
        );
      case SelectionScreen.routeName:
        return MaterialPageRoute<void>(
          builder: (context) => const SelectionScreen(),
          settings: settings,
        );
      case ProgressScreen.routeName:
        return MaterialPageRoute<void>(
          builder: (context) => const ProgressScreen(),
          settings: settings,
        );
      case HomeScreen.routeName:
        return FadeInRoute<void>(
          child: const HomeScreen(),
          settings: settings,
        );
      case SearchScreen.routeName:
        return FadeInRoute<void>(
          child: const SearchScreen(),
          settings: settings,
        );
      case LikesScreen.routeName:
        return FadeInRoute<void>(
          child: const LikesScreen(),
          settings: settings,
        );
      case HistoriesScreen.routeName:
        return FadeInRoute<void>(
          child: const HistoriesScreen(),
          settings: settings,
        );
      case SettingsScreen.routeName:
        return FadeInRoute<void>(
          child: const SettingsScreen(),
          settings: settings,
        );
      case 'test_route':
        if (!FlavorConfig.isInTest()) return null;
        return MaterialPageRoute<void>(
          builder: (context) => Container(color: Colors.grey),
          settings: settings,
        );
      default:
        return null;
    }
  }

  @override
  void goToSplash() => navigator.pushReplacementNamed(SplashScreen.routeName);

  @override
  void goToSelection() =>
      navigator.pushReplacementNamed(SelectionScreen.routeName);

  @override
  void goToProgress() =>
      navigator.pushReplacementNamed(ProgressScreen.routeName);

  @override
  void goToUiTest() => navigator.pushNamedAndRemoveUntil(
      UiTestScreen.routeName, (route) => false);

  @override
  void goToHome() =>
      navigator.pushNamedAndRemoveUntil(HomeScreen.routeName, (route) => false);

  @override
  void goToSearch() => navigator.pushNamedAndRemoveUntil(
      SearchScreen.routeName, (route) => false);

  @override
  void goToLikes() => navigator.pushNamed(LikesScreen.routeName);

  @override
  void goToHistories() => navigator.pushNamed(HistoriesScreen.routeName);

  @override
  void goToSettings() => navigator.pushNamed(SettingsScreen.routeName);

  @override
  void closeDialog() => navigator.pop();

  @override
  void goBack<T>({T? result}) => navigator.pop(result);

  @override
  Future<T?> showCustomDialog<T>({required WidgetBuilder builder}) =>
      showDialog<T>(
        context: _navigationKey.currentContext!,
        builder: builder,
        useRootNavigator: true,
        barrierColor: Colors.black,
      );
}
