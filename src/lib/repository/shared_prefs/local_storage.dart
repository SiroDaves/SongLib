import 'package:flutter/material.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

import '../../util/constants/pref_constants.dart';
import '../secure_storage/auth_storage.dart';

@lazySingleton
abstract class LocalStorage {
  @factoryMethod
  factory LocalStorage(
          AuthStorage storage, SharedPreferenceStorage preferences) =
      AppLocalStorage;

  int get autofollowThreshold;

  bool get isDataLoaded;

  bool get autofollowThresholdBelowAsk;

  bool get autofollowThresholdAboveAsk;

  String get selectedBooks;

  set autofollowThreshold(int value);

  set autofollowThresholdBelowAsk(bool value);

  set isCurrentGameTour(bool value);

  set isCurrentGameCareer(bool value);

  set autofollowThresholdAboveAsk(bool value);

  Future<bool> checkForNewInstallation();

  Future<bool> checkIfDataIsLoaded();

  ThemeMode getThemeMode();

  Future<void> updateThemeMode(ThemeMode themeMode);

  void setPreferenceBool(String settingsKey, bool settingsValue);
  void setPreferenceInt(String settingsKey, int settingsValue);
  void setPreferenceString(String settingsKey, String settingsValue);

  int get eventsCompleted;
  void clearData();
  set eventsCompleted(int value);
}

class AppLocalStorage implements LocalStorage {
  final AuthStorage authStorage;
  final SharedPreferenceStorage sharedPreferences;

  @override
  int get autofollowThreshold =>
      sharedPreferences.getInt(PrefConstants.autofollowThresholdKey) ?? 7;

  @override
  int get completedRaces =>
      sharedPreferences.getInt(PrefConstants.completedRacesKey) ?? 0;

  @override
  String get selectedBooks =>
      sharedPreferences.getString(PrefConstants.selectedBooksKey) ?? '';

  @override
  bool get isDataLoaded =>
      sharedPreferences.getBoolean(PrefConstants.dataLoadedCheckKey) ?? false;

  @override
  bool get autofollowThresholdBelowAsk =>
      sharedPreferences
          .getBoolean(PrefConstants.autofollowThresholdBelowAskKey) ??
      true;

  @override
  bool get isCurrentGameTour =>
      sharedPreferences.getBoolean(PrefConstants.isCurrentGameTourKey) ?? false;

  @override
  bool get isCurrentGameCareer =>
      sharedPreferences.getBoolean(PrefConstants.isCurrentGameCareerKey) ??
      false;

  @override
  bool get autofollowThresholdAboveAsk =>
      sharedPreferences
          .getBoolean(PrefConstants.autofollowThresholdAboveAskKey) ??
      true;

  AppLocalStorage(this.authStorage, this.sharedPreferences);

  @override
  Future<bool> checkForNewInstallation() async {
    final result =
        sharedPreferences.getBoolean(PrefConstants.uninstallCheckKey);
    if (result != null) return false;
    await sharedPreferences.saveBoolean(
        key: PrefConstants.uninstallCheckKey, value: true);
    await authStorage.clear();
    return true;
  }

  @override
  Future<bool> checkIfDataIsLoaded() async {
    final result =
        sharedPreferences.getBoolean(PrefConstants.dataLoadedCheckKey);
    if (result != null) return false;
    return true;
  }

  @override
  Future<void> updateThemeMode(ThemeMode themeMode) async {
    await sharedPreferences.saveString(
        key: PrefConstants.appearanceThemeKey, value: themeMode.toString());
  }

  @override
  ThemeMode getThemeMode() {
    final themeString =
        sharedPreferences.getString(PrefConstants.appearanceThemeKey);
    final theme =
        ThemeMode.values.find((element) => element.toString() == themeString);
    return theme ?? ThemeMode.system;
  }

  @override
  set autofollowThreshold(int value) => sharedPreferences.saveInt(
      key: PrefConstants.autofollowThresholdKey, value: value);

  @override
  set completedRaces(int value) => sharedPreferences.saveInt(
      key: PrefConstants.completedRacesKey, value: value);

  @override
  set autofollowThresholdBelowAsk(bool value) => sharedPreferences.saveBoolean(
      key: PrefConstants.autofollowThresholdBelowAskKey, value: value);

  @override
  set isCurrentGameTour(bool value) => sharedPreferences.saveBoolean(
      key: PrefConstants.isCurrentGameTourKey, value: value);

  @override
  set isCurrentGameCareer(bool value) => sharedPreferences.saveBoolean(
      key: PrefConstants.isCurrentGameCareerKey, value: value);

  @override
  set autofollowThresholdAboveAsk(bool value) => sharedPreferences.saveBoolean(
      key: PrefConstants.autofollowThresholdAboveAskKey, value: value);

  @override
  void clearData() {
    sharedPreferences.removeValue(key: PrefConstants.tourResultsKey);
    sharedPreferences.removeValue(key: PrefConstants.playSettingsKey);
    sharedPreferences.removeValue(key: PrefConstants.completedRacesKey);
  }

  @override
  void setPreferenceBool(String settingsKey, bool settingsValue) {
    if (!settingsValue) {
      sharedPreferences.deleteKey(settingsKey);
      return;
    }
    sharedPreferences.saveBoolean(key: settingsKey, value: settingsValue);
  }

  @override
  void setPreferenceInt(String settingsKey, int settingsValue) {
    if (settingsValue.isNegative) {
      sharedPreferences.deleteKey(settingsKey);
      return;
    }
    sharedPreferences.saveInt(key: settingsKey, value: settingsValue);
  }

  @override
  void setPreferenceString(String settingsKey, String settingsValue) {
    if (settingsValue.isEmpty) {
      sharedPreferences.deleteKey(settingsKey);
      return;
    }
    sharedPreferences.saveString(key: settingsKey, value: settingsValue);
  }

  @override
  int get eventsCompleted =>
      sharedPreferences.getInt(PrefConstants.eventsCompletedKey) ?? 0;

  @override
  set eventsCompleted(int value) => sharedPreferences.saveInt(
      key: PrefConstants.eventsCompletedKey, value: value);
}
