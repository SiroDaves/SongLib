part of '../presentor_screen.dart';

class PresentorSlide extends StatefulWidget {
  final int index;
  final double tabsWidth;
  final double indicatorWidth;
  final IndicatorSide? indicatorSide;
  final List<Tab> tabs;
  final List<Widget> contents;
  final String songbook;
  final TextDirection direction;
  final Color indicatorColor;
  final Color tabBackgroundColor;
  final TextStyle selectedTabTextStyle;
  final TextStyle tabTextStyle;
  final bool isBigScreen;
  final Function(int tabIndex)? onSelect;

  const PresentorSlide({
    super.key,
    required this.index,
    required this.tabs,
    required this.contents,
    required this.songbook,
    this.tabsWidth = 200,
    this.indicatorWidth = 3,
    this.indicatorSide,
    this.direction = TextDirection.ltr,
    this.indicatorColor = Colors.green,
    this.tabBackgroundColor = const Color(0xfff8f8f8),
    this.selectedTabTextStyle = const TextStyle(color: Colors.black),
    this.tabTextStyle = const TextStyle(color: Colors.black38),
    this.isBigScreen = false,
    this.onSelect,
  }) : assert(tabs.length == contents.length);

  @override
  State<PresentorSlide> createState() => _PresentorSlideState();
}

class _PresentorSlideState extends State<PresentorSlide>
    with TickerProviderStateMixin {
  late int selectedIndex;
  late PrefRepository _prefRepo;
  bool? changePageByTapView;
  bool slideVertically = false;
  late PageController pageController;
  late List<AnimationController> animationControllers;

  @override
  void initState() {
    super.initState();
    _prefRepo = getIt<PrefRepository>();
    selectedIndex = widget.index;
    pageController = PageController(initialPage: widget.index);

    slideVertically = _prefRepo.getPrefBool(
      PrefConstants.slideVerticallyKey,
      defaultValue: true,
    );
    animationControllers = List.generate(
      widget.tabs.length,
      (_) => AnimationController(
        duration: const Duration(milliseconds: 400),
        vsync: this,
      ),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    for (final controller in animationControllers) {
      controller.dispose();
    }
    pageController.dispose();
    super.dispose();
  }

  void selectTab(int index) {
    setState(() {
      selectedIndex = index;
      for (var controller in animationControllers) {
        controller.reset();
      }
      animationControllers[index].forward();
    });

    widget.onSelect?.call(index);
  }

  @override
  Widget build(BuildContext context) {
    var slideContainer = SlideContainer(
      tabs: widget.tabs,
      selectedIndex: selectedIndex,
      direction: widget.direction,
      indicatorSide: widget.indicatorSide,
      indicatorWidth: widget.indicatorWidth,
      animationControllers: animationControllers,
      onTabSelected: (index) {
        changePageByTapView = true;
        selectTab(index);
        pageController.animateToPage(
          index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
    );
    return Directionality(
      textDirection: widget.direction,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PageView.builder(
            scrollDirection: slideVertically ? Axis.vertical : Axis.horizontal,
            controller: pageController,
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: widget.contents.length,
            onPageChanged: (index) {
              setState(() {
                if (changePageByTapView != true) selectTab(index);
                changePageByTapView = null;
              });
            },
            itemBuilder: (context, index) => widget.contents[index],
          ).expanded(),
          if (widget.isBigScreen) ...[
            slideContainer,
            PresentorSongBook(
              songbook: widget.songbook,
              tabsWidth: widget.tabsWidth,
            ),
          ] else ...[
            Align(
              alignment: Alignment.center,
              child: slideContainer,
            ),
            const SizedBox(height: 20),
          ],
        ],
      ),
    );
  }
}
