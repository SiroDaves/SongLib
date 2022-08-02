import 'package:songlib/widget/general/styled/myapp_input_field.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../di/test_injectable.dart';
import '../../../util/test_util.dart';

void main() {
  setUp(() async => initTestInjectable());
  testWidgets('MyappInputField with enabled true', (tester) async {
    final sut = MyappInputField(
      onChanged: (value) {},
      enabled: true,
      hint: 'Hint text',
    );

    await TestUtil.loadWidgetWithText(tester, sut);
    await TestUtil.takeScreenshot(tester, 'myapp_input_field_with_hint_and_enabled');
  });

  testWidgets('MyappInputField with enabled false', (tester) async {
    final sut = MyappInputField(
      onChanged: (value) {},
      enabled: false,
      hint: 'Hint text',
    );

    await TestUtil.loadWidgetWithText(tester, sut);
    await TestUtil.takeScreenshot(tester, 'myapp_input_field_with_hint_and_disabled');
  });

  group('OnChanged', () {
    testWidgets('MyappInputField with false value', (tester) async {
      String? newText;
      final sut = MyappInputField(
        onChanged: (value) {
          newText = value;
        },
        enabled: true,
        hint: 'Hint text',
      );

      await TestUtil.loadWidgetWithText(tester, sut);
      await TestUtil.takeScreenshot(tester, 'myapp_input_field_type_text_before');
      final finder = find.byType(MyappInputField);
      expect(finder, findsOneWidget);
      await tester.showKeyboard(finder);
      await tester.enterText(finder, 'Testing');
      await tester.pumpAndSettle();
      await TestUtil.takeScreenshot(tester, 'myapp_input_field_type_text_after');
      expect(newText, 'Testing');
    });
  });
}
