import 'package:flutter/material.dart';

import '../exports.dart';

class TextLabel extends StatelessWidget {
  final String? label;
  final bool? isDark;
  final double? paddingV;
  final bool? hasRoute;
  final bool? makeBold;
  final double? fontsize;
  final Color? forecolor;
  final Function()? onTap;

  const TextLabel({
    Key? key,
    required this.label,
    this.isDark = true,
    this.paddingV = 0,
    this.hasRoute = false,
    this.makeBold = false,
    this.fontsize = 18,
    this.forecolor,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color? textcolor;
    if (forecolor == null) {
      if (hasRoute!) {
        textcolor = AppColors.activeColor;
      } else {
        if (isDark!){
          textcolor = Colors.white;
         } else {
          textcolor = AppColors.primaryColor;
         }
      }
    } else {
      textcolor = forecolor;
    }
    return Container(
      padding: EdgeInsets.all(paddingV!),
      child: Center(
        child: InkWell(
          onTap: onTap,
          child: Text(
            label!,
            style: TextStyle(
              fontSize: fontsize,
              color: textcolor,
              fontWeight: hasRoute!
                  ? FontWeight.bold
                  : (makeBold! ? FontWeight.bold : FontWeight.normal),
            ),
          ),
        ),
      ),
    );
  }
}
