part of '../presentor_screen.dart';

class PresentorTabBar extends StatelessWidget {
  final List<Tab> tabs;
  final int selectedIndex;
  final TextDirection direction;
  final IndicatorSide? indicatorSide;
  final double indicatorWidth;
  final List<AnimationController> animationControllers;
  final ValueChanged<int> onTabSelected;

  const PresentorTabBar({
    super.key,
    required this.tabs,
    required this.selectedIndex,
    required this.direction,
    required this.indicatorSide,
    required this.indicatorWidth,
    required this.animationControllers,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: tabs.length,
        itemBuilder: (context, index) {
          Alignment alignment =
              (direction == TextDirection.rtl) ? Alignment.centerRight : Alignment.centerLeft;

          double? left = (direction == TextDirection.rtl)
              ? (indicatorSide == IndicatorSide.end ? 0 : null)
              : (indicatorSide == IndicatorSide.start ? 0 : null);
          double? right = (direction == TextDirection.rtl)
              ? (indicatorSide == IndicatorSide.start ? 0 : null)
              : (indicatorSide == IndicatorSide.end ? 0 : null);

          return Stack(
            children: <Widget>[
              PresentorTabIndicator(
                width: indicatorWidth,
                left: left,
                right: right,
                animation: animationControllers[index],
              ),
              InkWell(
                onTap: () => onTabSelected(index),
                child: Container(
                  alignment: alignment,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: tabs[index].child,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class PresentorTabIndicator extends StatelessWidget {
  final double width;
  final double? left, right;
  final AnimationController animation;

  const PresentorTabIndicator({
    super.key,
    required this.width,
    this.left,
    this.right,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      right: right,
      bottom: 0,
      child: Container(
        width: width,
        height: 3,
        color: Colors.green,
      ),
    );
  }
}
