import 'package:flutter/material.dart';

import 'app.dart';
import 'di/environments.dart';
import 'di/injectable.dart';
import 'main_common.dart';
import 'util/env/flavor_config.dart';

Future<void> main() async {
  await wrapMain(() async {
    const values = FlavorValues(
      logNetworkInfo: false,
      showFullErrorMessages: true,
    );
    FlavorConfig(
      flavor: Flavor.dummy,
      name: 'DUMMY',
      color: Colors.purple,
      values: values,
    );
    // ignore: avoid_print
    print('Starting app from main_dummy.dart');
    await configureDependencies(Environments.dummy);
    startApp();
  });
}
