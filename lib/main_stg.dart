import 'package:flutter/material.dart';

import 'app.dart';
import 'common/utils/env/flavor_config.dart';
import 'common/utils/logger.dart';
import 'common/utils/env/environments.dart';
import 'di/injectable.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  FlavorConfig(
    flavor: Flavor.staging,
    name: 'STG',
    color: Colors.transparent,
    values: const FlavorValues(
      logNetworkInfo: false,
      showFullErrorMessages: false,
    ),
  );
  
  logger('Starting app from main_uat.dart');
  await configureDependencies(Environments.staging);

  runApp(const MyApp());
}
