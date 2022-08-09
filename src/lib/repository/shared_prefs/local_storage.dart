import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

import '../../model/data/enums.dart';
import '../../widget_game/data/play_settings.dart';
import '../../widget_game/data/results.dart';
import '../secure_storage/auth_storage.dart';

@lazySingleton
abstract class LocalStorage {
  @factoryMethod
  factory LocalStorage(AuthStorage storage, SharedPreferenceStorage preferences) = AppLocalStorage;

  int get autofollowThreshold;

  int get toursFinished;

  int get completedRaces;

  bool get autofollowThresholdBelowAsk;

  bool get isCurrentGameTour;

  bool get isCurrentGameCareer;

  bool get autofollowThresholdAboveAsk;

  String get selectedBooks;

  CyclistMovementType get cyclistMovement;

  CameraMovementType get cameraMovement;

  DifficultyType get difficulty;

  Results? get tourResults;

  PlaySettings? get playSettings;

  Set<TutorialType> get typesViewed;

  Map<int, String> get cyclistNames;

  set autofollowThreshold(int value);

  set autofollowThresholdBelowAsk(bool value);

  set isCurrentGameTour(bool value);

  set isCurrentGameCareer(bool value);

  set autofollowThresholdAboveAsk(bool value);

  set cyclistMovement(CyclistMovementType value);

  set cameraMovement(CameraMovementType value);

  set difficulty(DifficultyType value);

  set typesViewed(Set<TutorialType> value);

  set toursFinished(int value);

  set completedRaces(int value);

  Future<bool> checkForNewInstallation();

  Future<bool> isDataLoaded();

  ThemeMode getThemeMode();

  Future<void> updateThemeMode(ThemeMode themeMode);

  void setCyclistNames(Map<int, String> names);

  void setTourResults(Results results);

  void clearTour();

  void setPreferenceBool(String settingsKey, bool settingsValue);
  void setPreferenceInt(String settingsKey, int settingsValue);
  void setPreferenceString(String settingsKey, String settingsValue);

  void setPlaySettings(PlaySettings? playSettings);

  int get eventsCompleted;

  set eventsCompleted(int value);
}

class AppLocalStorage implements LocalStorage {
  static const uninstallCheckKey = 'uninstallCheck';
  static const dataLoadedCheckKey = 'dataLoadedCheck';
  static const selectedBooksKey = 'selectedBooksKey';
  static const appearanceThemeKey = 'appearanceTheme';
  static const autofollowThresholdKey = 'autofollowThreshold';
  static const autofollowThresholdBelowAskKey = 'autofollowThresholdBelowAsk';
  static const autofollowThresholdAboveAskKey = 'autofollowThresholdAboveAsk';
  static const cyclistNamesKey = 'cyclistNames';
  static const cyclistMovementKey = 'cyclistMovement';
  static const cameraMovementKey = 'cameraMovement';
  static const difficultyKey = 'difficulty';
  static const toursFinishedKey = 'toursFinished';
  static const typesViewedKey = 'typesViewed';
  static const tourResultsKey = 'tourResults';
  static const playSettingsKey = 'playSettings';
  static const eventsCompletedKey = 'eventsCompleted';
  static const completedRacesKey = 'completedRaces';
  static const isCurrentGameTourKey = 'isCurrentGameTour';
  static const isCurrentGameCareerKey = 'isCurrentGameCareer';

  final AuthStorage authStorage;
  final SharedPreferenceStorage sharedPreferences;

  @override
  int get autofollowThreshold => sharedPreferences.getInt(autofollowThresholdKey) ?? 7;

  @override
  int get completedRaces => sharedPreferences.getInt(completedRacesKey) ?? 0;

  @override
  String get selectedBooks => sharedPreferences.getString(selectedBooksKey) ?? '';
  
  @override
  bool get autofollowThresholdBelowAsk => sharedPreferences.getBoolean(autofollowThresholdBelowAskKey) ?? true;

  @override
  bool get isCurrentGameTour => sharedPreferences.getBoolean(isCurrentGameTourKey) ?? false;

  @override
  bool get isCurrentGameCareer => sharedPreferences.getBoolean(isCurrentGameCareerKey) ?? false;

  @override
  bool get autofollowThresholdAboveAsk => sharedPreferences.getBoolean(autofollowThresholdAboveAskKey) ?? true;

  @override
  CyclistMovementType get cyclistMovement {
    final value = sharedPreferences.getString(cyclistMovementKey) ?? '';
    return CyclistMovementType.values.firstWhereOrNull((element) => element.toString() == value) ?? CyclistMovementType.normal;
  }

  @override
  CameraMovementType get cameraMovement {
    final value = sharedPreferences.getString(cameraMovementKey) ?? '';
    return CameraMovementType.values.firstWhereOrNull((element) => element.toString() == value) ?? CameraMovementType.auto;
  }

  @override
  DifficultyType get difficulty {
    final value = sharedPreferences.getString(difficultyKey) ?? '';
    return DifficultyType.values.firstWhereOrNull((element) => element.toString() == value) ?? DifficultyType.normal;
  }

