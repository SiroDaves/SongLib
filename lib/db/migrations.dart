import 'package:drift/drift.dart';
import 'package:flutter/foundation.dart';

import 'songlib_db.dart';

extension MigrationsExt on SongLibDB {
  MigrationStrategy migrations() => MigrationStrategy(
        onUpgrade: (Migrator m, from, to) async {
          await customStatement('PRAGMA foreign_keys = OFF');

          await transaction(() async {
            await m.createTable(dbEditTable);
          });

          if (kDebugMode) {
            final wrongForeignKeys =
                await customSelect('PRAGMA foreign_key_check').get();
            assert(wrongForeignKeys.isEmpty,
                '${wrongForeignKeys.map((e) => e.data)}');
          }
        },
        beforeOpen: (details) async {
          await customStatement('PRAGMA foreign_keys = ON');
        },
      );
}
