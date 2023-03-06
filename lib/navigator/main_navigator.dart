import 'package:flutter/material.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

import '../view/drafts/mobile/edit_draft.dart';
import '../view/drafts/mobile/present_draft.dart';
import '../view/drafts/pc/edit_draft_pc.dart';
import '../view/drafts/pc/present_draft_pc.dart';
import '../view/home/home_screen.dart';
import '../view/info/donation_screen.dart';
import '../view/info/helpdesk_screen.dart';
import '../view/lists/list_view_screen.dart';
import '../view/manage/settings_screen.dart';
import '../view/info/onboarding_screen.dart';
import '../view/selection/progress_screen.dart';
import '../view/selection/selection_screen.dart';
import '../view/songs/mobile/edit_song.dart';
import '../view/songs/pc/edit_song_pc.dart';
import '../view/songs/pc/present_song_pc.dart';
import '../view/songs/mobile/present_song.dart';
import '../view/splash_screen.dart';
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
      case SelectionScreen.routeName:
        return MaterialPageRoute<void>(
          builder: (context) => const SelectionScreen(),
          settings: settings,
        );
      case OnboardingScreen.routeName:
        return MaterialPageRoute<void>(
          builder: (context) => const OnboardingScreen(),
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

      case PresentSong.routeName:
        return FadeInRoute<void>(
          child: const PresentSong(),
          settings: settings,
        );
      case PresentSongPc.routeName:
        return FadeInRoute<void>(
          child: const PresentSongPc(),
          settings: settings,
        );

      case PresentDraft.routeName:
        return FadeInRoute<void>(
          child: const PresentDraft(),
          settings: settings,
        );
      case PresentDraftPc.routeName:
        return FadeInRoute<void>(
          child: const PresentDraftPc(),
          settings: settings,
        );

      case EditSong.routeName:
        return FadeInRoute<void>(
          child: const EditSong(),
          settings: settings,
        );
      case EditSongPc.routeName:
        return FadeInRoute<void>(
          child: const EditSongPc(),
          settings: settings,
        );

      case EditDraft.routeName:
        return FadeInRoute<void>(
          child: const EditDraft(),
          settings: settings,
        );
      case EditDraftPc.routeName:
        return FadeInRoute<void>(
          child: const EditDraftPc(),
          settings: settings,
        );

      case ListViewScreen.routeName:
        return FadeInRoute<void>(
          child: const ListViewScreen(),
          settings: settings,
        );
      case SettingsScreen.routeName:
        return FadeInRoute<void>(
          child: const SettingsScreen(),
          settings: settings,
        );
      case HelpDeskScreen.routeName:
        return FadeInRoute<void>(
          child: const HelpDeskScreen(),
          settings: settings,
        );
      case DonationScreen.routeName:
        return FadeInRoute<void>(
          child: const DonationScreen(),
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
  void goToOnboarding() =>
      navigator.pushReplacementNamed(OnboardingScreen.routeName);

  @override
  void goToHome() =>
      navigator.pushNamedAndRemoveUntil(HomeScreen.routeName, (route) => false);

  @override
  void goToPresentSong() => navigator.pushNamed(PresentSong.routeName);

  @override
  void goToPresentSongPc() => navigator.pushNamed(PresentSongPc.routeName);

  @override
  void goToPresentDraft() => navigator.pushNamed(PresentDraft.routeName);

  @override
  void goToPresentDraftPc() => navigator.pushNamed(PresentDraftPc.routeName);

  @override
  void goToEditSong() => navigator.pushNamed(EditSong.routeName);

  @override
  void goToEditSongPc() => navigator.pushNamed(EditSongPc.routeName);

  @override
  void goToEditDraft(bool emptyDraft) => navigator.pushNamed(
        EditDraft.routeName,
        arguments: emptyDraft,
      );

  @override
  void goToEditDraftPc(bool emptyDraft) => navigator.pushNamed(
        EditDraftPc.routeName,
        arguments: emptyDraft,
      );

  @override
  void goToListView() => navigator.pushNamed(ListViewScreen.routeName);

  @override
  void goToSettings() => navigator.pushNamed(SettingsScreen.routeName);

  @override
  void goToHelpDesk() => navigator.pushNamed(HelpDeskScreen.routeName);

  @override
  void goToDonation() => navigator.pushNamed(DonationScreen.routeName);

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
