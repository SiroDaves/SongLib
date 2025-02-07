part of '../presentor_screen.dart';

enum IndicatorSide { start, end }

class PresentorView extends StatefulWidget {
  final int index;
  final double tabsWidth;
  final double indicatorWidth;
  final IndicatorSide? indicatorSide;
  final List<Tab> tabs;
  final List<Widget> contents;
  final String songbook;
  final TextDirection direction;
  final Color indicatorColor;
  final Axis contentScrollAxis;
  final Color tabBackgroundColor;
  final TextStyle selectedTabTextStyle;
  final TextStyle tabTextStyle;
  final Function(int tabIndex)? onSelect;

  const PresentorView({
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
    this.contentScrollAxis = Axis.horizontal,
    this.tabBackgroundColor = const Color(0xfff8f8f8),
    this.selectedTabTextStyle = const TextStyle(color: Colors.black),
    this.tabTextStyle = const TextStyle(color: Colors.black38),
    this.onSelect,
  }) : assert(tabs.length == contents.length);

  @override
  State<PresentorView> createState() => _PresentorViewState();
}

class _PresentorViewState extends State<PresentorView>
    with TickerProviderStateMixin {
  late int selectedIndex;
  bool? changePageByTapView;
  late PageController pageController;
  late List<AnimationController> animationControllers;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.index;
    pageController = PageController(initialPage: widget.index);

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
    return Directionality(
      textDirection: widget.direction,
      child: Column(
        children: <Widget>[
          PresentorPageView(
            pageController: pageController,
            contents: widget.contents,
            onPageChanged: (index) {
              setState(() {
                if (changePageByTapView != true) selectTab(index);
                changePageByTapView = null;
              });
            },
          ).expanded(),
          PresentorTabBar(
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
          ),
          PresentorSongBook(
            songbook: widget.songbook,
            tabsWidth: widget.tabsWidth,
          ),
        ],
      ),
    );
  }
}
