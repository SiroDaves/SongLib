import 'dart:convert';

import 'package:desktop_multi_window/desktop_multi_window.dart';
import 'package:flutter/material.dart';
import 'package:window_manager/window_manager.dart';

import 'app_main_window.dart';
import 'app_sub_window.dart';
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

  if (args.firstOrNull == 'multi_window') {
    final windowId = int.parse(args[1]);
    final argument = args[2].isEmpty
        ? const {}
        : jsonDecode(args[2]) as Map<String, dynamic>;
    runApp(AppSubWindow(
      windowController: WindowController.fromWindowId(windowId),
      args: argument,
    ));
  } else {
    runApp(const AppMainWindow());
  }
}
