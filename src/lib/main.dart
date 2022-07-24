import 'package:drift/drift.dart';
import 'package:drift/isolate.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'exports.dart';

DatabaseConnection backgroundConnection() {
  final database = NativeDatabase.memory();
  return DatabaseConnection.fromExecutor(database);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  DriftIsolate isolate = await DriftIsolate.spawn(backgroundConnection);
  DatabaseConnection connection = await isolate.connect();

  Get.put(MyDatabase.connect(connection));

  Get.put<BookService>(BookDummyService());
  Get.lazyPut<BookDaoStorage>(() => BookDaoStorage(Get.find<MyDatabase>()));

  Get.lazyPut<BookRepository>(
    () => BookRepository(Get.find<BookService>(), Get.find<BookDaoStorage>()),
  );

  runApp(const MyApp());
}
