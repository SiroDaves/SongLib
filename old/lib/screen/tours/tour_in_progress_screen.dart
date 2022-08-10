import 'package:songlib/navigator/main_navigator.dart';
import 'package:songlib/navigator/mixin/back_navigator.dart';
import 'package:songlib/screen/base/simple_menu_screen.dart';
import 'package:songlib/vm/tours/tour_in_progress_vm.dart';
import 'package:songlib/widget/general/styled/songlib_button.dart';
import 'package:songlib/widget/menu_background/menu_box.dart';
import 'package:songlib/widget/provider/provider_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class TourInProgressScreen extends StatefulWidget {
  static const String routeName = 'tour_in_progress';

  const TourInProgressScreen({Key? key}) : super(key: key);

  @override
  TourInProgressScreenState createState() => TourInProgressScreenState();
}

class TourInProgressScreenState extends State<TourInProgressScreen> with BackNavigatorMixin implements TourInProgressNavigator {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<TourInProgressVm>(
      create: () => GetIt.I()..init(this),
      childBuilderWithViewModel: (context, viewModel, theme, localization) => SimpleMenuScreen(
        child: MenuBox(
          title: localization.tourInProgressTitle,
          onClosePressed: viewModel.onClosePressed,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.6,
            padding: const EdgeInsets.all(8),
            child: AspectRatio(
              aspectRatio: 1.3,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 8),
                  Text(
                    localization.tourInProgressText,
                    style: theme.coreTextTheme.bodyNormal,
                  ),
                  const Spacer(),
                  SongLibButton(
                    text: localization.continueButton,
                    type: SongLibButtonType.green,
                    onClick: viewModel.onContinuePressed,
                  ),
                  SongLibButton(
                    text: localization.startNewTourButton,
                    onClick: viewModel.onNewTourPressed,
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
  void goToActiveTour() => MainNavigatorWidget.of(context).goToActiveTour();

  @override
  void goToSelectTour() => MainNavigatorWidget.of(context).goToTourSelect();
}
