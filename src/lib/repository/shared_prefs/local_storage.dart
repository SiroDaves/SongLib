import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

import '../../model/data/enums.dart';
import '../../util/constants/pref_constants.dart';
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

  bool get isDataLoaded;

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

  Future<bool> checkIfDataIsLoaded();

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

  final AuthStorage authStorage;
  final SharedPreferenceStorage sharedPreferences;

  @override
  int get autofollowThreshold => sharedPreferences.getInt(PrefConstants.autofollowThresholdKey) ?? 7;

  @override
  int get completedRaces => sharedPreferences.getInt(PrefConstants.completedRacesKey) ?? 0;

  @override
  String get selectedBooks => sharedPreferences.getString(PrefConstants.selectedBooksKey) ?? '';
  
  @override
  bool get isDataLoaded => sharedPreferences.getBoolean(PrefConstants.dataLoadedCheckKey) ?? false;

  @override
  bool get autofollowThresholdBelowAsk => sharedPreferences.getBoolean(PrefConstants.autofollowThresholdBelowAskKey) ?? true;

  @override
  bool get isCurrentGameTour => sharedPreferences.getBoolean(PrefConstants.isCurrentGameTourKey) ?? false;

  @override
  bool get isCurrentGameCareer => sharedPreferences.getBoolean(PrefConstants.isCurrentGameCareerKey) ?? false;

  @override
  bool get autofollowThresholdAboveAsk => sharedPreferences.getBoolean(PrefConstants.autofollowThresholdAboveAskKey) ?? true;

  @override
  CyclistMovementType get cyclistMovement {
    final value = sharedPreferences.getString(PrefConstants.cyclistMovementKey) ?? '';
    return CyclistMovementType.values.firstWhereOrNull((element) => element.toString() == value) ?? CyclistMovementType.normal;
  }

  @override
  CameraMovementType get cameraMovement {
    final value = sharedPreferences.getString(PrefConstants.cameraMovementKey) ?? '';
    return CameraMovementType.values.firstWhereOrNull((element) => element.toString() == value) ?? CameraMovementType.auto;
  }

  @override
  DifficultyType get difficulty {
    final value = sharedPreferences.getString(PrefConstants.difficultyKey) ?? '';
    return DifficultyType.values.firstWhereOrNull((element) => element.toString() == value) ?? DifficultyType.normal;
  }

  @override
  Results? get tourResults {
    final value = sharedPreferences.getString(PrefConstants.tourResultsKey);
    if (value == null) return null;
    final jerseys = value.split(',');
    return Results(ResultsType.combined, null, int.tryParse(jerseys[0]), int.tryParse(jerseys[1]), int.tryParse(jerseys[2]));
  }

  @override
  Map<int, String> get cyclistNames =>
      sharedPreferences.getString(PrefConstants.cyclistNamesKey)?.split(',').asMap().map((key, value) {
        final element = value.split('.');
        return MapEntry(int.parse(element[0]), utf8.decode(base64Decode(element[1])));
      }) ??
      {};

  @override
  PlaySettings? get playSettings {
    final settings = sharedPreferences.getString(PrefConstants.playSettingsKey);
    if (settings == null) return null;
    return PlaySettings.fromJson(settings);
  }

  AppLocalStorage(this.authStorage, this.sharedPreferences);

  @override
  Future<bool> checkForNewInstallation() async {
    final result = sharedPreferences.getBoolean(PrefConstants.uninstallCheckKey);
    if (result != null) return false;
    await sharedPreferences.saveBoolean(key: PrefConstants.uninstallCheckKey, value: true);
    await authStorage.clear();
    return true;
  }

  @override
  Future<bool> checkIfDataIsLoaded() async {
    final result = sharedPreferences.getBoolean(PrefConstants.dataLoadedCheckKey);
    if (result != null) return false;
    return true;
  }

  @override
  Future<void> updateThemeMode(ThemeMode themeMode) async {
    await sharedPreferences.saveString(key: PrefConstants.appearanceThemeKey, value: themeMode.toString());
  }

  @override
  ThemeMode getThemeMode() {
    final themeString = sharedPreferences.getString(PrefConstants.appearanceThemeKey);
    final theme = ThemeMode.values.find((element) => element.toString() == themeString);
    return theme ?? ThemeMode.system;
  }

  @override
  set autofollowThreshold(int value) => sharedPreferences.saveInt(key: PrefConstants.autofollowThresholdKey, value: value);

  @override
  set completedRaces(int value) => sharedPreferences.saveInt(key: PrefConstants.completedRacesKey, value: value);

  @override
  set autofollowThresholdBelowAsk(bool value) => sharedPreferences.saveBoolean(key: PrefConstants.autofollowThresholdBelowAskKey, value: value);

  @override
  set isCurrentGameTour(bool value) => sharedPreferences.saveBoolean(key: PrefConstants.isCurrentGameTourKey, value: value);

  @override
  set isCurrentGameCareer(bool value) => sharedPreferences.saveBoolean(key: PrefConstants.isCurrentGameCareerKey, value: value);

  @override
  set autofollowThresholdAboveAsk(bool value) => sharedPreferences.saveBoolean(key: PrefConstants.autofollowThresholdAboveAskKey, value: value);

  @override
  set cyclistMovement(CyclistMovementType value) => sharedPreferences.saveString(key: PrefConstants.cyclistMovementKey, value: value.toString());

  @override
  set cameraMovement(CameraMovementType value) => sharedPreferences.saveString(key: PrefConstants.cameraMovementKey, value: value.toString());

  @override
  set difficulty(DifficultyType value) => sharedPreferences.saveString(key: PrefConstants.difficultyKey, value: value.toString());

  @override
  int get toursFinished => sharedPreferences.getInt(PrefConstants.toursFinishedKey) ?? 0;

  @override
  Set<TutorialType> get typesViewed =>
      sharedPreferences.getString(PrefConstants.typesViewedKey)?.split(',').map((e) => TutorialType.values.firstWhere((element) => element.toString() == e)).toSet() ?? <TutorialType>{};

  @override
  set toursFinished(int value) => sharedPreferences.saveInt(key: PrefConstants.toursFinishedKey, value: value);

  @override
  set typesViewed(Set<TutorialType> value) => sharedPreferences.saveString(key: PrefConstants.typesViewedKey, value: value.map((e) => e.toString()).join(','));

  @override
  void setCyclistNames(Map<int, String> names) {
    final encodedNames = names.entries.map((e) => '${e.key}.${base64Encode(utf8.encode(e.value))}').join(',');
    sharedPreferences.saveString(key: PrefConstants.cyclistNamesKey, value: encodedNames);
  }

  @override
  void setTourResults(Results results) {
    sharedPreferences.saveString(key: PrefConstants.tourResultsKey, value: '${results.whiteJersey},${results.greenJersey},${results.bouledJersey}');
  }

  @override
  void clearTour() {
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
  void setPlaySettings(PlaySettings? settings) {
    if (settings == null) {
      sharedPreferences.deleteKey(PrefConstants.playSettingsKey);
      return;
    }
    sharedPreferences.saveString(key: PrefConstants.playSettingsKey, value: settings.toJson());
  }

  @override
  int get eventsCompleted => sharedPreferences.getInt(PrefConstants.eventsCompletedKey) ?? 0;

  @override
  set eventsCompleted(int value) => sharedPreferences.saveInt(key: PrefConstants.eventsCompletedKey, value: value);
  
}
