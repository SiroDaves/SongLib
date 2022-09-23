import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../navigator/main_navigator.dart';
import '../navigator/route_names.dart';
import '../theme/theme_assets.dart';
import '../theme/theme_colors.dart';
import '../util/constants/app_constants.dart';
import '../vm/onboarding_vm.dart';
import '../widget/provider/provider_widget.dart';

/// Timed Welcome screen
class OnboardingScreen extends StatefulWidget {
  static const String routeName = RouteNames.onboardingScreen;

  const OnboardingScreen({
    Key? key,
  }) : super(key: key);

  @override
  OnboardingScreenState createState() => OnboardingScreenState();
}

@visibleForTesting
class OnboardingScreenState extends State<OnboardingScreen> implements OnboardingNavigator {
  OnboardingVm? vm;

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<OnboardingVm>(
      create: () => GetIt.I()..init(this),
      consumerWithThemeAndLocalization:
          (context, viewModel, child, theme, localization) {
        vm = viewModel;
        return screenWidget(context);
      },
    );
  }

  Widget screenWidget(BuildContext context) {
    return Scaffold(
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
    );
  }

  @override
  void goToUiTest() => MainNavigatorWidget.of(context).goToUiTest();

  @override
  void goToHome() => MainNavigatorWidget.of(context).goToHome();

  @override
  void goToSelection() => MainNavigatorWidget.of(context).goToSelection();
}
