import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import 'architecture.dart';
import 'di/environments.dart';
import 'di/injectible.dart';
import 'navigator/main_navigator.dart';
import 'theme/app_themes.dart';
import 'utils/constants/api_constants.dart';
import 'utils/env/flavor_config.dart';
import 'utils/locale/localization_delegate.dart';
import 'utils/locale/localization_fallback_cupertino_delegate.dart';
import 'view_models/global_vm.dart';
import 'widgets/provider/provider_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initArchitecture();

  FlavorConfig(
    flavor: Flavor.prod,
    name: 'PROD',
    color: Colors.red,
    values: const FlavorValues(
      logNetworkInfo: false,
      showFullErrorMessages: false,
    ),
  );

  await configureDependencies(Environments.prod);

  // Initialize parse server
  await Parse().initialize(
    ApiConstants.applicationID,
    ApiConstants.parseApiUrl,
    clientKey: ApiConstants.clientKey,
    autoSendSessionId: true,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final Widget? home;

  const MyApp({Key? key})
      : home = null,
        super(key: key);

  @visibleForTesting
  const MyApp.test({required this.home, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<GlobalVM>(
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
        theme: AppThemeData.lightTheme(viewModel.targetPlatform),
        darkTheme: AppThemeData.darkTheme(viewModel.targetPlatform),
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
