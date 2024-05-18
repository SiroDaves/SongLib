import 'package:flutter/material.dart';

import '../../theme/theme_colors.dart';
import '../../utils/app_util.dart';

class SearchBookItem extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback? onPressed;

  const SearchBookItem({
    Key? key,
    required this.text,
    required this.isSelected,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: RawMaterialButton(
        fillColor: isSelected ? ThemeColors.primary : ThemeColors.accent,
        highlightColor: Colors.white.withOpacity(.1),
        focusElevation: 0,
        hoverColor: isSelected ? ThemeColors.primary : Colors.white,
        hoverElevation: 1,
        highlightElevation: 0,
        elevation: 3,
        padding: const EdgeInsets.all(10),
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: ThemeColors.primary),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        onPressed: onPressed,
        child: SizedBox(
          width: 100,
          child: Text(
            truncateString(19, refineTitle(text)),
            textAlign: TextAlign.center,
            maxLines: 2,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
