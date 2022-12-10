import 'dart:async';

import 'package:flutter/material.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

import '../../repository/debug_repository.dart';
import '../repository/locale_repository.dart';
import '../repository/shared_prefs/local_storage.dart';
import '../utils/constants/pref_constants.dart';
import '../utils/env/flavor_config.dart';
import '../utils/locale/localization.dart';
import '../utils/locale/localization_delegate.dart';

@singleton
class GlobalVM with ChangeNotifierEx {
  final LocaleRepository localeRepository;
  final DebugRepository debugRepository;
  final LocalStorage localStorage;
  var localizationDelegate = LocalizationDelegate();
  var showTranslationKeys = false;

  TargetPlatform? targetPlat;

  GlobalVM(
    this.localeRepository,
    this.debugRepository,
    this.localStorage,
  );

  ThemeMode get themeMode => FlavorConfig.instance.themeMode;

  Locale? get locale => localizationDelegate.newLocale;

  TargetPlatform? get targetPlatform => targetPlat;

  LocalizationDelegate get localeDelegate => localizationDelegate;

  bool get showsTranslationKeys => showTranslationKeys;

  bool wakeLockStatus = false;
  bool slideHorizontal = false;

  Future<void> init(BuildContext context) async {
    initLocale();
    initTargetPlatform();
    getThemeMode();
  }

  void initTargetPlatform() {
    targetPlat = debugRepository.getTargetPlatform();
    notifyListeners();
  }

  void initLocale() {
    final locale = localeRepository.getCustomLocale();
    if (locale != null) {
      localizationDelegate = LocalizationDelegate(newLocale: locale);
      notifyListeners();
    }
  }

  void getThemeMode() {
    FlavorConfig.instance.themeMode = localStorage.getThemeMode();
    notifyListeners();
  }

  Future<void> onUpdateLocaleClicked(Locale? locale) async {
    await localeRepository.setCustomLocale(locale);
    localizationDelegate = LocalizationDelegate(newLocale: locale);
    notifyListeners();
  }

  Future<void> setSelectedPlatformToAndroid() async {
    await debugRepository.saveSelectedPlatform('android');
    initTargetPlatform();
  }

  Future<void> setSelectedPlatformToIOS() async {
    await debugRepository.saveSelectedPlatform('ios');
    initTargetPlatform();
  }

  Future<void> setSelectedPlatformToDefault() async {
    await debugRepository.saveSelectedPlatform(null);
    initTargetPlatform();
  }

  Future<void> updateThemeMode(ThemeMode themeMode) async {
    FlavorConfig.instance.themeMode = themeMode;
    notifyListeners();
    await localStorage.updateThemeMode(themeMode);
  }

  Future<void> updateWakeLockStatus(bool wakeLock) async {
    wakeLockStatus = wakeLock;
    notifyListeners();
    localStorage.setPrefBool(PrefConstants.wakeLockCheckKey, wakeLock);
  }

  Future<void> updateSlideHorizontal(bool slideDirection) async {
    slideHorizontal = slideDirection;
    notifyListeners();
    localStorage.setPrefBool(PrefConstants.slideHorizontalKey, slideDirection);
  }

  String getCurrentPlatform() {
    if (targetPlatform == TargetPlatform.android) {
      return 'Android';
    } else if (targetPlatform == TargetPlatform.iOS) {
      return 'Ios';
    }
    return 'System Default';
  }

  String getAppearanceValue(Localization localization) {
    switch (FlavorConfig.instance.themeMode) {
      case ThemeMode.dark:
        return 'Dark';
      case ThemeMode.light:
        return 'Light';
      default:
        return 'System';
    }
  }

  String getCurrentLanguage() {
    switch (localeDelegate.activeLocale?.languageCode) {
      case 'en':
        return 'English';
    }
    return 'English';
  }

  bool isLanguageSelected(String? languageCode) {
    if (localeDelegate.activeLocale == null && languageCode == null)
      return true;
    return localeDelegate.activeLocale?.languageCode == languageCode;
  }

  void toggleTranslationKeys() {
    showTranslationKeys = !showsTranslationKeys;
    localizationDelegate = LocalizationDelegate(
        newLocale: localeDelegate.activeLocale,
        showLocalizationKeys: showsTranslationKeys);
    notifyListeners();
  }
}