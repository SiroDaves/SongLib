import 'package:songlib/model/data/enums.dart';
import 'package:songlib/navigator/main_navigator.dart';
import 'package:songlib/navigator/mixin/back_navigator.dart';
import 'package:songlib/screen/base/simple_menu_screen.dart';
import 'package:songlib/util/env/flavor_config.dart';
import 'package:songlib/vm/settings/settings_vm.dart';
import 'package:songlib/widget/general/styled/songlib_button.dart';
import 'package:songlib/widget/general/styled/songlib_checkbox.dart';
import 'package:songlib/widget/general/styled/songlib_list_view.dart';
import 'package:songlib/widget/general/styled/songlib_value_button.dart';
import 'package:songlib/widget/menu_background/menu_box.dart';
import 'package:songlib/widget/provider/provider_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class SettingsScreen extends StatefulWidget {
  static const String routeName = 'settings';

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  SettingsScreenState createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> with BackNavigatorMixin implements SettingsNavigator {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<SettingsVm>(
      create: () => GetIt.I()..init(this),
      childBuilderWithViewModel: (context, viewModel, theme, localization) => SimpleMenuScreen(
        child: MenuBox(
          title: localization.settingsTitle,
          onClosePressed: viewModel.onBackPressed,
          wide: true,
          child: Container(
            padding: const EdgeInsets.only(left: 48, right: 48, bottom: 16),
            height: MediaQuery.of(context).size.height * 0.7,
            child: AspectRatio(
              aspectRatio: 1.9,
              child: Padding(
                padding: const EdgeInsets.only(left: 36),
                child: SongLibListView.children(
                  children: [
                    SongLibValueButton(
                      label: 'Language',
                      value: viewModel.languageIndex,
                      text: viewModel.locales[viewModel.languageIndex],
                      onChange: viewModel.languageChanged,
                      maxValue: viewModel.locales.length - 1,
                    ),
                    SongLibValueButton(
                      label: localization.settingsAutofollowThreshold,
                      value: viewModel.autofollowThreshold,
                      text: viewModel.autofollowThreshold.toString(),
                      onChange: viewModel.autofollowThresholdChanged,
                      maxValue: 12,
                      minValue: 2,
                    ),
                    SongLibCheckBox(
                      text: localization.settingsAutofollowAskBelowThreshold,
                      value: viewModel.autofollowThresholdBelowAsk,
                      onChanged: viewModel.autofollowThresholdBelowAskChanged,
                    ),
                    SongLibCheckBox(
                      text: localization.settingsAutofollowAskAboveThreshold,
                      value: viewModel.autofollowThresholdAboveAsk,
                      onChanged: viewModel.autofollowThresholdAboveAskChanged,
                    ),
                    SongLibValueButton(
                      label: localization.settingsCyclistMoveSpeed,
                      value: viewModel.cyclistMoveSpeedIndex,
                      text: localization.getTranslation(viewModel.cyclistMoveSpeed.localizationKey),
                      maxValue: CyclistMovementType.values.length - 1,
                      onChange: viewModel.cyclistMoveSpeedChanged,
                    ),
                    SongLibValueButton(
                      label: localization.settingsCameraAutoMove,
                      value: viewModel.cameraAutoMoveIndex,
                      text: localization.getTranslation(viewModel.cameraAutoMove.localizationKey),
                      maxValue: CameraMovementType.values.length - 1,
                      onChange: viewModel.cameraAutoMoveChanged,
                    ),
                    SongLibValueButton(
                      label: localization.settingsDifficulty,
                      value: viewModel.difficultyIndex,
                      text: localization.getTranslation(viewModel.difficulty.localizationKey),
                      maxValue: DifficultyType.values.length - 1,
                      onChange: viewModel.difficultyChanged,
                    ),
                    Center(
                      child: Text(
                        viewModel.version,
                        style: theme.coreTextTheme.bodyUltraSmall,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SongLibButton(
                          text: localization.changeNamesButton,
                          onClick: viewModel.onChangeCyclistNamesPressed,
                          type: SongLibButtonType.blue,
                        ),
                        const SizedBox(width: 4),
                        SongLibButton(
                          text: localization.saveButton,
                          onClick: viewModel.onBackPressed,
                          type: SongLibButtonType.green,
                        ),
                      ],
                    ),
                    if (FlavorConfig.isDev()) ...[
                      Center(
                        child: SongLibButton(
                          text: 'debug',
                          onClick: viewModel.onDebugClicked,
                          type: SongLibButtonType.blue,
                        ),
                      ),
                    ]
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void goToChangeCyclistNames() => MainNavigatorWidget.of(context).goToChangeCyclistNames();

  @override
  void goToDebug() => MainNavigatorWidget.of(context).goToDebug();
}
