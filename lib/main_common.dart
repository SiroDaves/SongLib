import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:icapps_architecture/icapps_architecture.dart';

import 'architecture.dart';
import 'util/web/app_configurator.dart' if (dart.library.html) 'util/web/app_configurator_web.dart';

FutureOr<R>? wrapMain<R>(FutureOr<R> Function() appCode) {
  return runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    configureWebApp();
    await initArchitecture();

    return await appCode();
  }, (object, trace) {
    try {
      WidgetsFlutterBinding.ensureInitialized();
    } catch (_) {}

    try {
      staticLogger.e('Zone error', error: object, trace: trace);
    } catch (_) {
      // ignore: avoid_print
      print(object);
      // ignore: avoid_print
      print(trace);
    }

  });
}
