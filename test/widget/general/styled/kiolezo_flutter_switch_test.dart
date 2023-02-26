import 'package:flutter/material.dart';
import 'package:songlib/widget/general/styled/songlib_switch.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../di/test_injectable.dart';
import '../../../util/test_util.dart';

void main() {
  setUp(() async => initTestInjectable());
  group('Android', () {
    testWidgets('KiolezoFlutterSwitch with false value', (tester) async {
      final sut = Theme(
        data: ThemeData(platform: TargetPlatform.android),
        child: KiolezoFlutterSwitch(
          value: false,
          onChanged: (value) {},
        ),
      );

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'songlib_switch_false_android');
    });

    testWidgets('KiolezoFlutterSwitch with true value', (tester) async {
      final sut = Theme(
        data: ThemeData(platform: TargetPlatform.android),
        child: KiolezoFlutterSwitch(
          value: true,
          onChanged: (value) {},
        ),
      );

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'songlib_switch_true_android');
    });

    group('OnChanged', () {
      testWidgets('KiolezoFlutterSwitch onChanged from value true', (tester) async {
        bool? newValue;
        final sut = Theme(
          data: ThemeData(platform: TargetPlatform.android),
          child: KiolezoFlutterSwitch(
            value: true,
            onChanged: (value) {
              newValue = value;
            },
          ),
        );

        await TestUtil.loadWidgetWithText(tester, sut);
        final finder = find.byType(KiolezoFlutterSwitch);
        expect(finder, findsOneWidget);
        await tester.tap(finder);
        await tester.pumpAndSettle();
        expect(newValue, false);
      });
      testWidgets('KiolezoFlutterSwitch onChanged from value false', (tester) async {
        bool? newValue;
        final sut = Theme(
          data: ThemeData(platform: TargetPlatform.android),
          child: KiolezoFlutterSwitch(
            value: false,
            onChanged: (value) {
              newValue = value;
            },
          ),
        );

        await TestUtil.loadWidgetWithText(tester, sut);
        final finder = find.byType(KiolezoFlutterSwitch);
        expect(finder, findsOneWidget);
        await tester.tap(finder);
        await tester.pumpAndSettle();
        expect(newValue, true);
      });
    });
  });

  group('iOS', () {
    testWidgets('KiolezoFlutterSwitch with false value', (tester) async {
      final sut = Theme(
        data: ThemeData(platform: TargetPlatform.iOS),
        child: KiolezoFlutterSwitch(
          value: false,
          onChanged: (value) {},
        ),
      );

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'songlib_switch_false_ios');
    });

    testWidgets('KiolezoFlutterSwitch with true value', (tester) async {
      final sut = Theme(
        data: ThemeData(platform: TargetPlatform.iOS),
        child: KiolezoFlutterSwitch(
          value: true,
          onChanged: (value) {},
        ),
      );

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'songlib_switch_true_ios');
    });

    group('OnChanged', () {
      testWidgets('KiolezoFlutterSwitch onChanged from value true', (tester) async {
        bool? newValue;
        final sut = Theme(
          data: ThemeData(platform: TargetPlatform.iOS),
          child: KiolezoFlutterSwitch(
            value: true,
            onChanged: (value) {
              newValue = value;
            },
          ),
        );

        await TestUtil.loadWidgetWithText(tester, sut);
        final finder = find.byType(KiolezoFlutterSwitch);
        expect(finder, findsOneWidget);
        await tester.tap(finder);
        await tester.pumpAndSettle();
        expect(newValue, false);
      });
      testWidgets('KiolezoFlutterSwitch onChanged from value false', (tester) async {
        bool? newValue;
        final sut = Theme(
          data: ThemeData(platform: TargetPlatform.iOS),
          child: KiolezoFlutterSwitch(
            value: false,
            onChanged: (value) {
              newValue = value;
            },
          ),
        );

        await TestUtil.loadWidgetWithText(tester, sut);
        final finder = find.byType(KiolezoFlutterSwitch);
        expect(finder, findsOneWidget);
        await tester.tap(finder);
        await tester.pumpAndSettle();
        expect(newValue, true);
      });
    });
  });
}
