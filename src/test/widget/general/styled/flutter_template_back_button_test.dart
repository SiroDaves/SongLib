import 'package:songlib/widget/general/styled/myapp_back_button.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../di/test_injectable.dart';
import '../../../util/test_util.dart';

void main() {
  setUp(() async => initTestInjectable());

  group('MyappBackButton dark', () {
    testWidgets('MyappBackButton dark initial state', (tester) async {
      final sut = MyappBackButton.dark(onClick: () {});

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'myapp_back_button_dark');
    });

    testWidgets('MyappBackButton dark initial state fullscreen', (tester) async {
      final sut = MyappBackButton.dark(
        onClick: () {},
        fullScreen: true,
      );

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'myapp_back_button_full_screen_dark');
    });

    testWidgets('MyappBackButton dark click', (tester) async {
      var clicked = false;
      final sut = MyappBackButton.dark(onClick: () {
        clicked = true;
      });

      await TestUtil.loadWidgetWithText(tester, sut);
      final finder = find.byType(MyappBackButton);
      expect(finder, findsOneWidget);
      await tester.tap(finder);
      await tester.pumpAndSettle();
      expect(clicked, true);
    });
  });

  group('MyappBackButton light', () {
    testWidgets('MyappBackButton light initial state', (tester) async {
      final sut = MyappBackButton.light(onClick: () {});

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'myapp_back_button_light');
    });

    testWidgets('MyappBackButton light initial state fullscreen', (tester) async {
      final sut = MyappBackButton.light(
        onClick: () {},
        fullScreen: true,
      );

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'myapp_back_button_full_screen_light');
    });

    testWidgets('MyappBackButton light click', (tester) async {
      var clicked = false;
      final sut = MyappBackButton.light(onClick: () {
        clicked = true;
      });

      await TestUtil.loadWidgetWithText(tester, sut);
      final finder = find.byType(MyappBackButton);
      expect(finder, findsOneWidget);
      await tester.tap(finder);
      await tester.pumpAndSettle();
      expect(clicked, true);
    });
  });
}
