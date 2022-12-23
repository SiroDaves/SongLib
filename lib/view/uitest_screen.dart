import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../util/constants/app_constants.dart';
import '../../widget/progress/advanced/advanced_progress.dart';
import '../../widget/provider/provider_widget.dart';
import '../navigator/main_navigator.dart';
import '../theme/theme_colors.dart';
import '../viewmodel/uitest_vm.dart';

/// Screen to build a complex ui before adding to the app
class UiTestScreen extends StatefulWidget {
  static const String routeName = 'uitest';

  const UiTestScreen({Key? key}) : super(key: key);

  @override
  UiTestScreenState createState() => UiTestScreenState();
}

class UiTestScreenState extends State<UiTestScreen> implements UiTestNavigator {
  UiTestVm? vm;
  Size? size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return ProviderWidget<UiTestVm>(
      create: () => GetIt.I()..init(this),
      childBuilderWithViewModel: (context, viewModel, theme, localization) {
        vm = viewModel;
        return screenWidget(context);
      },
    );
  }

  Widget screenWidget(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(AppConstants.booksTitleLoading),
      ),
      body: Stack(
        children: [
          backgroundWidget(),
          progressWidget(),
        ],
      ),
    );
  }

  Widget backgroundWidget() {
    return RotatedBox(
      quarterTurns: 7,
      child: SizedBox(
        height: size!.width,
        child: LinearPercentIndicator(
          percent: double.parse(
            (vm!.progress / 100).toStringAsFixed(1),
          ),
          lineHeight: size!.width,
          backgroundColor: Colors.black,
          progressColor: ThemeColors.primaryDark,
        ),
      ),
    );
  }

  Widget progressWidget() {
    return Center(
      child: AdvancedProgress(
        radius: size!.width / 2.5,
        levelAmount: 100,
        levelLowHeight: 16,
        levelHighHeight: 20,
        division: 10,
        secondaryWidth: 10,
        progressGap: 10,
        primaryValue: vm!.progress / 100,
        secondaryValue: vm!.progress / 100,
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
                  '${vm!.progress} %',
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
                    vm!.state,
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
                      vm!.time,
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
