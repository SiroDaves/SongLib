import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../../navigator/main_navigator.dart';
import '../../navigator/mixin/back_navigator.dart';
import '../../navigator/route_names.dart';
import '../../theme/theme_colors.dart';
import '../../util/constants/app_constants.dart';
import '../../vm/global_vm.dart';
import '../../vm/manage/settings_vm.dart';
import '../../widget/provider/provider_widget.dart';
import '../../widget/general/selector_item.dart';

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
  String theme = AppConstants.themeDefault;

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<SettingsVm>(
      childBuilderWithViewModel: (context, value, _, localization) => Scaffold(
        backgroundColor: ThemeColors.accent,
        appBar: AppBar(
          title: const Text(AppConstants.settingsTitle),
        ),
        body: Consumer<GlobalVm>(
          builder: (context, viewModel, child) =>
              mainContainer(context, viewModel),
        ),
      ),
      create: () => GetIt.I()..init(this),
    );
  }

  Widget mainContainer(BuildContext context, GlobalVm viewModel) {
    if (viewModel.themeMode == ThemeMode.light) {
      theme = AppConstants.themeLight;
    } else if (viewModel.themeMode == ThemeMode.dark) {
      theme = AppConstants.themeDark;
    }

    return ListView(
      padding: const EdgeInsets.all(5),
      children: [
        Card(
          child: ListTile(
            leading: const Icon(Icons.sort),
            title: const Text('Songbooks Management'),
            subtitle: const Text('Reselect your songbooks afresh'),
            onTap: () => goToSelection(),
          ),
        ),
        Card(
          child: ExpansionTile(
            leading: const Icon(Icons.display_settings),
            title: const Text('Theme Mode'),
            subtitle: Text('Theme: $theme'),
            children: [
              SelectorItem(
                title: 'Default',
                onClick: () => viewModel.updateThemeMode(ThemeMode.system),
                selected: viewModel.themeMode == ThemeMode.system,
              ),
              SelectorItem(
                title: 'Light',
                onClick: () => viewModel.updateThemeMode(ThemeMode.light),
                selected: viewModel.themeMode == ThemeMode.light,
              ),
              SelectorItem(
                title: 'Dark',
                onClick: () => viewModel.updateThemeMode(ThemeMode.dark),
                selected: viewModel.themeMode == ThemeMode.dark,
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void goToHome() => MainNavigatorWidget.of(context).goToHome();

  @override
  void goToSelection() => MainNavigatorWidget.of(context).goToSelection();
}
