import 'package:songlib/model/data/enums.dart';
import 'package:songlib/navigator/main_navigator.dart';
import 'package:songlib/screen/base/simple_menu_screen.dart';
import 'package:songlib/styles/theme_colors.dart';
import 'package:songlib/styles/theme_durations.dart';
import 'package:songlib/vm/tour_select/tour_select_vm.dart';
import 'package:songlib/widget/general/styled/songlib_button.dart';
import 'package:songlib/widget/general/styled/songlib_list_view.dart';
import 'package:songlib/widget/general/styled/songlib_value_button.dart';
import 'package:songlib/widget/menu_background/menu_box.dart';
import 'package:songlib/widget/provider/provider_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class TourSelectScreen extends StatefulWidget {
  static const String routeName = 'tour_select';

  const TourSelectScreen({Key? key}) : super(key: key);

  @override
  TourSelectScreenState createState() => TourSelectScreenState();
}

class TourSelectScreenState extends State<TourSelectScreen> implements TourSelectNavigator {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<TourSelectVm>(
      create: () => GetIt.I()..init(this),
      childBuilderWithViewModel: (context, viewModel, theme, localization) => SimpleMenuScreen(
        child: MenuBox(
          title: localization.tourTitle,
          onClosePressed: viewModel.onBackClicked,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.75,
            child: AspectRatio(
              aspectRatio: 1.25,
              child: Padding(
                padding: const EdgeInsets.only(left: 36, top: 16, bottom: 8),
                child: SongLibListView.children(
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
                      text: localization.getTranslation(viewModel.raceTypeKey),
                      onChange: viewModel.setRaceType,
                      value: viewModel.raceTypeIndex,
                      minValue: 0,
                      maxValue: MapType.values.length - 1,
                    ),
                    SongLibValueButton(
                      text: localization.getTranslation(viewModel.raceLengthKey),
                      onChange: viewModel.setRaceLength,
                      value: viewModel.raceLengthIndex,
                      minValue: 0,
                      maxValue: MapLength.values.length - 1,
                    ),
                    SongLibValueButton(
                      text: '${localization.tourRaces} ${viewModel.races}',
                      onChange: viewModel.setRaces,
                      value: viewModel.races,
                      minValue: 2,
                      maxValue: 10,
                    ),
                    AnimatedOpacity(
                      opacity: viewModel.showWarning ? 1 : 0,
                      duration: ThemeDurations.shortAnimationDuration,
                      child: Text(
                        localization.longTourWarning,
                        style: theme.coreTextTheme.bodyUltraSmall.copyWith(color: ThemeColors.error),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Center(
                      child: SongLibButton(
                        text: localization.startButton,
                        onClick: viewModel.onStartClicked,
                        type: SongLibButtonType.green,
                      ),
                    ),
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
  void goToTourOverview() => MainNavigatorWidget.of(context).goToActiveTour();

  @override
  void goToMainMenu() => MainNavigatorWidget.of(context).goToHome();
}
