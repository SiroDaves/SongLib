import 'package:flutter/cupertino.dart';
import 'package:songlib/navigator/main_navigator.dart';
import 'package:flutter_test/flutter_test.dart';

import '../di/test_injectable.dart';
import '../view/seed.dart';
import '../util/test_util.dart';

void main() {
  setUp(() async => initTestInjectable());

  testWidgets('Test main navigator widget login', (tester) async {
    seedGlobalViewModel();

    final key = GlobalKey<MainNavigatorState>();
    final sut = MainNavigator(key: key);
    final testWidget = await TestUtil.loadScreen(tester, sut);
    await tester.pumpAndSettle();
    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'main_navigator_debug_select_platform_screen_1');
    key.currentState!.goBack<void>();
    await tester.pumpAndSettle();
    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'main_navigator_debug_select_platform_screen_2_go_back');
  });
}
