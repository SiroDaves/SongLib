import 'package:flutter/material.dart';
import 'package:songlib/navigator/main_navigator.dart';
import 'package:songlib/navigator/route_names.dart';
import 'package:songlib/viewmodel/splash/splash_viewmodel.dart';
import 'package:songlib/widget/general/status_bar.dart';
import 'package:songlib/widget/general/styled/myapp_progress_indicator.dart';
import 'package:songlib/widget/provider/provider_widget.dart';
import 'package:get_it/get_it.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = RouteNames.splashScreen;

  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  SplashScreenState createState() => SplashScreenState();
}

@visibleForTesting
class SplashScreenState extends State<SplashScreen> implements SplashNavigator {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<SplashViewModel>(
      create: () => GetIt.I()..init(this),
      consumerWithThemeAndLocalization: (context, viewModel, child, theme, localization) => StatusBar.light(
        child: Scaffold(
          backgroundColor: theme.colorsTheme.primary,
          body: const Center(
            child: MyappProgressIndicator.light(),
          ),
        ),
      ),
    );
  }

  @override
  void goToHome() => MainNavigatorWidget.of(context).goToHome();

  @override
  void goToLogin() => MainNavigatorWidget.of(context).goToLogin();
}
