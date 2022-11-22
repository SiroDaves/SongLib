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

    await isAndroidPermissionGranted();
    await requestPermissions();
    configureSelectNotificationSubject();
    await nextActions();
  }

  Future<void> isAndroidPermissionGranted() async {
    if (Platform.isAndroid) {
      final bool granted = await flutterLocalNotificationsPlugin
              .resolvePlatformSpecificImplementation<
                  AndroidFlutterLocalNotificationsPlugin>()
              ?.areNotificationsEnabled() ??
          false;

      notificationsEnabled = granted;
    }
  }

  Future<void> requestPermissions() async {
    if (Platform.isIOS || Platform.isMacOS) {
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
            critical: true,
          );
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              MacOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
            critical: true,
          );
    } else if (Platform.isAndroid) {
      final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
          flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>();

      final bool? granted = await androidImplementation?.requestPermission();
      notificationsEnabled = granted ?? false;
      notifyListeners();
    }
  }


  void configureSelectNotificationSubject() {
    selectNotificationStream.stream.listen((String? payload) async {
      /*await Navigator.of(context).push(MaterialPageRoute<void>(
        builder: (BuildContext context) => SecondPage(payload),
      ));*/
    });
  }

  Future<void> nextActions() async {
    await Workmanager().initialize(callbackDispatcher);
    await Workmanager().registerPeriodicTask(
      AppConstants.getNotifycations,
      AppConstants.getNotifycations,
      frequency: const Duration(minutes: 1),
      existingWorkPolicy: ExistingWorkPolicy.replace,
    );

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
