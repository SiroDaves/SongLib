import 'package:flutter/material.dart';
import 'package:textstyle_extensions/textstyle_extensions.dart';

import '../../../core/theme/theme_colors.dart';
import '../../../core/theme/theme_fonts.dart';

class SearchBookItem extends StatelessWidget {
  final String text;
  final bool isSelected;
  final IconData? icon;
  final VoidCallback? onPressed;

  const SearchBookItem({
    Key? key,
    required this.text,
    this.isSelected = false,
    this.icon,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color selectedColor = Theme.of(context).brightness == Brightness.light
        ? ThemeColors.primary
        : ThemeColors.kPrimaryDeepOrange;
    Color unSelectedColor = Theme.of(context).brightness == Brightness.light
        ? ThemeColors.accent
        : Colors.grey;
    if (icon == null) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 3),
        child: RawMaterialButton(
          fillColor: isSelected ? selectedColor : unSelectedColor,
          highlightColor: Colors.white.withOpacity(.1),
          focusElevation: 0,
          hoverColor: isSelected ? unSelectedColor : selectedColor,
          hoverElevation: 1,
          highlightElevation: 0,
          elevation: 3,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          onPressed: onPressed,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyles.headingStyle4
                .textColor(isSelected ? Colors.white : Colors.black)
                .letterSpace(2),
          ),
        ),
      );
    } else {
      return Container(
        width: 40,
        padding: const EdgeInsets.symmetric(horizontal: 3),
        child: RawMaterialButton(
          fillColor: isSelected ? selectedColor : unSelectedColor,
          highlightColor: Colors.white.withOpacity(.1),
          focusElevation: 0,
          hoverColor: isSelected ? unSelectedColor : selectedColor,
          hoverElevation: 1,
          highlightElevation: 0,
          elevation: 3,
          padding: const EdgeInsets.all(5),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          onPressed: onPressed,
          child: Icon(icon,
              color: isSelected ? Colors.white : Colors.black, size: 22),
        ),
      );
    }
  }
}
