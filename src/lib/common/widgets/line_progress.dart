import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../exports.dart';

class LineProgress extends StatelessWidget {
  /// height or width of the linear percentindicator
  final double progressSize;

  /// progress value of the linear percentindicator
  final int progressVl;

  /// Color of the border for the widget
  final Color borderColor;

  /// Progress Color of the indicator
  final Color progressColor;

  /// Background Color for the widget
  final Color backgroundColor;

  /// Background Color for the widget
  final bool isVertical;

  const LineProgress({
    Key? key,
    this.progressSize = 50,
    this.progressVl = 0,
    this.borderColor = Colors.black,
    this.progressColor = AppColors.primaryColor,
    this.backgroundColor = AppColors.grey,
    this.isVertical = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: isVertical ? 7 : 0,
      child: Container(
        height: progressSize,
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(color: borderColor),
          boxShadow: const [BoxShadow(blurRadius: 3)],
          borderRadius: BorderRadius.all(
            Radius.elliptical(
              progressSize / 4,
              progressSize / 2,
            ),
          ),
        ),
        child: Stack(
          children: <Widget>[
            LinearPercentIndicator(
              percent: double.parse((progressVl / 100).toStringAsFixed(1)),
              barRadius: Radius.elliptical(
                progressSize / 4,
                progressSize / 2,
              ),
              lineHeight: progressSize,
              backgroundColor: backgroundColor,
              progressColor: progressColor,
            ),
            RotatedBox(
              quarterTurns: isVertical ? 1 : 0,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Center(
                  child: Text(
                    "$progressVl %",
                    style: titleTextStyle.copyWith(
                      fontSize: isVertical ? 40 : 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                    ),
                  ),
                ),
              ),
            ),
            leadingContainer(),
            traillingContainer(),
          ],
        ),
      ),
    );
  }

  Widget leadingContainer() {
    return Container(
      height: progressSize,
      width: (progressSize / 2) - 20,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.grey,
        border: Border.all(color: progressColor),
        borderRadius: BorderRadius.all(
          Radius.elliptical(
            progressSize / 4,
            progressSize / 2,
          ),
        ),
      ),
    );
  }
  Widget traillingContainer() {
    return Container(
      height: progressSize,
      width: (progressSize / 2) - 20,
      margin:  EdgeInsets.only(left: progressSize * 2.55),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: progressColor),
        borderRadius: BorderRadius.all(
          Radius.elliptical(
            progressSize / 4,
            progressSize / 2,
          ),
        ),
      ),
    );
  }
}
