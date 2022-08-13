import 'package:flutter/material.dart';

import 'app.dart';
import 'di/environments.dart';
import 'di/injectable.dart';
import 'main_common.dart';
import 'util/env/flavor_config.dart';
import 'util/inspector/database_inspector.dart';
import 'util/inspector/local_storage_inspector.dart';
import 'util/inspector/niddler.dart';

Future<void> main() async {
  await wrapMain(() async {
    await initNiddler();
    const values = FlavorValues(
      logNetworkInfo: true,
      showFullErrorMessages: true,
    );
    FlavorConfig(
      flavor: Flavor.dev,
      name: 'DEV',
      color: Colors.red,
      values: values,
    );
    // ignore: avoid_print
    print('Starting app from main.dart');
    await configureDependencies(Environments.dev);
    await addDatabaseInspector();
    await initAllStorageInspectors();

    startApp();
  });
}
