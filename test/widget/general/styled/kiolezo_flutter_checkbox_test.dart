import 'package:flutter/material.dart';
import 'package:songlib/widget/general/styled/songlib_checkbox.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../di/test_injectable.dart';
import '../../../util/test_util.dart';

void main() {
  setUp(() async => initTestInjectable());
  group('Android', () {
    testWidgets('Android KiolezoFlutterCheckBox with false value', (tester) async {
      final sut = Theme(
        data: ThemeData(platform: TargetPlatform.android),
        child: KiolezoFlutterCheckBox(
          value: false,
          onChanged: (value) {},
        ),
      );

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'songlib_checkbox_false_android');
    });

    testWidgets('Android KiolezoFlutterCheckBox with true value', (tester) async {
      final sut = Theme(
        data: ThemeData(platform: TargetPlatform.android),
        child: KiolezoFlutterCheckBox(
          value: true,
          onChanged: (value) {},
        ),
      );

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'songlib_checkbox_true_android');
    });

    group('OnChanged', () {
      testWidgets('Android KiolezoFlutterCheckBox onChanged from value true', (tester) async {
        bool? newValue;
        final sut = Theme(
          data: ThemeData(platform: TargetPlatform.android),
          child: KiolezoFlutterCheckBox(
            value: true,
            onChanged: (value) {
              newValue = value;
            },
          ),
        );

        await TestUtil.loadWidgetWithText(tester, sut);
        final finder = find.byType(KiolezoFlutterCheckBox);
        expect(finder, findsOneWidget);
        await tester.tap(finder);
        await tester.pumpAndSettle();
        expect(newValue, false);
      });
      testWidgets('KiolezoFlutterCheckBox onChanged from value false - android', (tester) async {
        bool? newValue;
        final sut = Theme(
          data: ThemeData(platform: TargetPlatform.android),
          child: KiolezoFlutterCheckBox(
            value: false,
            onChanged: (value) {
              newValue = value;
            },
          ),
        );

        await TestUtil.loadWidgetWithText(tester, sut);
        final finder = find.byType(KiolezoFlutterCheckBox);
        expect(finder, findsOneWidget);
        await tester.tap(finder);
        await tester.pumpAndSettle();
        expect(newValue, true);
      });
    });
  });

  group('iOS', () {
    testWidgets('KiolezoFlutterCheckBox with false value', (tester) async {
      final sut = Theme(
        data: ThemeData(platform: TargetPlatform.iOS),
        child: KiolezoFlutterCheckBox(
          value: false,
          onChanged: (value) {},
        ),
      );

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'songlib_checkbox_false_ios');
    });

    testWidgets('KiolezoFlutterCheckBox with true value', (tester) async {
      final sut = Theme(
        data: ThemeData(platform: TargetPlatform.iOS),
        child: KiolezoFlutterCheckBox(
          value: true,
          onChanged: (value) {},
        ),
      );

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'songlib_checkbox_true_ios');
    });

    group('OnChanged', () {
      testWidgets('KiolezoFlutterCheckBox onChanged from value true', (tester) async {
        bool? newValue;
        final sut = Theme(
          data: ThemeData(platform: TargetPlatform.iOS),
          child: KiolezoFlutterCheckBox(
            value: true,
            onChanged: (value) {
              newValue = value;
            },
          ),
        );

        await TestUtil.loadWidgetWithText(tester, sut);
        final finder = find.byType(KiolezoFlutterCheckBox);
        expect(finder, findsOneWidget);
        await tester.tap(finder);
        await tester.pumpAndSettle();
        expect(newValue, false);
      });
      testWidgets('KiolezoFlutterCheckBox onChanged from value false', (tester) async {
        bool? newValue;
        final sut = Theme(
          data: ThemeData(platform: TargetPlatform.iOS),
          child: KiolezoFlutterCheckBox(
            value: false,
            onChanged: (value) {
              newValue = value;
            },
          ),
        );

        await TestUtil.loadWidgetWithText(tester, sut);
        final finder = find.byType(KiolezoFlutterCheckBox);
        expect(finder, findsOneWidget);
        await tester.tap(finder);
        await tester.pumpAndSettle();
        expect(newValue, true);
      });
    });
  });
}
