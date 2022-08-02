import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:songlib/navigator/main_navigator.dart';
import 'package:songlib/styles/theme_data.dart';
import 'package:songlib/util/env/flavor_config.dart';
import 'package:songlib/util/locale/localization_delegate.dart';
import 'package:songlib/util/locale/localization_fallback_cupertino_delegate.dart';
import 'package:songlib/viewmodel/global/global_viewmodel.dart';
import 'package:songlib/widget/provider/provider_widget.dart';
import 'package:get_it/get_it.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
    ));
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    return const SongLibApp();
  }
}

class SongLibApp extends StatelessWidget {
  final Widget? home;

  const SongLibApp({Key? key})
      : home = null,
        super(key: key);

  @visibleForTesting
  const SongLibApp.test({required this.home, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<GlobalViewModel>(
      lazy: FlavorConfig.isInTest(),
      consumer: (context, viewModel, consumerChild) => MaterialApp(
        debugShowCheckedModeBanner: !FlavorConfig.isInTest(),
        localizationsDelegates: [
          viewModel.localeDelegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          FallbackCupertinoLocalisationsDelegate.delegate,
        ],
        locale: viewModel.locale,
        supportedLocales: LocalizationDelegate.supportedLocales,
        themeMode: viewModel.themeMode,
        theme: MyappThemeData.lightTheme(viewModel.targetPlatform),
        darkTheme: MyappThemeData.darkTheme(viewModel.targetPlatform),
        navigatorKey: MainNavigatorWidgetState.navigationKey,
        initialRoute: home == null ? MainNavigatorWidgetState.initialRoute : null,
        onGenerateRoute: MainNavigatorWidgetState.onGenerateRoute,
        navigatorObservers: MainNavigatorWidgetState.navigatorObservers,
        builder: home == null ? (context, child) => MainNavigatorWidget(child: child) : null,
        home: home,
      ),
      create: () => GetIt.I()..init(),
    );
  }
}
