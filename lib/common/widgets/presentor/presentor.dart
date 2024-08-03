import 'package:flutter/material.dart';

import '../../../core/theme/theme_colors.dart';
import '../../utils/app_util.dart';

class PresentorInfo extends StatelessWidget {
  final String info;
  final double fontSize;

  const PresentorInfo({
    super.key,
    required this.info,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    Color foreColor = Theme.of(context).brightness == Brightness.light
        ? ThemeColors.primary
        : Colors.white;
    return Tab(
      child: Center(
        child: Text(
          info,
          style: TextStyle(
            fontSize: 25,
            color: foreColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class PresentorText extends StatelessWidget {
  final String lyrics;
  final Function()? onDoubleTap;
  final Function()? onLongPress;

  const PresentorText({
    super.key,
    required this.lyrics,
    this.onDoubleTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final double nfontsize = getFontSize(
      lyrics.length + 20,
      size.height - 500,
      size.width,
    );

    var bgColor = Theme.of(context).brightness == Brightness.light
        ? Colors.white
        : Colors.black;

    return GestureDetector(
      onDoubleTap: onDoubleTap,
      onLongPress: onLongPress,
      child: Container(
        height: size.height * 0.755,
        padding: const EdgeInsets.all(10),
        child: Card(
          elevation: 5,
          shadowColor: Colors.black,
          color: bgColor,
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                lyrics.replaceAll("#", "\n"),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: nfontsize,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
