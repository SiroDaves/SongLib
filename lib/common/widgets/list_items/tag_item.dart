import 'package:flutter/material.dart';
import 'package:textstyle_extensions/textstyle_extensions.dart';

import '../../../core/theme/theme_colors.dart';
import '../../../core/theme/theme_fonts.dart';
import '../../../core/theme/theme_styles.dart';

class TagItem extends StatelessWidget {
  final String tagText;
  final double height;

  const TagItem({
    Key? key,
    required this.tagText,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    try {
      if (tagText.isNotEmpty) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          margin: const EdgeInsets.only(right: Sizes.xs),
          decoration: BoxDecoration(
            color: Theme.of(context).brightness == Brightness.light
                ? ThemeColors.primary
                : ThemeColors.kPrimaryDeepOrange,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
          child: Text(
            tagText,
            style: TextStyles.headingStyle5
                .textColor(Colors.white)
                .letterSpace(1)
                .italic,
          ),
        );
      } else {
        return const SizedBox.shrink();
      }
    } on Exception {
      return const SizedBox.shrink();
    }
  }
}
