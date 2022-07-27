import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'exports.dart';

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.appTitle,
      theme: asLightTheme,
      //darkTheme: asDarkTheme,
      //themeMode: themeController.theme,
      initialRoute: Routes.splash,
      getPages: [
        GetPage(
          name: Paths.splash,
          page: () => SplashView(),
          binding: SplashBinding(),
        ),
        GetPage(
          name: Paths.selection,
          page: () => SelectionView(),
          binding: SelectionBinding(),
        ),
        GetPage(
          name: Paths.home,
          page: () => HomeView(),
          binding: HomeBinding(),
        ),
        GetPage(
          name: Paths.listeds,
          page: () => ListedsView(listed: null),
          binding: ListedsBinding(),
        ),
        GetPage(
          name: Paths.songsPresentor,
          page: () => PresentorView(books: null, song: null),
          binding: PresentorBinding(),
        ),
        GetPage(
          name: Paths.songsEditor,
          page: () => EditorView(song: null),
          binding: EditorBinding(),
        ),
      ],
    );
  }
}
