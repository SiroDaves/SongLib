import 'package:songlib/model/data/enums.dart';
import 'package:songlib/navigator/main_navigator.dart';
import 'package:songlib/screen/base/simple_menu_screen.dart';
import 'package:songlib/vm/results/results_vm.dart';
import 'package:songlib/widget/general/styled/songlib_list_view.dart';
import 'package:songlib/widget/menu_background/menu_box.dart';
import 'package:songlib/widget/provider/provider_widget.dart';
import 'package:songlib/widget/results/result_list_item.dart';
import 'package:songlib/widget/results/results_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ResultsScreen extends StatefulWidget {
  static const String routeName = 'results';
  final ResultsArguments arguments;

  const ResultsScreen({
    required this.arguments,
    super.key,
  });

  @override
  ResultsScreenState createState() => ResultsScreenState();
}

class ResultsScreenState extends State<ResultsScreen> implements ResultsNavigator {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<ResultsVm>(
      create: () => GetIt.I()..init(this, widget.arguments),
      childBuilderWithViewModel: (context, viewModel, theme, localization) => WillPopScope(
        onWillPop: () async {
          viewModel.onClosePressed();
          return false;
        },
        child: SimpleMenuScreen(
          child: MenuBox(
            title: localization.resultsTitle,
            onClosePressed: viewModel.onClosePressed,
            wide: true,
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: AspectRatio(
                aspectRatio: 2.1,
                child: Column(
                  children: [
                    Expanded(
                      child: PageView.builder(
                        controller: viewModel.controller,
                        itemCount: viewModel.results.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, resultIndex) {
                          final results = viewModel.results[resultIndex];
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  height: 32,
                                  child: Row(
                                    children: [
                                      ...?results.type?.columns.map((e) => Expanded(
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
                                  child: SongLibListView(
                                    itemCount: results.data.length,
                                    itemBuilder: (context, index) {
                                      final resultData = results.data[index];
                                      String? time;
                                      if (index == 0) {
                                        time = resultData.time.toString();
                                      } else if (resultData.time != results.data[index - 1].time) {
                                        final firstTurns = results.data.first.time;
                                        time = '+${resultData.time - firstTurns}';
                                      }
                                      return ResultListItem(
                                        resultData: resultData,
                                        index: index,
                                        time: time,
                                        numberToName: viewModel.numberToName,
                                        columns: results.type?.columns,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    ResultsBottomNavigation(
                      controller: viewModel.controller,
                      pages: viewModel.results.map((e) => e.type).whereType<ResultsType>().toList(),
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
  void goToMainMenu() => MainNavigatorWidget.of(context).goToHome();

  @override
  void goToCareerOverview() => MainNavigatorWidget.of(context).goToCareerOverview();

  @override
  void goToActiveTour() => MainNavigatorWidget.of(context).goToActiveTour();
}
