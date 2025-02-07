part of '../presentor_screen.dart';

class PresentorBody extends StatelessWidget {
  final String bgImage;
  final List<Tab> widgetTabs;
  final List<Widget> widgetContent;
  final bool slideHorizontal;
  final int curSlide;
  final String songBook;

  const PresentorBody({
    super.key,
    required this.bgImage,
    required this.widgetTabs,
    required this.widgetContent,
    required this.slideHorizontal,
    required this.curSlide,
    required this.songBook,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var presentation = DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(bgImage),
          fit: BoxFit.cover,
        ),
      ),
      child: widgetTabs.isNotEmpty
          ? PresentorView(
              index: curSlide,
              songbook: songBook,
              tabs: widgetTabs,
              contents: widgetContent,
              tabsWidth: size.height * 0.08156,
              indicatorWidth: size.height * 0.08156,
              contentScrollAxis:
                  slideHorizontal ? Axis.horizontal : Axis.vertical,
            )
          : SizedBox(
              height: size.height,
              width: size.width,
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
        //SingleActivator(LogicalKeyboardKey.arrowRight): BiggerFontIntent(),
        //SingleActivator(LogicalKeyboardKey.arrowLeft): SmallerFontIntent(),
      },
      child: Actions(
        actions: <Type, Action<Intent>>{
          CloseIntent: CallbackAction<CloseIntent>(
            onInvoke: (CloseIntent intent) => {},//vm.navigator.goBack(),
          ),
          PreviousIntent: CallbackAction<PreviousIntent>(
            onInvoke: (PreviousIntent intent) => {
              //if (vm.curSlide != 0)
              //  setState(() => vm.curSlide = vm.curSlide - 1),
            },
          ),
          NextIntent: CallbackAction<NextIntent>(
            onInvoke: (NextIntent intent) => {
              //if (vm.curSlide < vm.widgetContent.length)
              //  setState(() => vm.curSlide = vm.curSlide + 1),
            },
          ),
          ChorusIntent: CallbackAction<ChorusIntent>(
            onInvoke: (ChorusIntent intent) => {
              //if (vm.hasChorus) setState(() => vm.curSlide = 1),
            },
          ),
          VerseOneIntent: CallbackAction<VerseOneIntent>(
            onInvoke: (VerseOneIntent intent) =>
               {}// setState(() => vm.curSlide = 0),
          ),
          VerseTwoIntent: CallbackAction<VerseTwoIntent>(
            onInvoke: (VerseTwoIntent intent) => {
              /*if (vm.hasChorus && vm.widgetContent.length >= 3)
                setState(() => vm.curSlide = 2)
              else if (vm.widgetContent.length >= 2)
                setState(() => vm.curSlide = 1)*/
            },
          ),
          VerseThreeIntent: CallbackAction<VerseThreeIntent>(
            onInvoke: (VerseThreeIntent intent) => {
              /*if (vm.hasChorus && vm.widgetContent.length >= 5)
                setState(() => vm.curSlide = 4)
              else if (vm.widgetContent.length >= 3)
                setState(() => vm.curSlide = 2)*/
            },
          ),
          VerseFourIntent: CallbackAction<VerseFourIntent>(
            onInvoke: (VerseFourIntent intent) => {
              /*if (vm.hasChorus && vm.widgetContent.length >= 7)
                setState(() => vm.curSlide = 6)
              else if (vm.widgetContent.length >= 2)
                setState(() => vm.curSlide = 3)*/
            },
          ),
          VerseFiveIntent: CallbackAction<VerseFiveIntent>(
            onInvoke: (VerseFiveIntent intent) => {
              /*if (vm.hasChorus && vm.widgetContent.length >= 9)
                setState(() => vm.curSlide = 8)
              else if (vm.widgetContent.length >= 5)
                setState(() => vm.curSlide = 2)*/
            },
          ),
          VerseSixIntent: CallbackAction<VerseSixIntent>(
            onInvoke: (VerseSixIntent intent) => {
              /*if (vm.hasChorus && vm.widgetContent.length >= 11)
                setState(() => vm.curSlide = 10)
              else if (vm.widgetContent.length >= 6)
                setState(() => vm.curSlide = 5)*/
            },
          ),
          VerseSevenIntent: CallbackAction<VerseSevenIntent>(
            onInvoke: (VerseSevenIntent intent) => {
              /*if (vm.hasChorus && vm.widgetContent.length >= 13)
                setState(() => vm.curSlide = 12)
              else if (vm.widgetContent.length >= 7)
                setState(() => vm.curSlide = 6)*/
            },
          ),
          VerseLastIntent: CallbackAction<VerseLastIntent>(
            onInvoke: (VerseLastIntent intent) => {
              /*if (vm.hasChorus)
                setState(() => vm.curSlide = vm.widgetContent.length - 2)
              else
                setState(() => vm.curSlide = vm.widgetContent.length - 1)*/
            },
          ),
          VerseSecondLastIntent: CallbackAction<VerseSecondLastIntent>(
            onInvoke: (VerseSecondLastIntent intent) => {
              /*if (vm.hasChorus)
                setState(() => vm.curSlide = vm.widgetContent.length - 4)
              else
                setState(() => vm.curSlide = vm.widgetContent.length - 2)*/
            },
          ),
          SmallerFontIntent: CallbackAction<SmallerFontIntent>(
            onInvoke: (SmallerFontIntent intent) {
              /*if (vm.fSize > 5) {
                setState(() => vm.curSlide = 0);
                setState(() => vm.fSize = vm.fSize - 3);
                vm.loadPresentor();
              }
              return null;*/
            },
          ),
          BiggerFontIntent: CallbackAction<BiggerFontIntent>(
            onInvoke: (BiggerFontIntent intent) {
              /*if (vm.fSize < 100) {
                setState(() => vm.curSlide = 0);
                setState(() => vm.fSize = vm.fSize + 3);
                vm.loadPresentor();
              }
              return null;*/
            },
          ),
        },
        child: Focus(autofocus: true, child: presentation),
      ),
    );
  }
}
