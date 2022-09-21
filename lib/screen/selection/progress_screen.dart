import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../navigator/main_navigator.dart';
import '../../theme/theme_colors.dart';
import '../../vm/selection/progress_vm.dart';
import '../../widget/progress/advanced/advanced_progress.dart';
import '../../widget/progress/circular_progress.dart';
import '../../widget/provider/provider_widget.dart';

class ProgressScreen extends StatefulWidget {
  static const String routeName = 'progress';

  const ProgressScreen({Key? key}) : super(key: key);

  @override
  ProgressScreenState createState() => ProgressScreenState();
}

class ProgressScreenState extends State<ProgressScreen>
    implements ProgressNavigator {
  ProgressVm? viewModel;
  Size? size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return ProviderWidget<ProgressVm>(
      create: () => GetIt.I()..init(this),
      childBuilderWithViewModel: (context, viewModel, theme, localization) {
        viewModel = viewModel;
        return screenWidget(context);
      },
    );
  }

  Widget screenWidget(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: viewModel!.isBusy
          ? const CircularProgress()
          : Stack(
              children: [
                backgroundProgress(),
                foregroundProgress(),
              ],
            ),
    );
  }

  Widget backgroundProgress() {
    return RotatedBox(
      quarterTurns: 7,
      child: SizedBox(
        height: size!.width,
        child: LinearPercentIndicator(
          percent: double.parse(
            (viewModel!.progress / 100).toStringAsFixed(1),
          ),
          lineHeight: size!.width,
          backgroundColor: Colors.black,
          progressColor: ThemeColors.primaryDark,
        ),
      ),
    );
  }

  Widget foregroundProgress() {
    return Center(
      child: AdvancedProgress(
        radius: size!.width / 2.5,
        levelAmount: 100,
        levelLowHeight: 16,
        levelHighHeight: 20,
        division: 10,
        secondaryWidth: 10,
        progressGap: 10,
        primaryValue: viewModel!.progress / 100,
        secondaryValue: viewModel!.progress / 100,
        primaryColor: Colors.yellow,
        secondaryColor: Colors.red,
        tertiaryColor: Colors.white24,
        child: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: size!.width / 5,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Text(
                  '${viewModel!.progress} %',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w400,
                    fontSize: size!.width / 5,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: size!.width / 6,
                child: Center(
                  child: Text(
                    viewModel!.state.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w800,
                      fontSize: size!.width / 20,
                      color: Colors.white24,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Time Left',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: size!.width / 25,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      viewModel!.time,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: size!.width / 15,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void goToHome() => MainNavigatorWidget.of(context).goToHome();
}
