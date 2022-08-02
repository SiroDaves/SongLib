import 'package:flutter/material.dart';
import 'package:songlib/styles/theme_dimens.dart';
import 'package:songlib/widget/general/styled/myapp_button.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../di/test_injectable.dart';
import '../../../util/test_util.dart';

void main() {
  setUp(() async => initTestInjectable());
  group('Android', () {
    testWidgets('MyappButton initial state', (tester) async {
      final sut = Theme(
        data: ThemeData(platform: TargetPlatform.android),
        child: MyappButton(
          text: 'Hallokes',
          onClick: () {},
        ),
      );

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'myapp_button_default_state_android');
    });

    testWidgets('MyappButton initial state with height', (tester) async {
      final sut = Theme(
        data: ThemeData(platform: TargetPlatform.android),
        child: MyappButton(
          text: 'Hallokes',
          height: ThemeDimens.padding96,
          onClick: () {},
        ),
      );

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'myapp_button_with_height_android');
    });

    testWidgets('MyappButton initial state with key', (tester) async {
      const key = ValueKey('A-Testing-Key');
      final sut = Theme(
        data: ThemeData(platform: TargetPlatform.android),
        child: MyappButton(
          text: 'Hallokes',
          key: key,
          onClick: () {},
        ),
      );

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'myapp_button_with_key_android');
      final finder = find.byKey(key);
      expect(finder, findsOneWidget);
    });

    testWidgets('MyappButton initial state is not enabled', (tester) async {
      final sut = Theme(
        data: ThemeData(platform: TargetPlatform.android),
        child: MyappButton(
          text: 'Hallokes',
          isEnabled: false,
          onClick: () {},
        ),
      );

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'myapp_button_not_enabled_android');
    });

    group('Clicked', () {
      testWidgets('MyappButton initial state with key', (tester) async {
        var clicked = false;
        final sut = Theme(
          data: ThemeData(platform: TargetPlatform.android),
          child: MyappButton(
            text: 'Hallokes',
            onClick: () {
              clicked = true;
            },
          ),
        );

        await TestUtil.loadWidgetWithText(tester, sut);
        final finder = find.byType(MyappButton);
        expect(finder, findsOneWidget);
        await tester.tap(finder);
        await tester.pumpAndSettle();
        expect(clicked, true);
      });
    });
  });

  group('iOS', () {
    testWidgets('MyappButton initial state', (tester) async {
      final sut = Theme(
        data: ThemeData(platform: TargetPlatform.iOS),
        child: MyappButton(
          text: 'Hallokes',
          onClick: () {},
        ),
      );

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'myapp_button_default_state_ios');
    });

    testWidgets('MyappButton initial state with height', (tester) async {
      final sut = Theme(
        data: ThemeData(platform: TargetPlatform.iOS),
        child: MyappButton(
          text: 'Hallokes',
          height: ThemeDimens.padding96,
          onClick: () {},
        ),
      );

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'myapp_button_with_height_ios');
    });

    testWidgets('MyappButton initial state with key', (tester) async {
      const key = ValueKey('A-Testing-Key');
      final sut = Theme(
        data: ThemeData(platform: TargetPlatform.iOS),
        child: MyappButton(
          text: 'Hallokes',
          key: key,
          onClick: () {},
        ),
      );

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'myapp_button_with_key_ios');
      final finder = find.byKey(key);
      expect(finder, findsOneWidget);
    });

    testWidgets('MyappButton initial state is not enabled', (tester) async {
      final sut = Theme(
        data: ThemeData(platform: TargetPlatform.iOS),
        child: MyappButton(
          text: 'Hallokes',
          isEnabled: false,
          onClick: () {},
        ),
      );

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'myapp_button_not_enabled_ios');
    });

    group('Clicked', () {
      testWidgets('MyappButton initial state with key', (tester) async {
        var clicked = false;
        final sut = Theme(
          data: ThemeData(platform: TargetPlatform.iOS),
          child: MyappButton(
            text: 'Hallokes',
            onClick: () {
              clicked = true;
            },
          ),
        );

        await TestUtil.loadWidgetWithText(tester, sut);
        final finder = find.byType(MyappButton);
        expect(finder, findsOneWidget);
        await tester.tap(finder);
        await tester.pumpAndSettle();
        expect(clicked, true);
      });
    });
  });
}
