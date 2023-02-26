import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:songlib/view/settings/settings_screen.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../di/injectable_test.mocks.dart';
import '../../di/test_injectable.dart';
import '../../mocks/main_navigator/mock_main_navigator_widget.dart';
import '../../util/test_extensions.dart';
import '../../util/test_util.dart';
import '../seed.dart';

void main() {
  setUp(() async => initTestInjectable());

  testWidgets('Test debug screen on select target clicked', (tester) async {
    seedSettingsViewModel();
    seedGlobalViewModel();

    final mockNavigation = MockMainNavigation();
    final debugKey = GlobalKey<SettingsScreenState>();
    final sut = MockMainNavigator(
      mock: mockNavigation,
      child: SettingsScreen(key: debugKey),
    );
    await TestUtil.loadScreen(tester, sut);

    debugKey.currentState!.goToTargetPlatformSelector();
    verifyNoMoreInteractions(mockNavigation);

    debugKey.currentState!.goToLicenses();
    verify(mockNavigation.goToLicense()).calledOnce();
    verifyNoMoreInteractions(mockNavigation);

    debugKey.currentState!.goToSelectLanguage();
    verify(mockNavigation.showCustomDialog<void>(builder: anyNamed('builder'))).calledOnce();
    verifyNoMoreInteractions(mockNavigation);

    debugKey.currentState!.goToDatabase();
    verify(mockNavigation.goToDatabase(any)).calledOnce();
    verifyNoMoreInteractions(mockNavigation);
  });
}
