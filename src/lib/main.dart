import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'exports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  MyDatabase database = MyDatabase();

  runApp(MyApp(myDatabase: database));
}

class MyApp extends StatelessWidget {
  final MyDatabase myDatabase;

  const MyApp({Key? key, required this.myDatabase}) : super(key: key);

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
      ],
    );
  }
}
