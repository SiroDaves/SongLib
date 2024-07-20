import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

import 'app.dart';
import 'common/utils/env/flavor_config.dart';
import 'common/utils/logger.dart';
import 'common/utils/env/environments.dart';
import 'di/injectable.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();

  await windowManager.ensureInitialized();
  WindowOptions windowOptions = const WindowOptions(center: true);
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  FlavorConfig(
    flavor: Flavor.uat,
    name: 'UAT',
    color: Colors.transparent,
    values: const FlavorValues(
      logNetworkInfo: false,
      showFullErrorMessages: false,
    ),
  );
  logger('Starting app from main_uat.dart');
  await configureDependencies(Environments.uat);

  runApp(const MyApp());
}
