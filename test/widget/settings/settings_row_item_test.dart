import 'package:songlib/widget/settings/settings_row_item.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../di/test_injectable.dart';
import '../../util/test_util.dart';

void main() {
  setUp(() async => initTestInjectable());

  testWidgets('SettingsRowItem without subtitle', (tester) async {
    final widget = SettingsRowItem(
      title: 'Title',
      onClick: () {},
    );

    await TestUtil.loadWidgetWithText(tester, widget);
    await TestUtil.takeScreenshot(tester, 'debug_row_item_with_title');
  });

  testWidgets('SettingsRowItem with subtitle', (tester) async {
    final widget = SettingsRowItem(
      title: 'Title',
      subTitle: 'SubTitle',
      onClick: () {},
    );

    await TestUtil.loadWidgetWithText(tester, widget);
    await TestUtil.takeScreenshot(tester, 'debug_row_item_with_subtitle');
  });

  group('Click callback', () {
    testWidgets('SettingsRowItem without subtitle on click', (tester) async {
      var clicked = false;
      final widget = SettingsRowItem(
        title: 'Title',
        onClick: () {
          clicked = true;
        },
      );

      await TestUtil.loadWidgetWithText(tester, widget);
      final finder = find.byType(SettingsRowItem);
      expect(finder, findsOneWidget);
      await tester.tap(finder);
      await tester.pumpAndSettle();
      expect(clicked, true);
    });
    testWidgets('SettingsRowItem with subtitle on click', (tester) async {
      var clicked = false;
      final widget = SettingsRowItem(
        title: 'Title',
        subTitle: 'Subtitle',
        onClick: () {
          clicked = true;
        },
      );

      await TestUtil.loadWidgetWithText(tester, widget);
      final finder = find.byType(SettingsRowItem);
      expect(finder, findsOneWidget);
      await tester.tap(finder);
      await tester.pumpAndSettle();
      expect(clicked, true);
    });
  });
}
