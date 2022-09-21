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

/// Settings screen for user to change app options
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
  String wakeLock = 'Disabled', slideDirection = 'Vertical (Up, Down)';
  GlobalVm? vm;

  @override
  Widget build(BuildContext context) {
    return ProviderWidget<SettingsVm>(
      create: () => GetIt.I()..init(this),
      childBuilderWithViewModel: (context, value, _, localization) {
        return Scaffold(
          backgroundColor: ThemeColors.accent,
          appBar: AppBar(
            title: const Text(AppConstants.settingsTitle),
          ),
          body: Consumer<GlobalVm>(builder: (context, viewModel, child) {
            vm = viewModel;
            return ListView(
              padding: const EdgeInsets.all(5),
              children: [
                songbookManagement(),
                wakeLockManagement(),
                slideDirectionManagement(),
                //themeManagement(),
              ],
            );
          }),
        );
      },
    );
  }

  Widget songbookManagement() {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.sort),
        title: const Text('Songbooks Management'),
        subtitle: const Text('Reselect your songbooks afresh'),
        onTap: () => goToSelection(),
      ),
    );
  }

  Widget wakeLockManagement() {
    if (vm!.wakeLockStatus) {
      wakeLock = 'Enabled';
    } else {
      wakeLock = 'Disabled';
    }

    return Card(
      child: ExpansionTile(
        leading: const Icon(Icons.display_settings),
        title: const Text('Keep Screen On in Song View'),
        subtitle: Text('Status: $wakeLock'),
        children: [
          SelectorItem(
            title: 'Enable',
            onClick: () => vm!.updateWakeLockStatus(true),
            selected: vm!.wakeLockStatus == true,
          ),
          SelectorItem(
            title: 'Disable',
            onClick: () => vm!.updateWakeLockStatus(false),
            selected: vm!.wakeLockStatus == false,
          ),
        ],
      ),
    );
  }

  Widget slideDirectionManagement() {
    if (vm!.slideHorizontal) {
      slideDirection = 'Horizontal (Left, Right)';
    } else {
      slideDirection = 'Vertical (Up, Down)';
    }

    return Card(
      child: ExpansionTile(
        leading: const Icon(Icons.display_settings),
        title: const Text('Song Slides Direction'),
        subtitle: Text('Direction: $slideDirection'),
        children: [
          SelectorItem(
            title: 'Vertical (Up, Down)',
            onClick: () => vm!.updateSlideHorizontal(true),
            selected: vm!.slideHorizontal == true,
          ),
          SelectorItem(
            title: 'Horizontal (Left, Right)',
            onClick: () => vm!.updateSlideHorizontal(false),
            selected: vm!.slideHorizontal == false,
          ),
        ],
      ),
    );
  }

  Widget themeManagement() {
    if (vm!.themeMode == ThemeMode.light) {
      theme = AppConstants.themeLight;
    } else if (vm!.themeMode == ThemeMode.dark) {
      theme = AppConstants.themeDark;
    }

    return Card(
      child: ExpansionTile(
        leading: const Icon(Icons.display_settings),
        title: const Text('Theme Mode'),
        subtitle: Text('Theme: $theme'),
        children: [
          SelectorItem(
            title: 'Default',
            onClick: () => vm!.updateThemeMode(ThemeMode.system),
            selected: vm!.themeMode == ThemeMode.system,
          ),
          SelectorItem(
            title: 'Light',
            onClick: () => vm!.updateThemeMode(ThemeMode.light),
            selected: vm!.themeMode == ThemeMode.light,
          ),
          SelectorItem(
            title: 'Dark',
            onClick: () => vm!.updateThemeMode(ThemeMode.dark),
            selected: vm!.themeMode == ThemeMode.dark,
          ),
        ],
      ),
    );
  }

  @override
  void goToHome() => MainNavigatorWidget.of(context).goToHome();

  @override
  void goToSelection() => MainNavigatorWidget.of(context).goToSelection();
}
