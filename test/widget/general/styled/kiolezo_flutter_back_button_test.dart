import 'package:songlib/widget/general/styled/songlib_back_button.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../di/test_injectable.dart';
import '../../../util/test_util.dart';

void main() {
  setUp(() async => initTestInjectable());

  group('KiolezoFlutterBackButton dark', () {
    testWidgets('KiolezoFlutterBackButton dark initial state', (tester) async {
      final sut = KiolezoFlutterBackButton.dark(onClick: () {});

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'songlib_back_button_dark');
    });

    testWidgets('KiolezoFlutterBackButton dark initial state fullscreen', (tester) async {
      final sut = KiolezoFlutterBackButton.dark(
        onClick: () {},
        fullScreen: true,
      );

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'songlib_back_button_full_screen_dark');
    });

    testWidgets('KiolezoFlutterBackButton dark click', (tester) async {
      var clicked = false;
      final sut = KiolezoFlutterBackButton.dark(onClick: () {
        clicked = true;
      });

      await TestUtil.loadWidgetWithText(tester, sut);
      final finder = find.byType(KiolezoFlutterBackButton);
      expect(finder, findsOneWidget);
      await tester.tap(finder);
      await tester.pumpAndSettle();
      expect(clicked, true);
    });
  });

  group('KiolezoFlutterBackButton light', () {
    testWidgets('KiolezoFlutterBackButton light initial state', (tester) async {
      final sut = KiolezoFlutterBackButton.light(onClick: () {});

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'songlib_back_button_light');
    });

    testWidgets('KiolezoFlutterBackButton light initial state fullscreen', (tester) async {
      final sut = KiolezoFlutterBackButton.light(
        onClick: () {},
        fullScreen: true,
      );

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'songlib_back_button_full_screen_light');
    });

    testWidgets('KiolezoFlutterBackButton light click', (tester) async {
      var clicked = false;
      final sut = KiolezoFlutterBackButton.light(onClick: () {
        clicked = true;
      });

      await TestUtil.loadWidgetWithText(tester, sut);
      final finder = find.byType(KiolezoFlutterBackButton);
      expect(finder, findsOneWidget);
      await tester.tap(finder);
      await tester.pumpAndSettle();
      expect(clicked, true);
    });
  });
}
