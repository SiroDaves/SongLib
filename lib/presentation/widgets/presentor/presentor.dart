import 'package:flutter/material.dart';

import '../../../core/utils/app_util.dart';

class SliderContent extends StatelessWidget {
  final String lyrics;
  final Function()? onDoubleTap;
  final Function()? onLongPress;

  const SliderContent({
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
    
    return GestureDetector(
      onDoubleTap: onDoubleTap,
      onLongPress: onLongPress,
      child: Container(
        height: size.height * 0.755,
        padding: const EdgeInsets.all(10),
        child: Card(
          elevation: 5,
          shadowColor: Colors.black,
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

class SliderNumbers extends StatelessWidget {
  final String info;
  final double fontSize;

  const SliderNumbers({
    super.key,
    required this.info,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Center(
        child: Text(
          info,
          style: TextStyle(
            fontSize: 25,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
