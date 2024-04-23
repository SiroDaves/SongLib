import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:textstyle_extensions/textstyle_extensions.dart';

import '../../theme/theme_colors.dart';
import '../../theme/theme_fonts.dart';
import '../../utils/constants/app_assets.dart';

class CircularProgress extends StatelessWidget {
  const CircularProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        child: CircularProgressIndicator(
          color: ThemeColors.primary,
          strokeWidth: 5,
          backgroundColor: Colors.white.withOpacity(0.3),
        ),
      ),
    );
  }
}

class SmallCircularProgress extends StatelessWidget {
  const SmallCircularProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: CircularProgressIndicator(
        color: ThemeColors.primary,
        strokeWidth: 3,
        backgroundColor: Colors.white.withOpacity(0.3),
      ),
    );
  }
}

class EmptyState extends StatelessWidget {
  final String title;
  const EmptyState({
    Key? key,
    this.title =
        'Sorry, no data is available at the moment. Please check back later.',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          AppAssets.imgZeroState,
          height: 160,
          width: 160,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyles.bodyStyleOne.size(16).textHeight(1.2),
        ).center().padding(all: 20),
      ],
    );
  }
}
