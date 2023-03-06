import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

import '../../../navigator/main_navigator.dart';
import '../../../navigator/mixin/back_navigator.dart';
import '../../../navigator/route_names.dart';
import '../../../theme/theme_colors.dart';
import '../../../util/big_screen_intents.dart';
import '../../../vm/drafts/draft_presentor_vm.dart';
import '../../../widget/general/present_on_pc.dart';
import '../../../widget/progress/circular_progress.dart';
import '../../../widget/provider/provider_widget.dart';

/// Screen to present a draft in slide format
class DraftPresentorPc extends StatefulWidget {
  static const String routeName = RouteNames.presentDraftPc;
  const DraftPresentorPc({Key? key}) : super(key: key);

  @override
  DraftPresentorPcState createState() => DraftPresentorPcState();
}

@visibleForTesting
class DraftPresentorPcState extends State<DraftPresentorPc>
    with BackNavigatorMixin
    implements DraftPresentorNavigator {
  Size? size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return ProviderWidget<DraftPresentorVm>(
      create: () => GetIt.I()..init(this),
      consumerWithThemeAndLocalization:
          (context, vm, child, theme, localization) {
        vm.size = size;

        var projection = Scaffold(
          appBar: AppBar(
            centerTitle: true,
            leading: Container(),
            title: Text(
              vm.draftTitle,
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
                  : PresentOnPc(
                      index: vm.curSlide,
                      infos: vm.verseInfos,
                      contents: vm.widgetContent,
                      tabsWidth: size!.height * 0.08156,
                      indicatorWidth: size!.height * 0.08156,
                      onSelect: (index) => setState(() {
                        vm.curSlide = index!;
                      }),
                    ),
            ),
          ),
        );
        return Shortcuts(
          shortcuts: const <ShortcutActivator, Intent>{
            SingleActivator(LogicalKeyboardKey.escape): CloseIntent(),
            SingleActivator(LogicalKeyboardKey.arrowUp): PreviousIntent(),
            SingleActivator(LogicalKeyboardKey.arrowDown): NextIntent(),
            SingleActivator(LogicalKeyboardKey.keyC): ChorusIntent(),
            SingleActivator(LogicalKeyboardKey.numpad1): VerseOneIntent(),
            SingleActivator(LogicalKeyboardKey.digit1): VerseOneIntent(),
            SingleActivator(LogicalKeyboardKey.numpad2): VerseTwoIntent(),
            SingleActivator(LogicalKeyboardKey.digit2): VerseTwoIntent(),
            SingleActivator(LogicalKeyboardKey.numpad3): VerseThreeIntent(),
            SingleActivator(LogicalKeyboardKey.digit3): VerseThreeIntent(),
            SingleActivator(LogicalKeyboardKey.numpad4): VerseFourIntent(),
            SingleActivator(LogicalKeyboardKey.digit4): VerseFourIntent(),
            SingleActivator(LogicalKeyboardKey.numpad5): VerseFiveIntent(),
            SingleActivator(LogicalKeyboardKey.digit5): VerseFiveIntent(),
            SingleActivator(LogicalKeyboardKey.numpad6): VerseSixIntent(),
            SingleActivator(LogicalKeyboardKey.digit6): VerseSixIntent(),
            SingleActivator(LogicalKeyboardKey.numpad7): VerseSevenIntent(),
            SingleActivator(LogicalKeyboardKey.digit7): VerseSevenIntent(),
            SingleActivator(LogicalKeyboardKey.keyL): VerseLastIntent(),
            SingleActivator(LogicalKeyboardKey.keyS): VerseSecondLastIntent(),
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
              ChorusIntent: CallbackAction<ChorusIntent>(
                onInvoke: (ChorusIntent intent) => setState(() {
                  if (vm.hasChorus) {
                    vm.curSlide = 1;
                  }
                }),
              ),
              VerseOneIntent: CallbackAction<VerseOneIntent>(
                onInvoke: (VerseOneIntent intent) => setState(() {
                  vm.curSlide = 0;
                }),
              ),
              VerseTwoIntent: CallbackAction<VerseTwoIntent>(
                onInvoke: (VerseTwoIntent intent) => setState(() {
                  if (vm.hasChorus) {
                    if (vm.widgetContent.length <= 3) {
                      vm.curSlide = 2;
                    }
                  } else {
                    if (vm.widgetContent.length <= 2) {
                      vm.curSlide = 1;
                    }
                  }
                }),
              ),
              VerseThreeIntent: CallbackAction<VerseThreeIntent>(
                onInvoke: (VerseThreeIntent intent) => setState(() {
                  if (vm.hasChorus) {
                    if (vm.widgetContent.length <= 5) {
                      vm.curSlide = 4;
                    }
                  } else {
                    if (vm.widgetContent.length <= 3) {
                      vm.curSlide = 2;
                    }
                  }
                }),
              ),
              VerseFourIntent: CallbackAction<VerseFourIntent>(
                onInvoke: (VerseFourIntent intent) => setState(() {
                  if (vm.hasChorus) {
                    if (vm.widgetContent.length <= 7) {
                      vm.curSlide = 6;
                    }
                  } else {
                    if (vm.widgetContent.length <= 4) {
                      vm.curSlide = 3;
                    }
                  }
                }),
              ),
              VerseFiveIntent: CallbackAction<VerseFiveIntent>(
                onInvoke: (VerseFiveIntent intent) => setState(() {
                  if (vm.hasChorus) {
                    if (vm.widgetContent.length <= 9) {
                      vm.curSlide = 8;
                    }
                  } else {
                    if (vm.widgetContent.length <= 5) {
                      vm.curSlide = 4;
                    }
                  }
                }),
              ),
              VerseSixIntent: CallbackAction<VerseSixIntent>(
                onInvoke: (VerseSixIntent intent) => setState(() {
                  if (vm.hasChorus) {
                    if (vm.widgetContent.length <= 11) {
                      vm.curSlide = 10;
                    }
                  } else {
                    if (vm.widgetContent.length <= 6) {
                      vm.curSlide = 5;
                    }
                  }
                }),
              ),
              VerseSevenIntent: CallbackAction<VerseSevenIntent>(
                onInvoke: (VerseSevenIntent intent) => setState(() {
                  if (vm.hasChorus) {
                    if (vm.widgetContent.length <= 13) {
                      vm.curSlide = 12;
                    }
                  } else {
                    if (vm.widgetContent.length <= 7) {
                      vm.curSlide = 6;
                    }
                  }
                }),
              ),
              VerseLastIntent: CallbackAction<VerseLastIntent>(
                onInvoke: (VerseLastIntent intent) => setState(() {
                  if (vm.hasChorus) {
                    vm.curSlide = vm.widgetContent.length - 2;
                  } else {
                    vm.curSlide = vm.widgetContent.length - 1;
                  }
                }),
              ),
              VerseSecondLastIntent: CallbackAction<VerseSecondLastIntent>(
                onInvoke: (VerseSecondLastIntent intent) => setState(() {
                  if (vm.hasChorus) {
                    vm.curSlide = vm.widgetContent.length - 4;
                  } else {
                    vm.curSlide = vm.widgetContent.length - 2;
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
  void goToDraftEditor(bool notEmpty) =>
      MainNavigator.of(context).goToDraftEditor(notEmpty);

  @override
  void goToDraftEditorPc(bool notEmpty) =>
      MainNavigator.of(context).goToDraftEditorPc(notEmpty);
}
