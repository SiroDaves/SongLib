import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';

import '../../common/widgets/presentor/presentor_animate.dart';

enum IndicatorSide { start, end }

/// A vertical tab widget for flutter
class PresentorMobile extends StatefulWidget {
  final int? index;
  final double? tabsWidth;
  final double? indicatorWidth;
  final IndicatorSide? indicatorSide;
  final List<Tab>? tabs;
  final List<Widget>? contents;
  final String? songbook;
  final TextDirection? direction;
  final Color? indicatorColor;
  final Axis? contentScrollAxis;
  final Color? tabBackgroundColor;
  final TextStyle? selectedTabTextStyle;
  final TextStyle? tabTextStyle;
  final Function(int? tabIndex)? onSelect;

  const PresentorMobile(
      {super.key,
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
      this.onSelect})
      : assert(
            tabs != null && contents != null && tabs.length == contents.length);

  @override
  PresentorMobileState createState() => PresentorMobileState();
}

class PresentorMobileState extends State<PresentorMobile>
    with TickerProviderStateMixin {
  int? selectedIndex;
  bool? changePageByTapView;

  AnimationController? animationController;
  Animation<double?>? animation;
  Animation<RelativeRect?>? rectAnimation;

  PageController? pageController = PageController();

  List<AnimationController?>? animationControllers = [];

  double targetOpacity = 1;

  @override
  void didUpdateWidget(PresentorMobile oldWidget) {
    if (oldWidget.index == widget.index) return;
    setState(() => targetOpacity = 0);
    Future.delayed(1.milliseconds, () => setState(() => targetOpacity = 1));
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
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
  Widget build(BuildContext context) {
    var contentContainer = Expanded(
      child: PageView.builder(
        scrollDirection: widget.contentScrollAxis!,
        physics: const AlwaysScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            if (changePageByTapView == false || changePageByTapView == null) {
              selectTab(index);
            }
            if (selectedIndex == index) {
              changePageByTapView = null;
            }
          });
        },
        controller: pageController,
        itemCount: widget.contents!.length,
        itemBuilder: (BuildContext? context, int? index) {
          return widget.contents![index!];
        },
      ),
    );
    var indicatorContainer = SizedBox(
      height: widget.tabsWidth,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: widget.tabs!.length,
        itemBuilder: (context, index) {
          Tab? tab = widget.tabs![index];
          Alignment? alignment = Alignment.centerLeft;
          if (widget.direction == TextDirection.rtl) {
            alignment = Alignment.centerRight;
          }

          double? left, right;
          if (widget.direction == TextDirection.rtl) {
            left = (widget.indicatorSide == IndicatorSide.end) ? 0 : null;
            right = (widget.indicatorSide == IndicatorSide.start) ? 0 : null;
          } else {
            left = (widget.indicatorSide == IndicatorSide.start) ? 0 : null;
            right = (widget.indicatorSide == IndicatorSide.end) ? 0 : null;
          }

          return Stack(
            children: <Widget>[
              PresentorIndicator(
                width: widget.indicatorWidth!,
                left: left,
                right: right,
                animation: animationControllers![index]!,
              ),
              PresentorContent(
                width: widget.indicatorWidth,
                alignment: alignment,
                isSelected: selectedIndex == index,
                onTap: () {
                  changePageByTapView = true;
                  setState(() => selectTab(index));
                  pageController!.animateToPage(
                    index,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                child: tab.child,
              ),
            ],
          );
        },
      ),
    );
    return Directionality(
      textDirection: widget.direction!,
      child: Column(
        children: <Widget>[
          contentContainer,
          indicatorContainer,
          PresentorSongBook(
            songbook: widget.songbook!,
            tabsWidth: widget.tabsWidth!,
          ),
        ],
      ),
    );
  }

  void selectTab(int index) {
    selectedIndex = index;
    for (final AnimationController? animController in animationControllers!) {
      animController!.reset();
    }
    animationControllers![index]!.forward();
    if (widget.onSelect != null) {
      widget.onSelect!(selectedIndex);
    }
  }
}
