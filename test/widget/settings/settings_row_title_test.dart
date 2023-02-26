import 'package:songlib/widget/settings/settings_row_title.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../di/test_injectable.dart';
import '../../util/test_util.dart';

void main() {
  setUp(() async => initTestInjectable());

  testWidgets('SettingsRowTitle default', (tester) async {
    final widget = SettingsRowTitle(title: TestUtil.getVariableString());

    await TestUtil.loadWidgetWithText(tester, widget);
    await TestUtil.takeScreenshot(tester, 'debug_row_title_default_state');
  });
}
