import 'package:songlib/navigator/main_navigator.dart';
import 'package:songlib/navigator/mixin/back_navigator.dart';
import 'package:songlib/screen/base/simple_menu_screen.dart';
import 'package:songlib/vm/careers/career_select_riders_vm.dart';
import 'package:songlib/widget/general/styled/songlib_button.dart';
import 'package:songlib/widget/menu_background/menu_box.dart';
import 'package:songlib/widget/provider/provider_widget.dart';
import 'package:songlib/widget_game/data/play_settings.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class CareerSelectRidersScreen extends StatefulWidget {
  static const String routeName = 'career_select_riders';

  const CareerSelectRidersScreen({Key? key}) : super(key: key);

  @override
  CareerSelectRidersScreenState createState() => CareerSelectRidersScreenState();
}

class CareerSelectRidersScreenState extends State<CareerSelectRidersScreen> with BackNavigatorMixin implements CareerSelectRidersNavigator {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<CareerSelectRidersVm>(
      create: () => GetIt.I()..init(this),
      childBuilderWithViewModel: (context, viewModel, theme, localization) {
        final event = viewModel.calendarEvent;
        return SimpleMenuScreen(
          child: MenuBox(
            title: localization.careerSelectRidersTitle,
            onClosePressed: viewModel.onClosePressed,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: AspectRatio(
                aspectRatio: 1.25,
                child: Column(
                  children: [
                    if (event != null) ...[
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              localization.careerStandingsNumber,
                              style: theme.coreTextTheme.bodyNormal,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            flex: 3,
                            child: Text(
                              event.id.toString(),
                              style: theme.coreTextTheme.bodyNormal,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              localization.careerStandingsName,
                              style: theme.coreTextTheme.bodyNormal,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            flex: 3,
                            child: FittedBox(
                              fit: BoxFit.scaleDown,
                              alignment: Alignment.centerLeft,
                              child: Text(
                                localization.getTranslation(event.localizationKey),
                                style: theme.coreTextTheme.bodyNormal,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              localization.careerStandingsRaces,
                              style: theme.coreTextTheme.bodyNormal,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            flex: 3,
                            child: Text(
                              event.playSettings.totalRaces.toString(),
                              style: theme.coreTextTheme.bodyNormal,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              localization.careerStandingsPoints,
                              style: theme.coreTextTheme.bodyNormal,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            flex: 3,
                            child: Text(
                              event.points.toString(),
                              style: theme.coreTextTheme.bodyNormal,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              localization.raceDuration,
                              style: theme.coreTextTheme.bodyNormal,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            flex: 3,
                            child: Text(
                              localization.getTranslation(event.playSettings.mapLength.localizationKey),
                              style: theme.coreTextTheme.bodyNormal,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              localization.raceType,
                              style: theme.coreTextTheme.bodyNormal,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            flex: 3,
                            child: Text(
                              localization.getTranslation(event.playSettings.mapType.localizationKey),
                              style: theme.coreTextTheme.bodyNormal,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              localization.raceTeams,
                              style: theme.coreTextTheme.bodyNormal,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            flex: 3,
                            child: Text(
                              event.playSettings.teams.toString(),
                              style: theme.coreTextTheme.bodyNormal,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              localization.raceRiders,
                              style: theme.coreTextTheme.bodyNormal,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            flex: 3,
                            child: Text(
                              (event.playSettings.teams * event.playSettings.ridersPerTeam).toString(),
                              style: theme.coreTextTheme.bodyNormal,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Center(
                        child: SongLibButton(
                          onClick: viewModel.onStartPressed,
                          text: localization.startButton,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  void goToGame(PlaySettings playSettings) => MainNavigatorWidget.of(context).goToGame(playSettings);
}
