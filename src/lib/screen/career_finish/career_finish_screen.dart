import 'package:songlib/navigator/main_navigator.dart';
import 'package:songlib/screen/base/simple_menu_screen.dart';
import 'package:songlib/vm/career_finish/career_finish_vm.dart';
import 'package:songlib/widget/general/styled/songlib_button.dart';
import 'package:songlib/widget/menu_background/menu_box.dart';
import 'package:songlib/widget/provider/provider_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class CareerFinishScreen extends StatefulWidget {
  static const String routeName = 'career_finish';

  const CareerFinishScreen({Key? key}) : super(key: key);

  @override
  CareerFinishScreenState createState() => CareerFinishScreenState();
}

class CareerFinishScreenState extends State<CareerFinishScreen> implements CareerFinishNavigator {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<CareerFinishVm>(
      create: () => GetIt.I()..init(this),
      childBuilderWithViewModel: (context, viewModel, theme, localization) => SimpleMenuScreen(
        child: MenuBox(
          title: localization.careerFinishTitle,
          wide: true,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: AspectRatio(
              aspectRatio: 2.22,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    viewModel.hasWonSingle ? localization.careerSingleWon : localization.careerSingleLost,
                    style: theme.coreTextTheme.bodyNormal,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    localization.careerSinglePoints(viewModel.singlePoints),
                    style: theme.coreTextTheme.bodyNormal,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    viewModel.hasWonTeam ? localization.careerTeamWon : localization.careerTeamLost,
                    style: theme.coreTextTheme.bodyNormal,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    localization.careerTeamPoints(viewModel.teamPoints),
                    style: theme.coreTextTheme.bodyNormal,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    viewModel.hasWonSingle && viewModel.hasWonTeam ? localization.careerTotalWon : localization.careerTotalLost,
                    style: theme.coreTextTheme.bodyNormal,
                  ),
                  const SizedBox(height: 8),
                  SongLibButton(
                    text: localization.continueButton,
                    onClick: viewModel.onFinishPressed,
                    type: SongLibButtonType.green,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void goToHome() => MainNavigatorWidget.of(context).goToHome();
}
