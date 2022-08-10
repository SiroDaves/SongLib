import 'package:songlib/navigator/mixin/back_navigator.dart';
import 'package:songlib/screen/base/simple_menu_screen.dart';
import 'package:songlib/vm/information/information_vm.dart';
import 'package:songlib/widget/general/styled/songlib_button.dart';
import 'package:songlib/widget/menu_background/menu_box.dart';
import 'package:songlib/widget/provider/provider_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class InformationScreen extends StatefulWidget {
  static const String routeName = 'information';

  const InformationScreen({Key? key}) : super(key: key);

  @override
  InformationScreenState createState() => InformationScreenState();
}

class InformationScreenState extends State<InformationScreen> with BackNavigatorMixin implements InformationNavigator {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<InformationVm>(
      create: () => GetIt.I()..init(this),
      childBuilderWithViewModel: (context, viewModel, theme, localization) => SimpleMenuScreen(
        child: MenuBox(
          title: localization.careerInfoTitle,
          onClosePressed: viewModel.onBackPressed,
          wide: true,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: AspectRatio(
              aspectRatio: 2.22,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Text(
                    localization.discordServerIntro,
                    style: theme.coreTextTheme.bodyNormal,
                  ),
                  const SizedBox(height: 8),
                  SongLibButton(
                    text: 'open',
                    onClick: () => viewModel.launchDiscord(localization),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
