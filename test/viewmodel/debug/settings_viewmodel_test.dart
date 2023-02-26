import 'package:songlib/repository/settings/settings_repository.dart';
import 'package:songlib/viewmodel/settings/settings_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mockito/mockito.dart';

import '../../di/test_injectable.dart';
import '../../util/test_extensions.dart';

void main() {
  late SettingsViewModel sut;
  late SettingsNavigator navigator;
  late SettingsRepository debugRepo;

  setUp(() async {
    await initTestInjectable();
    navigator = MockSettingsNavigator();
    debugRepo = GetIt.I();
    sut = SettingsViewModel(debugRepo);
  });

  test('SettingsViewModel init', () async {
    when(debugRepo.isSlowAnimationsEnabled()).thenReturn(true);
    await sut.init(navigator);
    verify(debugRepo.isSlowAnimationsEnabled()).calledOnce();
    verifyNoMoreInteractions(debugRepo);
    verifyZeroInteractions(navigator);
  });

  group('After init', () {
    setUp(() async {
      when(debugRepo.isSlowAnimationsEnabled()).thenReturn(true);
      await sut.init(navigator);
      reset(navigator);
      reset(debugRepo);
    });

    test('SettingsViewModel onLicensesClicked', () async {
      sut.onSelectLanguageClicked();
      verify(navigator.goToSelectLanguage()).calledOnce();
      verifyNoMoreInteractions(navigator);
      verifyZeroInteractions(debugRepo);
    });

    test('SettingsViewModel onLicensesClicked', () async {
      sut.onLicensesClicked();
      verify(navigator.goToLicenses()).calledOnce();
      verifyNoMoreInteractions(navigator);
      verifyZeroInteractions(debugRepo);
    });

    test('SettingsViewModel onLicensesClicked', () async {
      sut.onTargetPlatformClicked();
      verify(navigator.goToTargetPlatformSelector()).calledOnce();
      verifyNoMoreInteractions(navigator);
      verifyZeroInteractions(debugRepo);
    });

    test('SettingsViewModel onThemeModeClicked', () async {
      sut.onThemeModeClicked();
      verify(navigator.goToThemeModeSelector()).calledOnce();
      verifyNoMoreInteractions(navigator);
      verifyZeroInteractions(debugRepo);
    });

    group('onSlowAnimationsChanged', () {
      test('SettingsViewModel onSlowAnimationsChanged with false', () async {
        when(debugRepo.isSlowAnimationsEnabled()).thenAnswer((_) => false);
        await sut.onSlowAnimationsChanged(false);
        verify(debugRepo.saveSlowAnimations(enabled: false)).calledOnce();
        verify(debugRepo.isSlowAnimationsEnabled()).calledOnce();
        expect(sut.slowAnimationsEnabled, false);
        verifyZeroInteractions(navigator);
        verifyNoMoreInteractions(debugRepo);
      });
      test('SettingsViewModel onSlowAnimationsChanged with true', () async {
        when(debugRepo.isSlowAnimationsEnabled()).thenAnswer((_) => true);
        await sut.onSlowAnimationsChanged(true);
        verify(debugRepo.saveSlowAnimations(enabled: true)).calledOnce();
        verify(debugRepo.isSlowAnimationsEnabled()).calledOnce();
        expect(sut.slowAnimationsEnabled, true);
        verifyZeroInteractions(navigator);
        verifyNoMoreInteractions(debugRepo);
      });
    });
  });
}

class MockSettingsNavigator extends Mock implements SettingsNavigator {}
