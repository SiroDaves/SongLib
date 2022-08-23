import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../navigator/main_navigator.dart';
import '../../navigator/mixin/back_navigator.dart';
import '../../navigator/route_names.dart';
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
class SettingsScreenState extends State<SettingsScreen>
    with BackNavigatorMixin
    implements SettingsNavigator {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<SettingsVm>(
      create: () => GetIt.I()..init(this),
      consumerWithThemeAndLocalization:
          (context, viewModel, child, theme, localization) => Scaffold(
        appBar: AppBar(
          title: const Text(AppConstants.settingsTitle),
        ),
        body: Container(),
      ),
    );
  }

  @override
  void goToHome() => MainNavigatorWidget.of(context).goToHome();

  @override
  void goToSelection() => MainNavigatorWidget.of(context).goToSelection();
}
