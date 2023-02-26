import 'package:songlib/widget/settings/settings_switch_row_item.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../di/test_injectable.dart';
import '../../util/test_util.dart';

void main() {
  setUp(() async => initTestInjectable());

  testWidgets('SettingsRowSwitchItem selected state', (tester) async {
    final widget = SettingsRowSwitchItem(
      title: 'Title',
      value: true,
      onChanged: (value) {},
    );

    await TestUtil.loadWidgetWithText(tester, widget);
    await TestUtil.takeScreenshot(tester, 'debug_switch_row_item_selected_state');
  });

  testWidgets('SettingsRowSwitchItem selected state with subtitle', (tester) async {
    final widget = SettingsRowSwitchItem(
      title: 'Title',
      subTitle: 'SubTitle',
      value: true,
      onChanged: (value) {},
    );

    await TestUtil.loadWidgetWithText(tester, widget);
    await TestUtil.takeScreenshot(tester, 'debug_switch_row_item_selected_state_subtitle');
  });

  testWidgets('SettingsRowSwitchItem unselected state', (tester) async {
    final widget = SettingsRowSwitchItem(
      title: 'Title',
      value: false,
      onChanged: (value) {},
    );

    await TestUtil.loadWidgetWithText(tester, widget);
    await TestUtil.takeScreenshot(tester, 'debug_switch_row_item_unselected_state');
  });

  testWidgets('SettingsRowSwitchItem unselected state with subtitle', (tester) async {
    final widget = SettingsRowSwitchItem(
      title: 'Title',
      subTitle: 'SubTitle',
      value: false,
      onChanged: (value) {},
    );

    await TestUtil.loadWidgetWithText(tester, widget);
    await TestUtil.takeScreenshot(tester, 'debug_switch_row_item_unselected_state_subtitle');
  });

  group('OnChanged', () {
    testWidgets('SettingsRowSwitchItem selected state', (tester) async {
      bool? newValue;
      final widget = SettingsRowSwitchItem(
        title: 'Title',
        value: true,
        onChanged: (value) {
          newValue = value;
        },
      );

      await TestUtil.loadWidgetWithText(tester, widget);
      final finder = find.byType(SettingsRowSwitchItem);
      expect(finder, findsOneWidget);
      await tester.tap(finder);
      await tester.pumpAndSettle();
      expect(newValue, false);
    });

    testWidgets('SettingsRowSwitchItem selected state with subtitle', (tester) async {
      bool? newValue;
      final widget = SettingsRowSwitchItem(
        title: 'Title',
        subTitle: 'SubTitle',
        value: true,
        onChanged: (value) {
          newValue = value;
        },
      );

      await TestUtil.loadWidgetWithText(tester, widget);
      final finder = find.byType(SettingsRowSwitchItem);
      expect(finder, findsOneWidget);
      await tester.tap(finder);
      await tester.pumpAndSettle();
      expect(newValue, false);
    });

    testWidgets('SettingsRowSwitchItem unselected state', (tester) async {
      bool? newValue;
      final widget = SettingsRowSwitchItem(
        title: 'Title',
        value: false,
        onChanged: (value) {
          newValue = value;
        },
      );

      await TestUtil.loadWidgetWithText(tester, widget);
      final finder = find.byType(SettingsRowSwitchItem);
      expect(finder, findsOneWidget);
      await tester.tap(finder);
      await tester.pumpAndSettle();
      expect(newValue, true);
    });

    testWidgets('SettingsRowSwitchItem unselected state with subtitle', (tester) async {
      bool? newValue;
      final widget = SettingsRowSwitchItem(
        title: 'Title',
        subTitle: 'SubTitle',
        value: false,
        onChanged: (value) {
          newValue = value;
        },
      );

      await TestUtil.loadWidgetWithText(tester, widget);
      final finder = find.byType(SettingsRowSwitchItem);
      expect(finder, findsOneWidget);
      await tester.tap(finder);
      await tester.pumpAndSettle();
      expect(newValue, true);
    });
  });
}
