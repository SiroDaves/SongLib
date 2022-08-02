import 'package:songlib/widget/general/styled/myapp_progress_indicator.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../di/test_injectable.dart';
import '../../../util/test_util.dart';

void main() {
  setUp(() async => initTestInjectable());

  testWidgets('MyappProgressIndicator initial state', (tester) async {
    const sut = MyappProgressIndicator.light();

    await TestUtil.loadWidgetWithText(tester, sut);
    await TestUtil.takeScreenshot(tester, 'myapp_progress_indicator_light');
  });

  testWidgets('MyappProgressIndicator initial state dark', (tester) async {
    const sut = MyappProgressIndicator.dark();

    await TestUtil.loadWidgetWithText(tester, sut);
    await TestUtil.takeScreenshot(tester, 'myapp_progress_indicator_dark');
  });
}
