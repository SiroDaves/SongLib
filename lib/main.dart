import 'dart:io';

import 'package:flutter/material.dart';
//import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:window_manager/window_manager.dart';

import 'app.dart';
import 'core/di/injectable.dart';
import 'core/utils/app_util.dart';
import 'core/utils/env/environments.dart';
import 'core/utils/env/flavor_config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlavorConfig(
    flavor: Flavor.production,
    name: 'PROD',
    color: Colors.transparent,
    values: const FlavorValues(
      logNetworkInfo: false,
      showFullErrorMessages: false,
    ),
  );
  logger('Starting app from main.dart');
  await configureDependencies(Environments.production);

  if (!Platform.isAndroid && !Platform.isIOS && !Platform.isFuchsia) {
    await windowManager.ensureInitialized();
    WindowOptions windowOptions = const WindowOptions(
      fullScreen: false,
      alwaysOnTop: false,
      titleBarStyle: TitleBarStyle.normal,
    );

    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.maximize();
      await windowManager.show();
    });
  }

  /*await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://3fe2721bbfa7a1184eb24a8241a58822@o1365314.ingest.us.sentry.io/4507672351014912';
      options.tracesSampleRate = 1.0;
      options.profilesSampleRate = 1.0;
    },
    appRunner: () => runApp(const MyApp()),
  );*/

  runApp(const MyApp());
}
