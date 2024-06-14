import 'package:flutter/material.dart';

import '../../theme/theme_colors.dart';

class PresentorIndicator extends StatelessWidget {
  final double? width;
  final double? left;
  final double? right;
  final Animation<double> animation;

  const PresentorIndicator({
    Key? key,
    required this.width,
    required this.left,
    required this.right,
    required this.animation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color bgColor = Theme.of(context).brightness == Brightness.light
        ? ThemeColors.primary
        : ThemeColors.kPrimaryDeepOrange;
    return Positioned(
      top: 2,
      bottom: 2,
      width: width,
      left: left,
      right: right,
      child: ScaleTransition(
        scale: Tween(begin: 0.0, end: 1.0).animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.elasticOut,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}

class PresentorContent extends StatelessWidget {
  final double? width;
  final Widget? child;
  final AlignmentGeometry alignment;
  final Function()? onTap;
  final bool? isSelected;

  const PresentorContent({
    Key? key,
    required this.width,
    required this.child,
    required this.alignment,
    required this.onTap,
    this.isSelected = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color bgColor = Theme.of(context).brightness == Brightness.light
        ? ThemeColors.accent
        : Colors.grey;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: isSelected! ? Colors.transparent : bgColor,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
        ),
        alignment: alignment,
        child: child,
      ),
    );
  }
}

class PresentorSongBook extends StatelessWidget {
  final String songbook;
  final double tabsWidth;

  const PresentorSongBook(
      {Key? key, required this.songbook, required this.tabsWidth})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Text(
        '  $songbook',
        style: TextStyle(fontSize: tabsWidth / 2, color: Colors.white),
      ),
    );
  }
}
