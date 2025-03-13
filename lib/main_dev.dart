import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

import 'app.dart';
import 'core/utils/app_util.dart';
import 'core/utils/env/flavor_config.dart';
import 'core/utils/env/environments.dart';
import 'core/di/injectable.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlavorConfig(
    flavor: Flavor.develop,
    name: 'DEV',
    color: Colors.red,
    values: const FlavorValues(
      logNetworkInfo: true,
      showFullErrorMessages: true,
    ),
  );
  logger('Starting app from main_dev.dart');
  await configureDependencies(Environments.develop);

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

  runApp(const MyApp());
}
