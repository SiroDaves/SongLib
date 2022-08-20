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
      flavor: Flavor.beta,
      name: 'BETA',
      color: Colors.blue,
      values: values,
    );
    await configureDependencies(Environments.prod);
    startApp();
  });
}
