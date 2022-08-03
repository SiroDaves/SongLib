import 'package:songlib/navigator/main_navigator.dart';
import 'package:songlib/screen_game/game_manager.dart';
import 'package:songlib/vm/game/game_vm.dart';
import 'package:songlib/widget/game/follow_widget.dart';
import 'package:songlib/widget/game/pause_widget.dart';
import 'package:songlib/widget/game/tutorial_widget.dart';
import 'package:songlib/widget/provider/data_provider_widget.dart';
import 'package:songlib/widget/provider/provider_widget.dart';
import 'package:songlib/widget_game/data/play_settings.dart';
import 'package:songlib/widget_game/positions/sprint.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class GameScreen extends StatefulWidget {
  static const String routeName = 'game';
  final PlaySettings playSettings;

  const GameScreen({
    required this.playSettings,
    Key? key,
  }) : super(key: key);

  @override
  GameScreenState createState() => GameScreenState();
}

class GameScreenState extends State<GameScreen> implements GameNavigator {
  final _gameManager = GameManager();

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderLocalization: (context, localization) => Stack(
        children: [
          GameWidget(
            game: _gameManager,
          ),
          ProviderWidget<GameVm>(
            create: () => GetIt.I()..init(this, localization, widget.playSettings, _gameManager),
            childBuilderWithViewModel: (context, viewModel, theme, _) => WillPopScope(
              onWillPop: () async {
                viewModel.onBackPressed();
                return false;
              },
              child: Builder(
                builder: (context) {
                  if (viewModel.tutorialType != null) {
                    return TutorialWidget(
                      tutorialType: viewModel.tutorialType!,
                      onDismiss: viewModel.onTutorialDismiss,
                    );
                  }
                  if (viewModel.showFollowDialog) {
                    return FollowWidget(
                      onFollow: viewModel.onFollow,
                      followAmount: viewModel.followAmount,
                    );
                  }
                  if (viewModel.isPaused) {
                    return PauseWidget(
                      onContinue: viewModel.onContinue,
                      onSave: viewModel.onSave,
                      onStop: viewModel.onStop,
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Future<void> goToMainMenu() async => MainNavigatorWidget.of(context).goToHome();

  @override
  Future<void> goToResults(List<Sprint> sprints, bool isTour, bool isCareer) async => MainNavigatorWidget.of(context).goToResults(sprints, isTour, isCareer);
}
