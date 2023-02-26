import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

import '../../navigator/main_navigator.dart';
import '../../navigator/mixin/back_navigator.dart';
import '../../navigator/route_names.dart';
import '../../theme/theme_colors.dart';
import '../../vm/songs/presentor_vm.dart';
import '../../widget/general/projectable.dart';
import '../../widget/progress/circular_progress.dart';
import '../../widget/provider/provider_widget.dart';

class CloseIntent extends Intent {
  const CloseIntent();
}

class NextIntent extends Intent {
  const NextIntent();
}

class PreviousIntent extends Intent {
  const PreviousIntent();
}

/// Screen to present a song in slide format
class ProjectorScreen extends StatefulWidget {
  static const String routeName = RouteNames.projectorScreen;
  const ProjectorScreen({Key? key}) : super(key: key);

  @override
  ProjectorScreenState createState() => ProjectorScreenState();
}

@visibleForTesting
class ProjectorScreenState extends State<ProjectorScreen>
    with BackNavigatorMixin
    implements PresentorNavigator {
  Size? size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return ProviderWidget<PresentorVm>(
      create: () => GetIt.I()..init(this),
      consumerWithThemeAndLocalization:
          (context, vm, child, theme, localization) {
        vm.size = size;

        var projection = Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: Container(),
            title: Text(
              '${vm.songTitle} - ${vm.songBook}',
              style: const TextStyle(fontSize: 30),
            ),
          ),
          body: Container(
            height: size!.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.white,
                  Colors.orange,
                  ThemeColors.accent,
                  ThemeColors.primary,
                  Colors.black,
                ],
              ),
            ),
            child: SizedBox(
              child: vm.isLoading
                  ? const CircularProgress()
                  : Projectable(
                      index: vm.curSlide,
                      infos: vm.verseInfos,
                      contents: vm.widgetContent,
                      tabsWidth: size!.height * 0.08156,
                      indicatorWidth: size!.height * 0.08156,
                    ),
            ),
          ),
        );
        return Shortcuts(
          shortcuts: const <ShortcutActivator, Intent>{
            SingleActivator(LogicalKeyboardKey.escape): CloseIntent(),
            SingleActivator(LogicalKeyboardKey.arrowUp): PreviousIntent(),
            SingleActivator(LogicalKeyboardKey.arrowDown): NextIntent(),
          },
          child: Actions(
            actions: <Type, Action<Intent>>{
              CloseIntent: CallbackAction<CloseIntent>(
                onInvoke: (CloseIntent intent) => vm.navigator.goBack(),
              ),
              PreviousIntent: CallbackAction<PreviousIntent>(
                onInvoke: (PreviousIntent intent) => setState(() {
                  if (vm.curSlide != 0) vm.curSlide = vm.curSlide - 1;
                }),
              ),
              NextIntent: CallbackAction<NextIntent>(
                onInvoke: (NextIntent intent) => setState(() {
                  if (vm.curSlide < vm.widgetContent.length) {
                    vm.curSlide = vm.curSlide + 1;
                  }
                }),
              ),
            },
            child: Focus(autofocus: true, child: projection),
          ),
        );
      },
    );
  }

  @override
  void goToEditor() => MainNavigatorWidget.of(context).goToEditor();
}
