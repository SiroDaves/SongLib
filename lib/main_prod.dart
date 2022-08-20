import 'package:flutter/material.dart';

import 'app.dart';
import 'architecture.dart';
import 'di/environments.dart';
import 'di/injectable.dart';
import 'main_common.dart';
import 'util/env/flavor_config.dart';

Future<void> main() async {
  await wrapMain(() async {
    await initArchitecture();
    const values = FlavorValues(
      logNetworkInfo: false,
      showFullErrorMessages: false,
    );
    FlavorConfig(
      flavor: Flavor.prod,
      name: 'PROD',
      color: Colors.transparent,
      values: values,
    );
    await configureDependencies(Environments.prod);
    startApp();
  });
}
