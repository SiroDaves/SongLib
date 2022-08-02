import 'package:flutter/material.dart';
import 'package:songlib/app.dart';
import 'package:songlib/di/environments.dart';
import 'package:songlib/di/injectable.dart';
import 'package:songlib/main_common.dart';
import 'package:songlib/util/env/flavor_config.dart';
import 'package:songlib/util/inspector/database_inspector.dart';
import 'package:songlib/util/inspector/local_storage_inspector.dart';
import 'package:songlib/util/inspector/niddler.dart';

Future<void> main() async {
  await wrapMain(() async {
    await initNiddler();
    const values = FlavorValues(
      baseUrl: 'https://jsonplaceholder.typicode.com/',
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

    runApp(const MyApp());
  });
}
