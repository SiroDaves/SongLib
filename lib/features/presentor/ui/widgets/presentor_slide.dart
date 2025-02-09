part of '../presentor_screen.dart';

class PresentorSlide extends StatefulWidget {
  final int? index;
  final double? tabsWidth;
  final double? indicatorWidth;
  final IndicatorSide? indicatorSide;
  final List<Tab>? tabs;
  final List<Widget>? contents;
  final String? songbook;
  final TextDirection? direction;
  final bool isBigScreen;

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
    this.isBigScreen = false,
  }) : assert(
            tabs != null && contents != null && tabs.length == contents.length);

  @override
  State<PresentorSlide> createState() => _PresentorSlideState();
}

class _PresentorSlideState extends State<PresentorSlide>
    with TickerProviderStateMixin {
  late PrefRepository _prefRepo;
  bool slideVertically = false;

  int? selectedIndex;
  bool? changePageByTapView;
  AnimationController? animationController;
  Animation<double?>? animation;
  Animation<RelativeRect?>? rectAnimation;

  PageController? pageController = PageController();
  List<AnimationController?>? animationControllers = [];
  double targetOpacity = 1;

  @override
  void didUpdateWidget(covariant PresentorSlide oldWidget) {
    if (oldWidget.index == widget.index) return;
    setState(() => targetOpacity = 0);
    Future.delayed(1.milliseconds, () => setState(() => targetOpacity = 1));
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    _prefRepo = getIt<PrefRepository>();
    slideVertically = _prefRepo.getPrefBool(
      PrefConstants.slideVerticallyKey,
      defaultValue: true,
    );

    selectedIndex = widget.index;
    for (int? i = 0; i! < widget.tabs!.length; i++) {
      animationControllers!.add(AnimationController(
        duration: const Duration(milliseconds: 400),
        vsync: this,
      ));
    }
    selectTab(widget.index!);

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      pageController!.jumpToPage(widget.index!);
      setState(() {});
    });
  }

  @override
  void dispose() {
    for (final controller in animationControllers!) {
      controller!.dispose();
    }
    pageController!.dispose();
    super.dispose();
  }

  void selectTab(int index) {
    selectedIndex = index;
    for (final AnimationController? animController in animationControllers!) {
      animController!.reset();
    }
    animationControllers![index]!.forward();
  }

  @override
  Widget build(BuildContext context) {
    var slideContainer = SlideContainer(
      tabs: widget.tabs!,
      selectedIndex: selectedIndex!,
      direction: widget.direction!,
      indicatorSide: widget.indicatorSide,
      indicatorWidth: widget.indicatorWidth!,
      animationControllers: animationControllers!,
      onTabSelected: (index) {
        changePageByTapView = true;
        selectTab(index);
        pageController!.animateToPage(
          index,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
    );
    return Directionality(
      textDirection: widget.direction!,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          PageView.builder(
            scrollDirection: slideVertically ? Axis.vertical : Axis.horizontal,
            controller: pageController,
            physics: const AlwaysScrollableScrollPhysics(),
            itemCount: widget.contents!.length,
            onPageChanged: (index) {
              setState(() {
                if (changePageByTapView == false ||
                    changePageByTapView == null) {
                  selectTab(index);
                }
                if (selectedIndex == index) {
                  changePageByTapView = null;
                }
              });
            },
            itemBuilder: (context, index) => widget.contents![index],
          ).expanded(),
          if (widget.isBigScreen) ...[
            slideContainer,
            PresentorSongBook(
              songbook: widget.songbook!,
              tabsWidth: widget.tabsWidth!,
            ),
          ] else ...[
            Align(alignment: Alignment.center, child: slideContainer),
            const SizedBox(height: 20),
          ],
        ],
      ),
    );
  }
}
