import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';
import 'package:workmanager/workmanager.dart';

import '../repository/shared_prefs/local_storage.dart';
import '../util/constants/app_constants.dart';
import '../util/constants/pref_constants.dart';
import '../util/services/background_fetch.dart';

@injectable
class SplashVm with ChangeNotifierEx {
  final LocalStorage localStorage;
  bool isLoaded = false, onBoarded = false, notificationsEnabled = false;
  late final SplashNavigator navigator;

  SplashVm(this.localStorage);

  Future<void> init(SplashNavigator screenNavigator) async {
    navigator = screenNavigator;
    isLoaded = localStorage.getPrefBool(PrefConstants.dataLoadedCheckKey);
    onBoarded = localStorage.getPrefBool(PrefConstants.onboardedCheckKey);

    await Future.delayed(const Duration(seconds: 3), () {});
    await nextActions();
  }

  Future<void> nextActions() async {
    if (isLoaded) {
      if (onBoarded) {
        navigator.goToHome();
      } else {
        navigator.goToOnboarding();
      }
    } else {
      navigator.goToSelection();
    }
  }
}

abstract class SplashNavigator {
  void goToUiTest();
  void goToHome();
  void goToOnboarding();
  void goToSelection();
}
