import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'navigator/main_navigator.dart';
import 'theme/theme_data.dart';
import 'util/env/flavor_config.dart';
import 'util/locale/localization_delegate.dart';
import 'util/locale/localization_fallback_cupertino_delegate.dart';
import 'vm/global_vm.dart';
import 'widget/provider/provider_widget.dart';

void startApp() async {
  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://704a7eba4e654566beb30a98e786da51@o1365314.ingest.sentry.io/6660908';
      options.tracesSampleRate = 1.0;
    },
    appRunner: () => runApp(const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const InternalApp();
  }
}

class InternalApp extends StatelessWidget {
  final Widget? home;

  const InternalApp({Key? key})
      : home = null,
        super(key: key);

  @visibleForTesting
  const InternalApp.test({required this.home, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<GlobalVm>(
      lazy: FlavorConfig.isInTest(),
      create: () => GetIt.I()..init(context),
      consumer: (context, viewModel, consumerChild) => MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          viewModel.localeDelegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          FallbackCupertinoLocalisationsDelegate.delegate,
        ],
        locale: viewModel.locale,
        supportedLocales: LocalizationDelegate.supportedLocales,
        themeMode: viewModel.themeMode,
        theme: SongLibThemeData.lightTheme(viewModel.targetPlatform),
        darkTheme: SongLibThemeData.darkTheme(viewModel.targetPlatform),
        navigatorKey: MainNavigatorWidgetState.navigationKey,
        initialRoute:
            home == null ? MainNavigatorWidgetState.initialRoute : null,
        onGenerateRoute: MainNavigatorWidgetState.onGenerateRoute,
        navigatorObservers: MainNavigatorWidgetState.navigatorObservers,
        builder: home == null
            ? (context, child) => MainNavigatorWidget(child: child)
            : null,
        home: home,
      ),
    );
  }
}
