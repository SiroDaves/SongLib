import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'common/auth/auth_bloc.dart';
import 'common/theme/theme_cubit.dart';
import 'common/utils/constants/pref_constants.dart';
import 'common/utils/date_util.dart';
import 'data/repository/auth_repository.dart';
import 'data/repository/local_storage.dart';
import 'di/injectable.dart';
import 'navigator/main_navigator.dart';
import 'navigator/route_names.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  late final AuthRepository _authRepo;

  @override
  void initState() {
    super.initState();
    _authRepo = AuthRepository();
  }

  @override
  void dispose() {
    _authRepo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: _authRepo,
      child: BlocProvider(
        create: (_) => AuthBloc(authRepository: _authRepo),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  final Widget? home;
  const AppView({super.key, this.home});

  @override
  State<AppView> createState() => AppViewState();
}

class AppViewState extends State<AppView> {
  final navigatorKey = MainNavigatorState.navigationKey;
  NavigatorState get navigator =>
      MainNavigatorState.navigationKey.currentState!;

  @override
  Widget build(BuildContext context) {
    var localStorage = getIt<LocalStorage>();
    bool isLoaded = localStorage.getPrefBool(PrefConstants.dataLoadedCheckKey);

    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeData>(
        builder: (ctx, theme) {
          return MaterialApp(
            home: widget.home,
            theme: theme,
            supportedLocales: const [Locale('en'), Locale('sw')],
            debugShowCheckedModeBanner: false,
            navigatorKey: navigatorKey,
            initialRoute: MainNavigatorState.initialRoute,
            onGenerateRoute: MainNavigatorState.onGenerateRoute,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            builder: (context, child) => BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                switch (state.status) {
                  case AuthStatus.unauthenticated:
                    navigator.pushNamed<void>(RouteNames.signup);
                  case AuthStatus.unverified:
                    navigator.pushNamed<void>(RouteNames.login);
                  case AuthStatus.authenticated:
                    if (isLoaded) {
                      navigator.pushNamedAndRemoveUntil<void>(
                        RouteNames.home,
                        (route) => false,
                      );
                    } else {
                      localStorage.setPrefString(
                          PrefConstants.dateInstalledKey, dateNow());

                      navigator.pushNamedAndRemoveUntil<void>(
                        RouteNames.selecting,
                        (route) => false,
                      );
                    }
                }
              },
              child: child,
            ),
          );
        },
      ),
    );
  }
}
