part of '../presentor_screen.dart';

class PresentorDetails extends StatefulWidget {
  final PresentorScreenState parent;
  final bool isBigScreen;

  const PresentorDetails({
    super.key,
    required this.parent,
    this.isBigScreen = false,
  });

  @override
  State<PresentorDetails> createState() => PresentorDetailsState();
}

class PresentorDetailsState extends State<PresentorDetails> {
  late PresentorScreenState parent;
  int currentSlide = 0;

  @override
  void initState() {
    super.initState();
    parent = widget.parent;
  }

  void setSlideByNumber(int slide) {
    setState(() {
      currentSlide = getSlideByNumber(
          slide, parent.hasChorus, parent.widgetContent.length);
    });
  }

  void setSlideByLetter(String slide) {
    setState(() {
      currentSlide = getSlideByLetter(
          slide, parent.hasChorus, parent.widgetContent.length);
    });
  }

  void setPreviousSlide() {
    if (currentSlide != 0) {
      setState(() => currentSlide = currentSlide - 1);
    }
  }

  void setNextSlide() {
    if (currentSlide < parent.widgetContent.length) {
      setState(() => currentSlide = currentSlide + 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var presentation = parent.widgetTabs.isNotEmpty
        ? PresentorSlide(
            key: ValueKey(currentSlide),
            index: currentSlide,
            songbook: parent.songBook,
            tabs: parent.widgetTabs,
            contents: parent.widgetContent,
            tabsWidth: size.height * 0.08156,
            indicatorWidth: size.height * 0.08156,
            isBigScreen: widget.isBigScreen,
          )
        : SizedBox(
            height: size.height,
            width: size.width,
          );

    if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
      return Shortcuts(
        shortcuts: <ShortcutActivator, Intent>{
          // Escape Key
          SingleActivator(LogicalKeyboardKey.escape): CloseIntent(),

          // Arrow Keys for Navigation
          SingleActivator(LogicalKeyboardKey.arrowUp): PreviousIntent(),
          SingleActivator(LogicalKeyboardKey.arrowDown): NextIntent(),

          SingleActivator(LogicalKeyboardKey.digit1): SlideNumberIntent(1),
          SingleActivator(LogicalKeyboardKey.digit2): SlideNumberIntent(2),
          SingleActivator(LogicalKeyboardKey.digit3): SlideNumberIntent(3),
          SingleActivator(LogicalKeyboardKey.digit4): SlideNumberIntent(4),
          SingleActivator(LogicalKeyboardKey.digit5): SlideNumberIntent(5),
          SingleActivator(LogicalKeyboardKey.digit6): SlideNumberIntent(6),
          SingleActivator(LogicalKeyboardKey.digit7): SlideNumberIntent(7),

          SingleActivator(LogicalKeyboardKey.numpad1): SlideNumberIntent(1),
          SingleActivator(LogicalKeyboardKey.numpad2): SlideNumberIntent(2),
          SingleActivator(LogicalKeyboardKey.numpad3): SlideNumberIntent(3),
          SingleActivator(LogicalKeyboardKey.numpad4): SlideNumberIntent(4),
          SingleActivator(LogicalKeyboardKey.numpad5): SlideNumberIntent(5),
          SingleActivator(LogicalKeyboardKey.numpad6): SlideNumberIntent(6),
          SingleActivator(LogicalKeyboardKey.numpad7): SlideNumberIntent(7),

          // Letter Keys (Using CharacterActivator for macOS compatibility)
          CharacterActivator('c'): SlideLetterIntent('C'),
          CharacterActivator('s'): SlideLetterIntent('S'),
          CharacterActivator('l'): SlideLetterIntent('L'),
        },
        child: Actions(
          actions: <Type, Action<Intent>>{
            CloseIntent: CallbackAction<CloseIntent>(
              onInvoke: (intent) => Navigator.pop(context, true),
            ),
            PreviousIntent: CallbackAction<PreviousIntent>(
              onInvoke: (intent) => setPreviousSlide(),
            ),
            NextIntent: CallbackAction<NextIntent>(
              onInvoke: (intent) => setNextSlide(),
            ),

            // Handles Numbered Verses
            SlideNumberIntent: CallbackAction<SlideNumberIntent>(
              onInvoke: (intent) => setSlideByNumber(intent.slideNumber),
            ),

            // Handles Letter-Based Navigation (Chorus, Last Verse, etc.)
            SlideLetterIntent: CallbackAction<SlideLetterIntent>(
              onInvoke: (intent) => setSlideByLetter(intent.letter),
            ),

            // Font Size Control (No function yet)
            BiggerFontIntent: CallbackAction<BiggerFontIntent>(
              onInvoke: (intent) => null,
            ),
            SmallerFontIntent: CallbackAction<SmallerFontIntent>(
              onInvoke: (intent) => null,
            ),
          },
          child: Focus(
            autofocus: true,
            onKeyEvent: (node, event) {
              logger('Key pressed: ${event.logicalKey.keyLabel}');
              return KeyEventResult.ignored;
            },
            child: presentation,
          ),
        ),
      );
    } else {
      return presentation;
    }
  }
}
