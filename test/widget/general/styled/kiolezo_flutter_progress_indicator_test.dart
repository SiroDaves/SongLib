import 'package:songlib/widget/general/styled/songlib_progress_indicator.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../di/test_injectable.dart';
import '../../../util/test_util.dart';

void main() {
  setUp(() async => initTestInjectable());

  testWidgets('KiolezoFlutterProgressIndicator initial state', (tester) async {
    const sut = KiolezoFlutterProgressIndicator.light();

    await TestUtil.loadWidgetWithText(tester, sut);
    await TestUtil.takeScreenshot(tester, 'songlib_progress_indicator_light');
  });

  testWidgets('KiolezoFlutterProgressIndicator initial state dark', (tester) async {
    const sut = KiolezoFlutterProgressIndicator.dark();

    await TestUtil.loadWidgetWithText(tester, sut);
    await TestUtil.takeScreenshot(tester, 'songlib_progress_indicator_dark');
  });
}
