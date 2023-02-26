import 'dart:ui';

import 'package:songlib/l10n/localizations_en.dart';
import 'package:songlib/view/settings/dialogs/select_language_dialog.dart';
import 'package:songlib/viewmodel/global/global_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';

import '../../di/test_injectable.dart';
import '../seed.dart';
import '../../util/test_extensions.dart';
import '../../util/test_util.dart';

void main() {
  late GlobalViewModel globalVm;

  setUp(() async {
    await initTestInjectable();
    globalVm = GetIt.I();
    seedGlobalViewModel();
  });

  testWidgets('SelectLanguageDialog initial state', (tester) async {
    when(globalVm.isLanguageSelected('en')).thenAnswer((_) => true);
    when(globalVm.isLanguageSelected('nl')).thenAnswer((_) => false);
    when(globalVm.isLanguageSelected(null)).thenAnswer((_) => false);
    final widget = SelectLanguageDialog(goBack: () {});

    await TestUtil.loadScreen(tester, widget);
    await TestUtil.takeScreenshot(tester, 'select_language_dialog_initial_state');

    verify(globalVm.isLanguageSelected(any));
    verifyGlobalViewModel();
  });

  group('Selected language', () {
    testWidgets('SelectLanguageDialog system default selected', (tester) async {
      when(globalVm.isLanguageSelected('en')).thenAnswer((_) => false);
      when(globalVm.isLanguageSelected('nl')).thenAnswer((_) => false);
      when(globalVm.isLanguageSelected(null)).thenAnswer((_) => true);
      final widget = SelectLanguageDialog(goBack: () {});

      await TestUtil.loadScreen(tester, widget);
      await TestUtil.takeScreenshot(tester, 'select_language_dialog_system_defaults_selected');

      verify(globalVm.isLanguageSelected(any));
      verifyGlobalViewModel();
    });

    testWidgets('SelectLanguageDialog english selected', (tester) async {
      when(globalVm.isLanguageSelected('en')).thenAnswer((_) => true);
      when(globalVm.isLanguageSelected('nl')).thenAnswer((_) => false);
      when(globalVm.isLanguageSelected(null)).thenAnswer((_) => false);
      final widget = SelectLanguageDialog(goBack: () {});

      await TestUtil.loadScreen(tester, widget);
      await TestUtil.takeScreenshot(tester, 'select_language_dialog_en_selected');

      verify(globalVm.isLanguageSelected(any));
      verifyGlobalViewModel();
    });

    testWidgets('SelectLanguageDialog nederlands selected', (tester) async {
      when(globalVm.isLanguageSelected('en')).thenAnswer((_) => false);
      when(globalVm.isLanguageSelected('nl')).thenAnswer((_) => true);
      when(globalVm.isLanguageSelected(null)).thenAnswer((_) => false);
      final widget = SelectLanguageDialog(goBack: () {});

      await TestUtil.loadScreen(tester, widget);
      await TestUtil.takeScreenshot(tester, 'select_language_dialog_nl_selected');

      verify(globalVm.isLanguageSelected(any));
      verifyGlobalViewModel();
    });
  });

  group('Click language select', () {
    testWidgets('SelectLanguageDialog on click english', (tester) async {
      when(globalVm.isLanguageSelected('en')).thenAnswer((_) => true);
      when(globalVm.isLanguageSelected('nl')).thenAnswer((_) => false);
      when(globalVm.isLanguageSelected(null)).thenAnswer((_) => false);
      bool? clicked;
      final widget = SelectLanguageDialog(goBack: () {
        clicked = true;
      });

      await TestUtil.loadScreen(tester, widget);
      final finder = find.text('English');
      expect(finder, findsOneWidget);
      await tester.tap(finder);
      await tester.pumpAndSettle();

      verify(globalVm.isLanguageSelected(any));
      verify(globalVm.updateLocale(const Locale('en'))).calledOnce();
      expect(clicked, true);
      verifyGlobalViewModel();
    });
    testWidgets('SelectLanguageDialog on click nederlands', (tester) async {
      when(globalVm.isLanguageSelected('en')).thenAnswer((_) => false);
      when(globalVm.isLanguageSelected('nl')).thenAnswer((_) => true);
      when(globalVm.isLanguageSelected(null)).thenAnswer((_) => false);
      bool? clicked;
      final widget = SelectLanguageDialog(goBack: () {
        clicked = true;
      });

      await TestUtil.loadScreen(tester, widget);
      final finder = find.text('Nederlands');
      expect(finder, findsOneWidget);
      await tester.tap(finder);
      await tester.pumpAndSettle();

      verify(globalVm.isLanguageSelected(any));
      verify(globalVm.updateLocale(const Locale('nl'))).calledOnce();
      expect(clicked, true);
      verifyGlobalViewModel();
    });
    testWidgets('SelectLanguageDialog on click system defaults', (tester) async {
      when(globalVm.isLanguageSelected('en')).thenAnswer((_) => false);
      when(globalVm.isLanguageSelected('nl')).thenAnswer((_) => false);
      when(globalVm.isLanguageSelected(null)).thenAnswer((_) => true);
      bool? clicked;
      final widget = SelectLanguageDialog(goBack: () {
        clicked = true;
      });

      await TestUtil.loadScreen(tester, widget);
      final finder = TextFinder(LocalizationsEn.systemDefault, substring: true);
      expect(finder, findsOneWidget);
      await tester.tap(finder);
      await tester.pumpAndSettle();

      verify(globalVm.isLanguageSelected(any));
      verify(globalVm.updateLocale(null)).calledOnce();
      expect(clicked, true);
      verifyGlobalViewModel();
    });

    testWidgets('SelectLanguageDialog on click english', (tester) async {
      when(globalVm.isLanguageSelected('en')).thenAnswer((_) => false);
      when(globalVm.isLanguageSelected('nl')).thenAnswer((_) => false);
      when(globalVm.isLanguageSelected(null)).thenAnswer((_) => false);
      bool? clicked;
      final widget = SelectLanguageDialog(goBack: () {
        clicked = true;
      });

      await TestUtil.loadScreen(tester, widget);
      final finder = find.text('English');
      expect(finder, findsOneWidget);
      await tester.tap(finder);
      await tester.pumpAndSettle();

      verify(globalVm.isLanguageSelected(any));
      verify(globalVm.updateLocale(const Locale('en'))).calledOnce();
      expect(clicked, true);
      verifyGlobalViewModel();
    });
    testWidgets('SelectLanguageDialog on click nederlands', (tester) async {
      when(globalVm.isLanguageSelected('en')).thenAnswer((_) => false);
      when(globalVm.isLanguageSelected('nl')).thenAnswer((_) => false);
      when(globalVm.isLanguageSelected(null)).thenAnswer((_) => false);
      bool? clicked;
      final widget = SelectLanguageDialog(goBack: () {
        clicked = true;
      });

      await TestUtil.loadScreen(tester, widget);
      final finder = find.text('Nederlands');
      expect(finder, findsOneWidget);
      await tester.tap(finder);
      await tester.pumpAndSettle();

      verify(globalVm.isLanguageSelected(any));
      verify(globalVm.updateLocale(const Locale('nl'))).calledOnce();
      expect(clicked, true);
      verifyGlobalViewModel();
    });
    testWidgets('SelectLanguageDialog on click system defaults', (tester) async {
      when(globalVm.isLanguageSelected('en')).thenAnswer((_) => false);
      when(globalVm.isLanguageSelected('nl')).thenAnswer((_) => false);
      when(globalVm.isLanguageSelected(null)).thenAnswer((_) => false);
      bool? clicked;
      final widget = SelectLanguageDialog(goBack: () {
        clicked = true;
      });

      await TestUtil.loadScreen(tester, widget);
      final finder = TextFinder(LocalizationsEn.systemDefault, substring: true);
      expect(finder, findsOneWidget);
      await tester.tap(finder);
      await tester.pumpAndSettle();

      verify(globalVm.isLanguageSelected(any));
      verify(globalVm.updateLocale(null)).calledOnce();
      expect(clicked, true);
      verifyGlobalViewModel();
    });
  });
}