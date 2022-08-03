import 'package:songlib/navigator/mixin/back_navigator.dart';
import 'package:songlib/navigator/route_names.dart';
import 'package:songlib/vm/debug/debug_platform_selector_vm.dart';
import 'package:songlib/vm/global/global_vm.dart';
import 'package:songlib/widget/debug/selector_item.dart';
import 'package:songlib/widget/general/styled/songlib_back_button.dart';
import 'package:songlib/widget/provider/provider_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

class ThemeModeSelectorScreen extends StatefulWidget {
  static const String routeName = RouteNames.themeModeSelectorScreen;

  const ThemeModeSelectorScreen({
    Key? key,
  }) : super(key: key);

  @override
  ThemeModeSelectorScreenState createState() => ThemeModeSelectorScreenState();
}

@visibleForTesting
class ThemeModeSelectorScreenState extends State<ThemeModeSelectorScreen> with BackNavigatorMixin implements DebugPlatformSelectorNavigator {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<DebugPlatformSelectorVm>(
      childBuilderWithViewModel: (context, value, _, localization) => Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          leading: SongLibBackButton.light(onClick: value.onBackClicked),
          title: const Text('Select a theme mode'),
        ),
        body: Consumer<GlobalVm>(
          builder: (context, viewModel, child) => ListView(
            children: [
              SelectorItem(
                title: 'Default',
                onClick: () => viewModel.updateThemeMode(ThemeMode.system),
                selected: viewModel.themeMode == ThemeMode.system,
              ),
              SelectorItem(
                title: 'Light',
                onClick: () => viewModel.updateThemeMode(ThemeMode.light),
                selected: viewModel.themeMode == ThemeMode.light,
              ),
              SelectorItem(
                title: 'Dark',
                onClick: () => viewModel.updateThemeMode(ThemeMode.dark),
                selected: viewModel.themeMode == ThemeMode.dark,
              ),
            ],
          ),
        ),
      ),
      create: () => GetIt.I()..init(this),
    );
  }
}
