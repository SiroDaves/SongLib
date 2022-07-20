import 'package:drift/drift.dart';
import 'package:drift/isolate.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'exports.dart';

DatabaseConnection _backgroundConnection() {
  final database = NativeDatabase.memory();
  return DatabaseConnection.fromExecutor(database);
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  DriftIsolate isolate = await DriftIsolate.spawn(_backgroundConnection);
  DatabaseConnection connection = await isolate.connect();
  final database = MyDatabase.connect(connection);

  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  MyDatabase myDatabase = MyDatabase();

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.appTitle,
      theme: asLightTheme,
      initialRoute: Routes.splash,
      getPages: [
        GetPage(
          name: Paths.splash,
          page: () => SplashView(
            database: myDatabase,
          ),
          binding: SplashBinding(),
        ),
        GetPage(
          name: Paths.books,
          page: () => BooksView(
            database: myDatabase,
          ),
          binding: BooksBinding(),
        ),
        GetPage(
          name: Paths.songs,
          page: () => SongsView(
            database: myDatabase,
          ),
          binding: SongsBinding(),
        ),
        GetPage(
          name: Paths.home,
          page: () => HomeView(
            database: myDatabase,
          ),
          binding: HomeBinding(),
        ),
        GetPage(
          name: Paths.song,
          page: () => SongView(
            song: null,
            database: myDatabase,
          ),
          binding: SongBinding(),
        ),
      ],
    );
  }
}
