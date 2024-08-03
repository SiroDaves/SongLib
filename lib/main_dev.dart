import 'package:flutter/material.dart';

import 'app.dart';
import 'bootstrap.dart';
import 'common/utils/app_util.dart';
import 'common/utils/env/environments.dart';
import 'common/utils/env/flavor_config.dart';
import 'core/di/injectable.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  FlavorConfig(
    flavor: Flavor.development,
    name: 'DEV',
    color: Colors.transparent,
    values: const FlavorValues(
      logNetworkInfo: false,
      showFullErrorMessages: false,
    ),
  );
  logger('Starting app from main_dev.dart');
  await configureDependencies(Environments.development);

  await bootstrap(() => const MyApp());
}
