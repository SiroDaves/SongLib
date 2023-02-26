import 'package:songlib/view/settings/settings_screen.dart';
import 'package:songlib/util/keys.dart';
import 'package:songlib/viewmodel/settings/settings_viewmodel.dart';
import 'package:songlib/viewmodel/global/global_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';

import '../../di/injectable_test.mocks.dart';
import '../../di/test_injectable.dart';
import '../../mocks/main_navigator/mock_main_navigator_widget.dart';
import '../../util/test_extensions.dart';
import '../../util/test_util.dart';
import '../seed.dart';

void main() {
  late SettingsViewModel settingsViewModel;
  late GlobalViewModel globalViewModel;

  setUp(() async {
    await initTestInjectable();
    settingsViewModel = GetIt.I();
    globalViewModel = GetIt.I();
  });

  testWidgets('Test settings screen initial state', (tester) async {
    seedSettingsViewModel();
    seedGlobalViewModel();

    final mockNavigation = MockMainNavigation();
    final sut = MockMainNavigator(
      mock: mockNavigation,
      child: const SettingsScreen(),
    );
    final testWidget = await TestUtil.loadScreen(tester, sut);

    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'settings_screen_inital_state');
    verifySettingsViewModel();
    verifyGlobalViewModelForSettingsScreen();
    verifyGlobalViewModel();
  });

  testWidgets('Test settings screen on select target clicked', (tester) async {
    seedSettingsViewModel();
    seedGlobalViewModel();

    const sut = SettingsScreen();
    await TestUtil.loadScreen(tester, sut);

    final target = find.byKey(Keys.settingsTargetPlatform);
    expect(target, findsOneWidget);
    await tester.tap(target);
    await tester.pumpAndSettle();

    verify(settingsViewModel.onTargetPlatformClicked()).calledOnce();
    verifySettingsViewModel();
    verifyGlobalViewModelForSettingsScreen();
    verifyGlobalViewModel();
  });

  testWidgets('Test settings screen on select theme mode clicked', (tester) async {
    seedSettingsViewModel();
    seedGlobalViewModel();

    const sut = SettingsScreen();
    await TestUtil.loadScreen(tester, sut);

    final target = find.byKey(Keys.settingsThemeMode);
    expect(target, findsOneWidget);
    await tester.tap(target);
    await tester.pumpAndSettle();

    verify(settingsViewModel.onThemeModeClicked()).calledOnce();
    verifySettingsViewModel();
    verifyGlobalViewModelForSettingsScreen();
    verifyGlobalViewModel();
  });

  testWidgets('Test settingsscreen on select language clicked', (tester) async {
    seedSettingsViewModel();
    seedGlobalViewModel();

    const sut = SettingsScreen();
    await TestUtil.loadScreen(tester, sut);

    final target = find.byKey(Keys.settingsSelectLanguage);
    expect(target, findsOneWidget);
    await tester.tap(target);
    await tester.pumpAndSettle();

    verify(settingsViewModel.onSelectLanguageClicked()).calledOnce();
    verifySettingsViewModel();
    verifyGlobalViewModelForSettingsScreen();
    verifyGlobalViewModel();
  });

  testWidgets('Test settingsscreen on license clicked', (tester) async {
    seedSettingsViewModel();
    seedGlobalViewModel();

    const sut = SettingsScreen();
    await TestUtil.loadScreen(tester, sut);

    final target = find.byKey(Keys.settingsLicense, skipOffstage: false);
    await tester.scrollUntilVisible(target, 200);
    expect(target, findsOneWidget);
    await tester.ensureVisible(target);
    await tester.pumpAndSettle();
    await tester.tap(target);
    await tester.pumpAndSettle();

    verify(settingsViewModel.onLicensesClicked()).calledOnce();
    verifySettingsViewModel();
    verifyGlobalViewModelForSettingsScreen();
    verifyGlobalViewModel();
  });

  group('Slow Animations', () {
    testWidgets('Test settings screen disable slow animations', (tester) async {
      seedSettingsViewModel();
      seedGlobalViewModel();
      when(settingsViewModel.slowAnimationsEnabled).thenReturn(true);

      const sut = SettingsScreen();
      final testWidget = await TestUtil.loadScreen(tester, sut);

      await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'settings_screen_slow_animations_enabled');

      final target = find.byKey(Keys.settingsSlowAnimations);
      expect(target, findsOneWidget);
      await tester.tap(target);
      await tester.pumpAndSettle();

      verify(settingsViewModel.onSlowAnimationsChanged(false)).calledOnce();
      verifySettingsViewModel();
      verifyGlobalViewModelForSettingsScreen();
      verifyGlobalViewModel();
    });

    testWidgets('Test settings screen enable slow animations', (tester) async {
      seedSettingsViewModel();
      seedGlobalViewModel();
      when(settingsViewModel.slowAnimationsEnabled).thenReturn(false);

      const sut = SettingsScreen();
      final testWidget = await TestUtil.loadScreen(tester, sut);

      await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'settings_screen_slow_animations_disabled');

      final target = find.byKey(Keys.settingsSlowAnimations);
      expect(target, findsOneWidget);
      await tester.tap(target);
      await tester.pumpAndSettle();

      verify(settingsViewModel.onSlowAnimationsChanged(true)).calledOnce();
      verifySettingsViewModel();
      verifyGlobalViewModelForSettingsScreen();
      verifyGlobalViewModel();
    });
  });

  group('Slow localizations', () {
    testWidgets('Test settings screen show localiation keys disable', (tester) async {
      seedSettingsViewModel();
      seedGlobalViewModel();
      when(globalViewModel.showsTranslationKeys).thenReturn(true);

      const sut = SettingsScreen();
      final testWidget = await TestUtil.loadScreen(tester, sut);

      await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'settings_screen_show_locale_key_enabled');

      final target = find.byKey(Keys.settingsShowTranslations);
      expect(target, findsOneWidget);
      await tester.tap(target);
      await tester.pumpAndSettle();

      verify(globalViewModel.toggleTranslationKeys()).calledOnce();
      verifySettingsViewModel();
      verifyGlobalViewModelForSettingsScreen();
      verifyGlobalViewModel();
    });

    testWidgets('Test settingsscreen disable showlocalization keyss', (tester) async {
      seedSettingsViewModel();
      seedGlobalViewModel();
      when(globalViewModel.showsTranslationKeys).thenReturn(false);

      const sut = SettingsScreen();
      final testWidget = await TestUtil.loadScreen(tester, sut);

      await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'settings_screen_show_locale_key_disabled');

      final target = find.byKey(Keys.settingsShowTranslations);
      expect(target, findsOneWidget);
      await tester.tap(target);
      await tester.pumpAndSettle();

      verify(globalViewModel.toggleTranslationKeys()).calledOnce();
      verifySettingsViewModel();
      verifyGlobalViewModelForSettingsScreen();
      verifyGlobalViewModel();
    });
  });
}

void verifySettingsViewModel() {
  final settingsViewModel = GetIt.I.resolveAs<SettingsViewModel, MockSettingsViewModel>();
  verify(settingsViewModel.init(any)).calledOnce();
  verify(settingsViewModel.slowAnimationsEnabled);
}

void verifyGlobalViewModelForSettingsScreen() {
  final globalViewModel = GetIt.I<GlobalViewModel>();
  verify(globalViewModel.showsTranslationKeys);
  verify(globalViewModel.getCurrentLanguage());
  verify(globalViewModel.getCurrentPlatform());
}
