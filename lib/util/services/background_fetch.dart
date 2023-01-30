import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:workmanager/workmanager.dart';

import '../../model/general/notifycation.dart';
import '../../model/general/received_notification.dart';
import '../../webservice/notifycation_web_service.dart';
import '../constants/api_constants.dart';
import '../constants/app_constants.dart';

int id = 0;

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

final StreamController<ReceivedNotification> didReceiveLocalNotificationStream =
    StreamController<ReceivedNotification>.broadcast();

final StreamController<String?> selectNotificationStream =
    StreamController<String?>.broadcast();

const MethodChannel platform =
    MethodChannel('dexterx.dev/flutter_local_notifications_example');

const String portName = 'notification_send_port';

String? selectedNotificationPayload;

/// A notification action which triggers a url launch event
const String urlLaunchActionId = 'id_1';

/// A notification action which triggers a App navigation event
const String navigationActionId = 'id_3';

/// Defines a iOS/MacOS notification category for text input actions.
const String darwinNotificationCategoryText = 'textCategory';

/// Defines a iOS/MacOS notification category for plain actions.
const String darwinNotificationCategoryPlain = 'plainCategory';
const AndroidNotificationDetails androidNotificationDetails =
    AndroidNotificationDetails(
  'songlib2022',
  'SongLib Announcements',
  channelDescription: 'Important brodcasts to the user',
  icon: 'notify',
  sound: RawResourceAndroidNotificationSound('slow_spring_board'),
);

const AndroidNotificationDetails androidRemindersN = AndroidNotificationDetails(
  AppConstants.songLibReminders,
  AppConstants.songLibRemindersN,
  icon: 'notify',
  sound: RawResourceAndroidNotificationSound('slow_spring_board'),
  actions: <AndroidNotificationAction>[
    AndroidNotificationAction(
      'NotifyAction1',
      'DONATE',
      showsUserInterface: true,
      cancelNotification: false,
    ),
    AndroidNotificationAction(
      'NotifyAction2',
      'BUY T-SHIRT',
      showsUserInterface: true,
      cancelNotification: false,
    ),
  ],
);

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    await Parse().initialize(
      ApiConstants.applicationID,
      ApiConstants.parseApiUrl,
      clientKey: ApiConstants.clientKey,
      autoSendSessionId: true,
    );

    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iOS = DarwinInitializationSettings();
    const initSetttings = InitializationSettings(android: android, iOS: iOS);
    await flutterLocalNotificationsPlugin.initialize(initSetttings);

    switch (task) {
      case AppConstants.getNotifycations:
        final NotifycationWebService api = NotifycationWebService();
        final List<Notifycation> notifycations = await api.fetchNotifycations();
        if (notifycations.isNotEmpty) {
          showNotification(notifycations[0], flutterLocalNotificationsPlugin);
        }
        break;
    }

    return Future.value(true);
  });
}

void showNotification(Notifycation notifycation, flp) async {
  const DarwinNotificationDetails darwinNotificationDetails =
      DarwinNotificationDetails(sound: 'sound/slow_spring_board.aiff');
  final LinuxNotificationDetails linuxPlatformChannelSpecifics =
      LinuxNotificationDetails(
    sound: AssetsLinuxSound('assets/sound/slow_spring_board.mp3'),
  );
  final NotificationDetails notificationDetails = NotificationDetails(
    android: androidNotificationDetails,
    iOS: darwinNotificationDetails,
    macOS: darwinNotificationDetails,
    linux: linuxPlatformChannelSpecifics,
  );
  await flutterLocalNotificationsPlugin.show(
    id++,
    notifycation.title,
    notifycation.message,
    notificationDetails,
  );
}
