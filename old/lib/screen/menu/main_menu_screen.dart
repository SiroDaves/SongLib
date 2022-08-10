import 'package:songlib/navigator/main_navigator.dart';
import 'package:songlib/screen/base/simple_menu_screen.dart';
import 'package:songlib/vm/main_menu/main_menu_vm.dart';
import 'package:songlib/widget/general/styled/songlib_button.dart';
import 'package:songlib/widget/menu_background/menu_box.dart';
import 'package:songlib/widget/provider/provider_widget.dart';
import 'package:songlib/widget_game/data/play_settings.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class MainMenuScreen extends StatefulWidget {
  static const routeName = 'main_menu';

  const MainMenuScreen({Key? key}) : super(key: key);

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> implements MainMenuNavigator {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<MainMenuVm>(
      create: () => GetIt.I<MainMenuVm>()..init(this),
      childBuilderWithViewModel: (context, viewModel, theme, localization) => SimpleMenuScreen(
        child: Stack(
          children: [
            Positioned(
              child: MenuBox(
                title: 'SongLib',
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 120),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SongLibButton(
                        text: localization.continueButton,
                        onClick: viewModel.onContinueClick,
                        isEnabled: viewModel.hasGameAvailable,
                        type: SongLibButtonType.green,
                      ),
                      SongLibButton(
                        text: localization.careerButton,
                        onClick: viewModel.onCareerClicked,
                        type: SongLibButtonType.yellow,
                      ),
                      SongLibButton(
                        text: localization.singleRaceButton,
                        onClick: viewModel.onSingleRaceClicked,
                        type: SongLibButtonType.blue,
                      ),
                      SongLibButton(
                        text: localization.tourButton,
                        onClick: viewModel.onTourClicked,
                        type: SongLibButtonType.red,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              top: 16,
              right: 16,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SongLibButton(
                    type: SongLibButtonType.iconInfo,
                    onClick: viewModel.onInfoPressed,
                  ),
                  const SizedBox(width: 8),
                  SongLibButton(
                    type: SongLibButtonType.iconCredits,
                    onClick: viewModel.onCreditsPressed,
                  ),
                  const SizedBox(width: 8),
                  SongLibButton(
                    type: SongLibButtonType.iconSettings,
                    onClick: viewModel.onSettingsPressed,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Future<void> goToTourSelect() => MainNavigatorWidget.of(context).goToTourSelect();

  @override
  Future<void> goToCareerOverview() => MainNavigatorWidget.of(context).goToCareerOverview();

  @override
  Future<void> goToTourInProgress() => MainNavigatorWidget.of(context).goToTourInProgress();

  @override
  Future<void> goToSingleRaceMenu() => MainNavigatorWidget.of(context).goToSingleRaceMenu();

  @override
  void goToSettings() => MainNavigatorWidget.of(context).goToSettings();

  @override
  void goToInfo() => MainNavigatorWidget.of(context).goToInformation();

  @override
  void goToCredits() => MainNavigatorWidget.of(context).goToCredits();

  @override
  Future<void> goToGame() => MainNavigatorWidget.of(context).goToGame(PlaySettings.load());
}
