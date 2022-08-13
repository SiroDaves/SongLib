import 'package:drift_inspector/drift_inspector.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

import '../../db/songlib_db.dart';

Future<void> addDatabaseInspector() async {
  if (!kDebugMode) return;

  final database = GetIt.I<SongLibDb>();

  final driftInspectorBuilder = DriftInspectorBuilder()
    ..bundleId = 'com.songlib'
    ..icon = 'flutter'
    ..addDatabase('songlib', database);

  final inspector = driftInspectorBuilder.build();

  await inspector.start();

  // ignore: avoid_print
  print('Started drift inspector');
}
