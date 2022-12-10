import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class TagView extends StatelessWidget {
  final String tagText;
  final double height;

  const TagView({Key? key, required this.tagText, required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    try {
      if (tagText.isNotEmpty) {
        return Container(
          padding:
              EdgeInsets.symmetric(horizontal: 10, vertical: height * 0.0049),
          margin: EdgeInsets.only(top: 2, right: height * 0.008),
          decoration: BoxDecoration(
            color: AppColors.primary,
            border: Border.all(color: Colors.white),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            boxShadow: const [BoxShadow(blurRadius: 1)],
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
        return Container();
      }
    } on Exception {
      return Container();
    }
  }
}