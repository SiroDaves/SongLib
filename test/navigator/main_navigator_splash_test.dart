import 'package:flutter/cupertino.dart';
import 'package:songlib/navigator/main_navigator.dart';
import 'package:flutter_test/flutter_test.dart';

import '../di/test_injectable.dart';
import '../view/seed.dart';
import '../util/test_util.dart';

void main() {
  setUp(() async => initTestInjectable());

  testWidgets('Test main navigator widget splash', (tester) async {
    seedGlobalViewModel();

    final key = GlobalKey<MainNavigatorState>();
    final sut = MainNavigator(key: key);
    final testWidget = await TestUtil.loadScreen(tester, sut);
    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'main_navigator_splash_screen_0_initial_screen');
    key.currentState!.goToSplash();
    await tester.pumpAndSettle();
    await TestUtil.takeScreenshotForAllSizes(tester, testWidget, 'main_navigator_splash_screen_1');
  });
}
