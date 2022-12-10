import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class SubmitButton extends StatelessWidget {
  final String? title;
  final Function()? onPressed;
  final Icon? icon;
  final Color? txColor;
  final Color? bgColor;
  final Color? bdColor;
  final bool? isActive;
  final double ftSize;
  final double bdRadius;
  final EdgeInsetsGeometry cMargin;
  final EdgeInsetsGeometry cPadding;

  const SubmitButton({
    Key? key,
    required this.title,
    required this.onPressed,
    this.icon,
    this.txColor = Colors.white,
    this.bgColor = AppColors.primary,
    this.bdColor = Colors.white,
    this.isActive = true,
    this.ftSize = 20,
    this.bdRadius = 5,
    this.cMargin = const EdgeInsets.all(10),
    this.cPadding = const EdgeInsets.all(10),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: cMargin,
      padding: cPadding,
      child: InkWell(
        onTap: isActive! ? onPressed : null,
        child: Container(
          decoration: BoxDecoration(
            color: bgColor,
            border: Border.all(color: bdColor!),
            borderRadius: BorderRadius.all(
              Radius.circular(bdRadius),
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Center(
            child: Container(
              padding: cPadding,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  if (icon != null) icon!,
                  if (icon != null) const SizedBox(width: 10),
                  Text(
                    title!,
                    style: TextStyle(
                        fontSize: ftSize,
                        color: txColor,
                        fontWeight: FontWeight.bold),
                    maxLines: 2,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
