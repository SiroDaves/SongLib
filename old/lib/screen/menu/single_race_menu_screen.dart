import 'package:songlib/model/data/enums.dart';
import 'package:songlib/navigator/main_navigator.dart';
import 'package:songlib/navigator/mixin/back_navigator.dart';
import 'package:songlib/screen/base/simple_menu_screen.dart';
import 'package:songlib/styles/theme_colors.dart';
import 'package:songlib/styles/theme_durations.dart';
import 'package:songlib/vm/main_menu/single_race_menu_vm.dart';
import 'package:songlib/widget/general/styled/songlib_button.dart';
import 'package:songlib/widget/general/styled/songlib_value_button.dart';
import 'package:songlib/widget/menu_background/menu_box.dart';
import 'package:songlib/widget/provider/provider_widget.dart';
import 'package:songlib/widget_game/data/play_settings.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class SingleRaceMenuScreen extends StatefulWidget {
  static const String routeName = 'single_race_menu';

  const SingleRaceMenuScreen({Key? key}) : super(key: key);

  @override
  SingleRaceMenuScreenState createState() => SingleRaceMenuScreenState();
}

class SingleRaceMenuScreenState extends State<SingleRaceMenuScreen> with BackNavigatorMixin implements SingleRaceMenuNavigator {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<SingleRaceMenuVm>(
      create: () => GetIt.I()..init(this),
      childBuilderWithViewModel: (context, viewModel, theme, localization) => SimpleMenuScreen(
        child: MenuBox(
          title: localization.singleRaceTitle,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 120),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SongLibValueButton(
                  text: '${localization.raceTeams} ${viewModel.teams}',
                  onChange: viewModel.setTeams,
                  value: viewModel.teams,
                  minValue: 2,
                  maxValue: 8,
                ),
                SongLibValueButton(
                  text: '${localization.raceRiders} ${viewModel.teams * viewModel.cyclists}',
                  onChange: viewModel.setCyclists,
                  value: viewModel.cyclists,
                  minValue: 1,
                  maxValue: 5,
                ),
                SongLibValueButton(
                  text: localization.getTranslation(viewModel.raceType.localizationKey),
                  onChange: viewModel.setRaceType,
                  value: viewModel.raceTypeIndex,
                  minValue: 0,
                  maxValue: MapType.values.length - 1,
                ),
                SongLibValueButton(
                  text: localization.getTranslation(viewModel.raceLength.localizationKey),
                  onChange: viewModel.setRaceLength,
                  value: viewModel.raceLengthIndex,
                  minValue: 0,
                  maxValue: MapLength.values.length - 1,
                ),
                AnimatedOpacity(
                  opacity: viewModel.showWarning ? 1 : 0,
                  duration: ThemeDurations.shortAnimationDuration,
                  child: Text(
                    localization.longRaceWarning,
                    style: theme.coreTextTheme.bodyUltraSmall.copyWith(color: ThemeColors.error),
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SongLibButton(
                      text: localization.backButton,
                      onClick: viewModel.onBackClicked,
                      type: SongLibButtonType.red,
                    ),
                    const SizedBox(width: 8),
                    SongLibButton(
                      text: localization.startButton,
                      onClick: viewModel.onStartClicked,
                      type: SongLibButtonType.green,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void goToGame(PlaySettings playSettings) => MainNavigatorWidget.of(context).goToGame(playSettings);
}
