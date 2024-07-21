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
    flavor: Flavor.prod,
    name: 'PROD',
    color: Colors.transparent,
    values: const FlavorValues(
      logNetworkInfo: false,
      showFullErrorMessages: false,
    ),
  );
  logger('Starting app from main_prod.dart');
  await configureDependencies(Environments.prod);

  runApp(const MyApp());
}
