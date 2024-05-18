import 'package:flutter/material.dart';

import '../../theme/theme_colors.dart';

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
          padding:
              EdgeInsets.symmetric(horizontal: 10, vertical: height * 0.0049),
          margin: EdgeInsets.only(top: 2, right: height * 0.008),
          decoration: BoxDecoration(
            color: ThemeColors.primary,
            border: Border.all(color: Colors.white),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
          ),
          child: Text(
            tagText,
            style: TextStyle(
              fontSize: height * 0.0195,
              color: Colors.white,
            ),
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
