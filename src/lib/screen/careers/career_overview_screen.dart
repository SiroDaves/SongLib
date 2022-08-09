import 'package:songlib/model/data/enums.dart';
import 'package:songlib/navigator/main_navigator.dart';
import 'package:songlib/screen/base/simple_menu_screen.dart';
import 'package:songlib/vm/careers/career_overview_vm.dart';
import 'package:songlib/widget/general/styled/songlib_button.dart';
import 'package:songlib/widget/general/styled/songlib_list_view.dart';
import 'package:songlib/widget/menu_background/menu_box.dart';
import 'package:songlib/widget/provider/provider_widget.dart';
import 'package:songlib/widget/results/result_list_item.dart';
import 'package:songlib/widget_game/data/result_data.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class CareerOverviewScreen extends StatefulWidget {
  static const String routeName = 'career_overview';

  const CareerOverviewScreen({Key? key}) : super(key: key);

  @override
  CareerOverviewScreenState createState() => CareerOverviewScreenState();
}

class CareerOverviewScreenState extends State<CareerOverviewScreen> implements CareerOverviewNavigator {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<CareerOverviewVm>(
      create: () => GetIt.I()..init(this),
      childBuilderWithViewModel: (context, viewModel, theme, localization) => SimpleMenuScreen(
        child: MenuBox(
          title: localization.careerOverviewTitle,
          onClosePressed: viewModel.onClosePressed,
          wide: true,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            child: AspectRatio(
              aspectRatio: 2.1,
              child: Column(
                children: [
                  SizedBox(
                    height: 32,
                    child: Row(
                      children: [
                        ...[
                          ResultsColumn.rank,
                          ResultsColumn.number,
                          ResultsColumn.name,
                          ResultsColumn.points,
                        ].map((e) => Expanded(
                              flex: e.flex,
                              child: e.icon == null
                                  ? const SizedBox.shrink()
                                  : Image.asset(
                                      e.icon!,
                                      fit: BoxFit.contain,
                                    ),
                            )),
                        const SizedBox(width: 40),
                      ],
                    ),
                  ),
                  Expanded(
                    child: viewModel.currentResults.isEmpty
                        ? Center(
                            child: Text(
                              localization.careerOverviewNoResults,
                              style: theme.coreTextTheme.bodyNormal,
                            ),
                          )
                        : SongLibListView(
                            itemCount: viewModel.currentResults.length + (viewModel.teamResult == null ? 1 : 2),
                            itemBuilder: (context, index) {
                              if (index == viewModel.currentResults.length) return const SizedBox(height: 16);
                              final ResultData resultData;
                              final String time;
                              final String Function(int) numberToName;
                              final columns = [
                                ResultsColumn.rank,
                                index == viewModel.currentResults.length + 1 ? ResultsColumn.team : ResultsColumn.number,
                                ResultsColumn.name,
                                ResultsColumn.points,
                              ];
                              if (index == viewModel.currentResults.length + 1) {
                                resultData = viewModel.teamResult!;
                                time = resultData.time.toString();
                                numberToName = (_) => localization.yourTeam;
                              } else {
                                resultData = viewModel.currentResults[index];
                                time = resultData.rank == 0 ? resultData.time.toString() : '+${resultData.time - viewModel.firstTime}';
                                numberToName = viewModel.numberToName;
                              }
                              return ResultListItem(
                                index: resultData.rank,
                                time: time,
                                resultData: resultData,
                                columns: columns,
                                numberToName: numberToName,
                              );
                            },
                          ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SongLibButton(
                        text: localization.careerOverviewRankings,
                        onClick: viewModel.onRankingsPressed,
                        type: SongLibButtonType.yellow,
                      ),
                      const SizedBox(width: 8),
                      SongLibButton(
                        text: localization.careerOverviewCalendar,
                        onClick: viewModel.onCalendarPressed,
                        type: SongLibButtonType.blue,
                      ),
                      if (viewModel.isFinished) ...[
                        SongLibButton(
                          text: localization.careerOverviewFinish,
                          onClick: viewModel.onFinishPressed,
                          type: SongLibButtonType.green,
                        ),
                      ],
                    ],
                  ),
                  if (!viewModel.isFinished) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SongLibButton(
                          text: localization.careerOverviewReset,
                          onClick: viewModel.onResetPressed,
                          type: SongLibButtonType.red,
                        ),
                        const SizedBox(width: 8),
                        SongLibButton(
                          text: localization.careerOverviewStartNext,
                          onClick: viewModel.onNextRacePressed,
                          type: SongLibButtonType.green,
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void goToMainMenu() => MainNavigatorWidget.of(context).goToHome();

  @override
  void goToCalendar() => MainNavigatorWidget.of(context).goToCareerCalendar();

  @override
  void goToRankings() => MainNavigatorWidget.of(context).goToCareerStandings();

  @override
  void goToResetCareer() => MainNavigatorWidget.of(context).goToCareerReset();

  @override
  void goToCareerFinish() => MainNavigatorWidget.of(context).goToCareerFinish();

  @override
  void goToSelectRiders() => MainNavigatorWidget.of(context).goToCareerSelectRiders();
}
