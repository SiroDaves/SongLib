import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../data/models/inputs/code_input.dart';
import '../../theme/theme_colors.dart';
import '../../theme/theme_styles.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? subTitle;
  final PreferredSizeWidget? bottom;

  const AppBarWidget({
    super.key,
    required this.title,
    this.subTitle,
    this.bottom,
  });

  @override
  Size get preferredSize => Size.fromHeight(bottom == null ? 90 : 120);

  @override
  Widget build(BuildContext context) {
    var withSubtitle = [
      const SizedBox(height: 10),
      Text(
        title,
        style: const TextStyle(
          color: ThemeColors.britamRed,
          fontSize: 22,
        ),
      ),
      Text(
        subTitle ?? '',
        style: const TextStyle(
          color: ThemeColors.primary,
          fontSize: 24,
          fontWeight: FontWeight.w600,
        ),
      ),
    ].toColumn();

    var withoutSubtitle = Text(
      title,
      style: const TextStyle(
        color: ThemeColors.britamRed,
        fontSize: 24,
        fontWeight: FontWeight.w600,
      ),
    );

    return AppBar(
      centerTitle: true,
      title: subTitle != null ? withSubtitle : withoutSubtitle,
      leadingWidth: 0,
      toolbarHeight: bottom == null ? 90 : 120,
      leading: const SizedBox.shrink(),
      elevation: 0,
      bottom: bottom,
    );
  }
}

class CustomCard extends StatelessWidget {
  final String? title;
  final String? description;
  final Function()? onTap;
  final Color? txColor;
  final Color? bgColor;
  final double ftSize;
  final double bdRadius;
  final EdgeInsetsGeometry cPadding;

  const CustomCard({
    Key? key,
    required this.title,
    this.description = "",
    required this.onTap,
    this.txColor = Colors.white,
    this.bgColor = ThemeColors.primary,
    this.ftSize = 20,
    this.bdRadius = 5,
    this.cPadding = const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: cPadding,
      decoration: BoxDecoration(
        color: bgColor,
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
      child: ListTile(
        title: Text(
          title!,
          style: TextStyle(fontWeight: FontWeight.bold, color: txColor),
        ),
        subtitle: description!.isEmpty
            ? const SizedBox.shrink()
            : Text(
                description!,
                style: TextStyle(color: txColor),
                maxLines: 2,
              ),
        onTap: onTap,
      ),
    );
  }
}


class TitleBar extends StatelessWidget {
  final String title;
  final String? subTitle;
  const TitleBar({super.key, required this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    return subTitle == null
        ? Text(
            title,
            style: const TextStyle(
              color: ThemeColors.britamRed,
              fontSize: 24,
              fontWeight: FontWeight.w600,
            ),
          )
        : Container(
            height: 90,
            padding: const EdgeInsets.only(top: 15),
            child: Column(
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: ThemeColors.britamRed,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  subTitle!,
                  style: const TextStyle(
                    color: ThemeColors.primary,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          );
  }
}


class PinError extends StatelessWidget {
  final CodeInput pin;
  const PinError({super.key, required this.pin});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.xl),
      child: Text(
        pin.displayError != null ? "Invalid Pin Code" : "",
        style: const TextStyle(
            color: Colors.red, fontSize: 12, fontWeight: FontWeight.w400),
      ),
    );
  }
}
