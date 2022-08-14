import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../navigator/main_navigator.dart';
import '../../navigator/mixin/back_navigator.dart';
import '../../navigator/route_names.dart';
import '../../theme/theme_assets.dart';
import '../../theme/theme_colors.dart';
import '../../util/constants/app_constants.dart';
import '../../vm/manage/settings_vm.dart';
import '../../widget/provider/provider_widget.dart';

class SettingsScreen extends StatefulWidget {
  static const String routeName = RouteNames.settingsScreen;

  const SettingsScreen({
    Key? key,
  }) : super(key: key);

  @override
  SettingsScreenState createState() => SettingsScreenState();
}

@visibleForTesting
class SettingsScreenState extends State<SettingsScreen> with BackNavigatorMixin implements SettingsNavigator {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<SettingsVm>(
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
