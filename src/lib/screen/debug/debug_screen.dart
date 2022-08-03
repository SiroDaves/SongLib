import 'package:songlib/database/songlib_database.dart';
import 'package:songlib/navigator/main_navigator.dart';
import 'package:songlib/navigator/route_names.dart';
import 'package:songlib/util/keys.dart';
import 'package:songlib/vm/debug/debug_vm.dart';
import 'package:songlib/vm/global/global_vm.dart';
import 'package:songlib/widget/debug/debug_row_item.dart';
import 'package:songlib/widget/debug/debug_row_title.dart';
import 'package:songlib/widget/debug/debug_switch_row_item.dart';
import 'package:songlib/widget/debug/select_language_dialog.dart';
import 'package:songlib/widget/provider/provider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:provider/provider.dart';

class DebugScreen extends StatefulWidget {
  static const String routeName = RouteNames.debugScreen;

  const DebugScreen({
    Key? key,
  }) : super(key: key);

  @override
  DebugScreenState createState() => DebugScreenState();
}

@visibleForTesting
class DebugScreenState extends State<DebugScreen> implements DebugNavigator {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<DebugVm>(
      consumerWithThemeAndLocalization: (context, viewModel, child, _, localization) => Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          title: Text(localization.settingsTitle),
        ),
        body: ResponsiveWidget(
          builder: (context, info) => ListView(
            children: [
              const DebugRowTitle(title: 'debugAnimationsTitle'),
              DebugRowSwitchItem(
                key: Keys.debugSlowAnimations,
                title: 'debugSlowAnimations',
                value: viewModel.slowAnimationsEnabled,
                onChanged: viewModel.onSlowAnimationsChanged,
              ),
              const DebugRowTitle(title: 'debugThemeTitle'),
              DebugRowItem(
                key: Keys.debugTargetPlatform,
                title: 'debugTargetPlatformTitle',
                subTitle: 'debugTargetPlatformSubtitle: ${Provider.of<GlobalVm>(context).getCurrentPlatform()}',
                onClick: viewModel.onTargetPlatformClicked,
              ),
              DebugRowItem(
                key: Keys.debugThemeMode,
                title: 'debugThemeModeTitle',
                subTitle: 'debugThemeModeSubtitle',
                onClick: viewModel.onThemeModeClicked,
              ),
              const DebugRowTitle(title: 'debugLocaleTitle'),
              DebugRowItem(
                key: Keys.debugSelectLanguage,
                title: 'debugLocaleSelector',
                subTitle: 'debugLocaleCurrentLanguage${Provider.of<GlobalVm>(context).getCurrentLanguage()}',
                onClick: viewModel.onSelectLanguageClicked,
              ),
              DebugRowSwitchItem(
                key: Keys.debugShowTranslations,
                title: 'debugShowTranslations',
                value: Provider.of<GlobalVm>(context, listen: false).showsTranslationKeys,
                onChanged: (_) => Provider.of<GlobalVm>(context, listen: false).toggleTranslationKeys(),
              ),
              const DebugRowTitle(title: 'debugLicensesTitle'),
              DebugRowItem(
                key: Keys.debugLicense,
                title: 'debugLicensesGoTo',
                onClick: viewModel.onLicensesClicked,
              ),
              const DebugRowTitle(title: 'debugDatabase'),
              DebugRowItem(
                key: Keys.debugDatabase,
                title: 'debugViewDatabase',
                onClick: goToDatabase,
              ),
            ],
          ),
        ),
      ),
      create: () => GetIt.I()..init(this),
    );
  }

  @override
  void goToTargetPlatformSelector() => MainNavigatorWidget.of(context).goToDebugPlatformSelector();

  @override
  void goToThemeModeSelector() => MainNavigatorWidget.of(context).goToThemeModeSelector();

  @override
  void goToLicenses() => MainNavigatorWidget.of(context).goToLicense();

  @override
  void goToSelectLanguage() => MainNavigatorWidget.of(context).showCustomDialog<void>(
        builder: (context) => SelectLanguageDialog(
          goBack: () => MainNavigatorWidget.of(context).closeDialog(),
        ),
      );

  void goToDatabase() {
    final db = GetIt.I<SongLibDatabase>();
    MainNavigatorWidget.of(context).goToDatabase(db);
  }
}
