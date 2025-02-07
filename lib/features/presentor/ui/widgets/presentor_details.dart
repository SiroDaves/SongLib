part of '../presentor_screen.dart';

class PresentorDetails extends StatelessWidget {
  final PresentorScreenState parent;
  final bool isBigScreen;
  const PresentorDetails({
    super.key,
    required this.parent,
    this.isBigScreen = false,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var presentation = parent.widgetTabs.isNotEmpty
        ? PresentorView(
            index: parent.currentSlide,
            songbook: parent.songBook,
            tabs: parent.widgetTabs,
            contents: parent.widgetContent,
            tabsWidth: size.height * 0.08156,
            indicatorWidth: size.height * 0.08156,
            contentScrollAxis:
                parent.slideHorizontal ? Axis.horizontal : Axis.vertical,
          )
        : SizedBox(
            height: size.height,
            width: size.width,
          );

    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      return Shortcuts(
        shortcuts: const <ShortcutActivator, Intent>{
          SingleActivator(LogicalKeyboardKey.escape): CloseIntent(),
          SingleActivator(LogicalKeyboardKey.arrowUp): PreviousIntent(),
          SingleActivator(LogicalKeyboardKey.arrowDown): NextIntent(),
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
          SingleActivator(LogicalKeyboardKey.keyC): ChorusIntent(),
          SingleActivator(LogicalKeyboardKey.keyS): VerseSecondLastIntent(),
          SingleActivator(LogicalKeyboardKey.keyL): VerseLastIntent(),
        },
        child: Actions(
          actions: <Type, Action<Intent>>{
            CloseIntent: CallbackAction<CloseIntent>(
              onInvoke: (CloseIntent intent) => Navigator.pop(context, true),
            ),
            PreviousIntent: CallbackAction<PreviousIntent>(
              onInvoke: (PreviousIntent intent) => parent.setPreviousSlide,
            ),
            NextIntent: CallbackAction<NextIntent>(
              onInvoke: (NextIntent intent) => parent.setNextSlide,
            ),
            VerseOneIntent: CallbackAction<VerseOneIntent>(
              onInvoke: (VerseOneIntent intent) => parent.setSlideByNumber(1),
            ),
            VerseTwoIntent: CallbackAction<VerseTwoIntent>(
              onInvoke: (VerseTwoIntent intent) => parent.setSlideByNumber(2),
            ),
            VerseThreeIntent: CallbackAction<VerseThreeIntent>(
              onInvoke: (VerseThreeIntent intent) => parent.setSlideByNumber(3),
            ),
            VerseFourIntent: CallbackAction<VerseFourIntent>(
              onInvoke: (VerseFourIntent intent) => parent.setSlideByNumber(4),
            ),
            VerseFiveIntent: CallbackAction<VerseFiveIntent>(
              onInvoke: (VerseFiveIntent intent) => parent.setSlideByNumber(5),
            ),
            VerseSixIntent: CallbackAction<VerseSixIntent>(
              onInvoke: (VerseSixIntent intent) => parent.setSlideByNumber(6),
            ),
            VerseSevenIntent: CallbackAction<VerseSevenIntent>(
              onInvoke: (VerseSevenIntent intent) => parent.setSlideByNumber(7),
            ),
            ChorusIntent: CallbackAction<ChorusIntent>(
              onInvoke: (ChorusIntent intent) => parent.setSlideByLetter('C'),
            ),
            VerseSecondLastIntent: CallbackAction<VerseSecondLastIntent>(
              onInvoke: (VerseSecondLastIntent intent) {
                return parent.setSlideByLetter('S');
              },
            ),
            VerseLastIntent: CallbackAction<VerseLastIntent>(
              onInvoke: (VerseLastIntent intent) =>
                  parent.setSlideByLetter('L'),
            ),
            SmallerFontIntent: CallbackAction<SmallerFontIntent>(
              onInvoke: (SmallerFontIntent intent) => null,
            ),
            BiggerFontIntent: CallbackAction<BiggerFontIntent>(
              onInvoke: (BiggerFontIntent intent) => null,
            ),
          },
          child: Focus(autofocus: true, child: presentation),
        ),
      );
    } else {
      return presentation;
    }
  }
}
