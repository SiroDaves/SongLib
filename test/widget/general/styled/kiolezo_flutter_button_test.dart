import 'package:flutter/material.dart';
import 'package:songlib/styles/theme_dimens.dart';
import 'package:songlib/widget/general/styled/songlib_button.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../di/test_injectable.dart';
import '../../../util/test_util.dart';

void main() {
  setUp(() async => initTestInjectable());
  group('Android', () {
    testWidgets('KiolezoFlutterButton initial state', (tester) async {
      final sut = Theme(
        data: ThemeData(platform: TargetPlatform.android),
        child: KiolezoFlutterButton(
          text: 'Hallokes',
          onClick: () {},
        ),
      );

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'songlib_button_default_state_android');
    });

    testWidgets('KiolezoFlutterButton initial state with height', (tester) async {
      final sut = Theme(
        data: ThemeData(platform: TargetPlatform.android),
        child: KiolezoFlutterButton(
          text: 'Hallokes',
          height: ThemeDimens.padding96,
          onClick: () {},
        ),
      );

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'songlib_button_with_height_android');
    });

    testWidgets('KiolezoFlutterButton initial state with key', (tester) async {
      const key = ValueKey('A-Testing-Key');
      final sut = Theme(
        data: ThemeData(platform: TargetPlatform.android),
        child: KiolezoFlutterButton(
          text: 'Hallokes',
          key: key,
          onClick: () {},
        ),
      );

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'songlib_button_with_key_android');
      final finder = find.byKey(key);
      expect(finder, findsOneWidget);
    });

    testWidgets('KiolezoFlutterButton initial state is not enabled', (tester) async {
      final sut = Theme(
        data: ThemeData(platform: TargetPlatform.android),
        child: KiolezoFlutterButton(
          text: 'Hallokes',
          isEnabled: false,
          onClick: () {},
        ),
      );

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'songlib_button_not_enabled_android');
    });

    group('Clicked', () {
      testWidgets('KiolezoFlutterButton initial state with key', (tester) async {
        var clicked = false;
        final sut = Theme(
          data: ThemeData(platform: TargetPlatform.android),
          child: KiolezoFlutterButton(
            text: 'Hallokes',
            onClick: () {
              clicked = true;
            },
          ),
        );

        await TestUtil.loadWidgetWithText(tester, sut);
        final finder = find.byType(KiolezoFlutterButton);
        expect(finder, findsOneWidget);
        await tester.tap(finder);
        await tester.pumpAndSettle();
        expect(clicked, true);
      });
    });
  });

  group('iOS', () {
    testWidgets('KiolezoFlutterButton initial state', (tester) async {
      final sut = Theme(
        data: ThemeData(platform: TargetPlatform.iOS),
        child: KiolezoFlutterButton(
          text: 'Hallokes',
          onClick: () {},
        ),
      );

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'songlib_button_default_state_ios');
    });

    testWidgets('KiolezoFlutterButton initial state with height', (tester) async {
      final sut = Theme(
        data: ThemeData(platform: TargetPlatform.iOS),
        child: KiolezoFlutterButton(
          text: 'Hallokes',
          height: ThemeDimens.padding96,
          onClick: () {},
        ),
      );

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'songlib_button_with_height_ios');
    });

    testWidgets('KiolezoFlutterButton initial state with key', (tester) async {
      const key = ValueKey('A-Testing-Key');
      final sut = Theme(
        data: ThemeData(platform: TargetPlatform.iOS),
        child: KiolezoFlutterButton(
          text: 'Hallokes',
          key: key,
          onClick: () {},
        ),
      );

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'songlib_button_with_key_ios');
      final finder = find.byKey(key);
      expect(finder, findsOneWidget);
    });

    testWidgets('KiolezoFlutterButton initial state is not enabled', (tester) async {
      final sut = Theme(
        data: ThemeData(platform: TargetPlatform.iOS),
        child: KiolezoFlutterButton(
          text: 'Hallokes',
          isEnabled: false,
          onClick: () {},
        ),
      );

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'songlib_button_not_enabled_ios');
    });

    group('Clicked', () {
      testWidgets('KiolezoFlutterButton initial state with key', (tester) async {
        var clicked = false;
        final sut = Theme(
          data: ThemeData(platform: TargetPlatform.iOS),
          child: KiolezoFlutterButton(
            text: 'Hallokes',
            onClick: () {
              clicked = true;
            },
          ),
        );

        await TestUtil.loadWidgetWithText(tester, sut);
        final finder = find.byType(KiolezoFlutterButton);
        expect(finder, findsOneWidget);
        await tester.tap(finder);
        await tester.pumpAndSettle();
        expect(clicked, true);
      });
    });
  });
}
