import 'package:flutter/material.dart';
import 'package:songlib/app.dart';
import 'package:songlib/architecture.dart';
import 'package:songlib/di/environments.dart';
import 'package:songlib/di/injectable.dart';
import 'package:songlib/main_common.dart';
import 'package:songlib/util/env/flavor_config.dart';

Future<void> main() async {
  await wrapMain(() async {
    await initArchitecture();
    const values = FlavorValues(
      baseUrl: 'https://jsonplaceholder.typicode.com/',
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
    runApp(const MyApp());
  });
}
