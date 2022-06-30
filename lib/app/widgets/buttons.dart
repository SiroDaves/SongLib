import 'package:flutter/material.dart';

import '../exports.dart';

class SubmitButton extends StatelessWidget {
  final String? title;
  final Function()? onTap;
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
    required this.onTap,
    this.icon,
    this.txColor = Colors.white,
    this.bgColor = AppColors.activeColor,
    this.bdColor = Colors.white,
    this.isActive = true,
    this.ftSize = 16,
    this.bdRadius = 5,
    this.cMargin = const EdgeInsets.symmetric(vertical: 20),
    this.cPadding = const EdgeInsets.all(5),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: cMargin,
      //padding: cMargin,
      child: InkWell(
        onTap: isActive! ? onTap : null,
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

class DrawerItem extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final Function()? onTap;
  final IconData? icon;
  final Color? txColor;
  final Color? bgColor;
  final Color? bdColor;
  final bool? isActive;
  final double bdRadius;

  const DrawerItem({
    Key? key,
    required this.title,
    required this.onTap,
    this.subtitle = '',
    this.icon,
    this.txColor = Colors.black,
    this.bgColor = Colors.white,
    this.bdColor = Colors.white,
    this.isActive = true,
    this.bdRadius = 0,
  })  : assert(subtitle != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.white,
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 0),
            blurRadius: 5,
            color: Colors.black26,
          )
        ],
      ),
      child: ListTile(
        leading: icon == null ? null : Icon(icon),
        title: Text(
          title!,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        subtitle: subtitle!.isEmpty
            ? null
            : Text(
                subtitle!,
                style: const TextStyle(fontSize: 12),
              ),
        onTap: onTap,
      ),
    );
  }
}
