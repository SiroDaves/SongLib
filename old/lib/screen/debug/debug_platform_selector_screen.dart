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

class DebugPlatformSelectorScreen extends StatefulWidget {
  static const String routeName = RouteNames.debugPlatformSelectorScreen;

  const DebugPlatformSelectorScreen({
    Key? key,
  }) : super(key: key);

  @override
  DebugPlatformSelectorScreenState createState() => DebugPlatformSelectorScreenState();
}

@visibleForTesting
class DebugPlatformSelectorScreenState extends State<DebugPlatformSelectorScreen> with BackNavigatorMixin implements DebugPlatformSelectorNavigator {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<DebugPlatformSelectorVm>(
      childBuilderWithViewModel: (context, value, theme, localization) => Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          leading: SongLibBackButton.light(onClick: value.onBackClicked),
          title: Text(
            'Select a platform',
            style: theme.coreTextTheme.titleNormal,
          ),
        ),
        body: Consumer<GlobalVm>(
          builder: (context, viewModel, child) => ListView(
            children: [
              SelectorItem(
                title: 'Default',
                onClick: viewModel.setSelectedPlatformToDefault,
                selected: viewModel.targetPlatform == null,
              ),
              SelectorItem(
                title: 'Android',
                onClick: viewModel.setSelectedPlatformToAndroid,
                selected: viewModel.targetPlatform == TargetPlatform.android,
              ),
              SelectorItem(
                title: 'Ios',
                onClick: viewModel.setSelectedPlatformToIOS,
                selected: viewModel.targetPlatform == TargetPlatform.iOS,
              ),
            ],
          ),
        ),
      ),
      create: () => GetIt.I()..init(this),
    );
  }
}
