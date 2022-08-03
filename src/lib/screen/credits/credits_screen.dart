import 'package:songlib/navigator/mixin/back_navigator.dart';
import 'package:songlib/screen/base/simple_menu_screen.dart';
import 'package:songlib/vm/credits/credits_vm.dart';
import 'package:songlib/widget/general/styled/songlib_button.dart';
import 'package:songlib/widget/menu_background/menu_box.dart';
import 'package:songlib/widget/provider/provider_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class CreditsScreen extends StatefulWidget {
  static const String routeName = 'credits';

  const CreditsScreen({Key? key}) : super(key: key);

  @override
  CreditsScreenState createState() => CreditsScreenState();
}

class CreditsScreenState extends State<CreditsScreen> with BackNavigatorMixin implements CreditsNavigator {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<CreditsVm>(
      create: () => GetIt.I()..init(this),
      childBuilderWithViewModel: (context, viewModel, theme, localization) => SimpleMenuScreen(
        child: MenuBox(
          title: localization.creditsTitle,
          wide: true,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 48),
            height: MediaQuery.of(context).size.height * 0.7,
            child: AspectRatio(
              aspectRatio: 2.1,
              child: Column(
                children: [
                  Expanded(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        localization.creditsText,
                        style: theme.coreTextTheme.bodyNormal,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SongLibButton(
                    text: localization.backButton,
                    onClick: viewModel.onBackPressed,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
