import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:workmanager/workmanager.dart';

import 'model/general/notify.dart';
import 'navigator/main_navigator.dart';
import 'theme/theme_data.dart';
import 'util/constants/api_constants.dart';
import 'util/env/flavor_config.dart';
import 'util/locale/localization_delegate.dart';
import 'util/locale/localization_fallback_cupertino_delegate.dart';
import 'viewmodel/global_vm.dart';
import 'webservice/notify/notify_web_service.dart';
import 'widget/provider/provider_widget.dart';

//this is the name given to the background fetch
const simplePeriodicTask = "simplePeriodicTask";
// flutter local notification setup
void showNotification(Notify notify, flp) async {
  const android = AndroidNotificationDetails(
    'songlib2022',
    'SongLib Announcements',
    channelDescription: 'Important brodcasts to the user',
    priority: Priority.high,
    importance: Importance.max,
  );
  const iOS = DarwinNotificationDetails();
  const platform = NotificationDetails(android: android, iOS: iOS);
  await flp.show(
    0,
    notify.title,
    notify.message,
    platform,
    payload: notify.title,
  );
}

void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    final FlutterLocalNotificationsPlugin flp =
        FlutterLocalNotificationsPlugin();
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iOS = DarwinInitializationSettings();
    const initSetttings = InitializationSettings(android: android, iOS: iOS);
    await flp.initialize(initSetttings);

    final NotifyWebService api = NotifyWebService();

    final List<Notify> notifys = await api.fetchNotifys();
    if (notifys.isNotEmpty) {
      //for (final notify in notifys) {}
      showNotification(notifys[0], flp);
    }
    return Future.value(true);
  });
}

void startApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
  await Workmanager().registerPeriodicTask(
    "haveFaith",
    simplePeriodicTask,
    existingWorkPolicy: ExistingWorkPolicy.replace,
    frequency: const Duration(minutes: 15),
    initialDelay: const Duration(seconds: 5),
    constraints: Constraints(networkType: NetworkType.connected),
  );

  await Parse().initialize(
    ApiConstants.applicationID,
    ApiConstants.parseApiUrl,
    clientKey: ApiConstants.clientKey,
    autoSendSessionId: true,
  );

  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://704a7eba4e654566beb30a98e786da51@o1365314.ingest.sentry.io/6660908';
      options.tracesSampleRate = 1.0;
    },
    appRunner: () => runApp(const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const InternalApp();
  }
}

class InternalApp extends StatelessWidget {
  final Widget? home;

  const InternalApp({Key? key})
      : home = null,
        super(key: key);

  @visibleForTesting
  const InternalApp.test({required this.home, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<GlobalVm>(
      lazy: FlavorConfig.isInTest(),
      create: () => GetIt.I()..init(context),
      consumer: (context, viewModel, consumerChild) => MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          viewModel.localeDelegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          FallbackCupertinoLocalisationsDelegate.delegate,
        ],
        locale: viewModel.locale,
        supportedLocales: LocalizationDelegate.supportedLocales,
        themeMode: viewModel.themeMode,
        theme: SongLibThemeData.lightTheme(viewModel.targetPlatform),
        darkTheme: SongLibThemeData.darkTheme(viewModel.targetPlatform),
        navigatorKey: MainNavigatorWidgetState.navigationKey,
        initialRoute:
            home == null ? MainNavigatorWidgetState.initialRoute : null,
        onGenerateRoute: MainNavigatorWidgetState.onGenerateRoute,
        navigatorObservers: MainNavigatorWidgetState.navigatorObservers,
        builder: home == null
            ? (context, child) => MainNavigatorWidget(child: child)
            : null,
        home: home,
      ),
    );
  }
}
