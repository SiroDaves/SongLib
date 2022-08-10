import 'package:songlib/database/songlib_database.dart';
import 'package:drift_inspector/drift_inspector.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

Future<void> addDatabaseInspector() async {
  if (!kDebugMode) return;

  final database = GetIt.I<SongLibDatabase>();

  final driftInspectorBuilder = DriftInspectorBuilder()
    ..bundleId = 'com.icapps.songlib'
    ..icon = 'flutter'
    ..addDatabase('songlib', database);

  final inspector = driftInspectorBuilder.build();

  await inspector.start();

  // ignore: avoid_print
  print('Started drift inspector');
}
