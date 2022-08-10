import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../navigator/main_navigator.dart';
import '../navigator/route_names.dart';
import '../styles/theme_assets.dart';
import '../styles/theme_colors.dart';
import '../util/app_constants.dart';
import '../vm/splash_vm.dart';
import '../widget/provider/provider_widget.dart';

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
    return ProviderWidget<SplashVm>(
      create: () => GetIt.I()..init(this),
      consumerWithThemeAndLocalization:
          (context, viewModel, child, theme, localization) => Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                ThemeAssets.appIcon,
                height: 200,
                width: 200,
              ),
              const SizedBox(
                height: 35,
              ),
              const Text(
                AppConstants.appTitle,
                style: TextStyle(
                  fontSize: 40,
                  color: ThemeColors.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void goToHome() => MainNavigatorWidget.of(context).goToHome();

  @override
  void goToSelection() => MainNavigatorWidget.of(context).goToSelection();
}