  @override
  Results? get tourResults {
    final value = sharedPreferences.getString(tourResultsKey);
    if (value == null) return null;
    final jerseys = value.split(',');
    return Results(ResultsType.combined, null, int.tryParse(jerseys[0]), int.tryParse(jerseys[1]), int.tryParse(jerseys[2]));
  }

  @override
  Map<int, String> get cyclistNames =>
      sharedPreferences.getString(cyclistNamesKey)?.split(',').asMap().map((key, value) {
        final element = value.split('.');
        return MapEntry(int.parse(element[0]), utf8.decode(base64Decode(element[1])));
      }) ??
      {};

  @override
  PlaySettings? get playSettings {
    final settings = sharedPreferences.getString(playSettingsKey);
    if (settings == null) return null;
    return PlaySettings.fromJson(settings);
  }

  AppLocalStorage(this.authStorage, this.sharedPreferences);

  @override
  Future<bool> checkForNewInstallation() async {
    final result = sharedPreferences.getBoolean(uninstallCheckKey);
    if (result != null) return false;
    await sharedPreferences.saveBoolean(key: uninstallCheckKey, value: true);
    await authStorage.clear();
    return true;
  }

  @override
  Future<bool> isDataLoaded() async {
    final result = sharedPreferences.getBoolean(dataLoadedCheckKey);
    if (result != null) return false;
    return true;
  }

  @override
  Future<void> updateThemeMode(ThemeMode themeMode) async {
    await sharedPreferences.saveString(key: appearanceThemeKey, value: themeMode.toString());
  }

  @override
  ThemeMode getThemeMode() {
    final themeString = sharedPreferences.getString(appearanceThemeKey);
    final theme = ThemeMode.values.find((element) => element.toString() == themeString);
    return theme ?? ThemeMode.system;
  }

  @override
  set autofollowThreshold(int value) => sharedPreferences.saveInt(key: autofollowThresholdKey, value: value);

  @override
  set completedRaces(int value) => sharedPreferences.saveInt(key: completedRacesKey, value: value);

  @override
  set autofollowThresholdBelowAsk(bool value) => sharedPreferences.saveBoolean(key: autofollowThresholdBelowAskKey, value: value);

  @override
  set isCurrentGameTour(bool value) => sharedPreferences.saveBoolean(key: isCurrentGameTourKey, value: value);

  @override
  set isCurrentGameCareer(bool value) => sharedPreferences.saveBoolean(key: isCurrentGameCareerKey, value: value);

  @override
  set autofollowThresholdAboveAsk(bool value) => sharedPreferences.saveBoolean(key: autofollowThresholdAboveAskKey, value: value);

  @override
  set cyclistMovement(CyclistMovementType value) => sharedPreferences.saveString(key: cyclistMovementKey, value: value.toString());

  @override
  set cameraMovement(CameraMovementType value) => sharedPreferences.saveString(key: cameraMovementKey, value: value.toString());

  @override
  set difficulty(DifficultyType value) => sharedPreferences.saveString(key: difficultyKey, value: value.toString());

  @override
  int get toursFinished => sharedPreferences.getInt(toursFinishedKey) ?? 0;

  @override
  Set<TutorialType> get typesViewed =>
      sharedPreferences.getString(typesViewedKey)?.split(',').map((e) => TutorialType.values.firstWhere((element) => element.toString() == e)).toSet() ?? <TutorialType>{};

  @override
  set toursFinished(int value) => sharedPreferences.saveInt(key: toursFinishedKey, value: value);

  @override
  set typesViewed(Set<TutorialType> value) => sharedPreferences.saveString(key: typesViewedKey, value: value.map((e) => e.toString()).join(','));

  @override
  void setCyclistNames(Map<int, String> names) {
    final encodedNames = names.entries.map((e) => '${e.key}.${base64Encode(utf8.encode(e.value))}').join(',');
    sharedPreferences.saveString(key: cyclistNamesKey, value: encodedNames);
  }

  @override
  void setTourResults(Results results) {
    sharedPreferences.saveString(key: tourResultsKey, value: '${results.whiteJersey},${results.greenJersey},${results.bouledJersey}');
  }

  @override
  void clearTour() {
    sharedPreferences.removeValue(key: tourResultsKey);
    sharedPreferences.removeValue(key: playSettingsKey);
    sharedPreferences.removeValue(key: completedRacesKey);
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
  void setPlaySettings(PlaySettings? settings) {
    if (settings == null) {
      sharedPreferences.deleteKey(playSettingsKey);
      return;
    }
    sharedPreferences.saveString(key: playSettingsKey, value: settings.toJson());
  }

  @override
  int get eventsCompleted => sharedPreferences.getInt(eventsCompletedKey) ?? 0;

  @override
  set eventsCompleted(int value) => sharedPreferences.saveInt(key: eventsCompletedKey, value: value);
  
}
