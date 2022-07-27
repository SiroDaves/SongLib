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
        if (isDark!) {
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

class NoDataToShow extends StatelessWidget {
  final String? title;
  final String? description;

  const NoDataToShow({Key? key, this.title, this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      key: const ValueKey('${KeyConstants.errorView}_center'),
      child: Container(
        key: const ValueKey('${KeyConstants.errorView}_container'),
        width: 500,
        height: 175,
        margin: const EdgeInsets.all(30),
        decoration: const BoxDecoration(
          color: AppColors.white,
          boxShadow: [BoxShadow(blurRadius: 5)],
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Padding(
          key: const ValueKey('${KeyConstants.errorView}_padding'),
          padding: const EdgeInsets.all(20),
          child: Center(
            key: const ValueKey('${KeyConstants.errorView}_centered'),
            child: Column(children: [
              Text(
                key: const ValueKey('${KeyConstants.errorView}_title'),
                title!,
                style: titleTextStyle.copyWith(
                  fontSize: 20,
                  color: AppColors.primaryColor,
                ),
              ),
              const SizedBox(
                key: ValueKey('${KeyConstants.errorView}_sizedbox'),
                height: 10,
              ),
              Text(
                key: const ValueKey('${KeyConstants.errorView}_description'),
                description!,
                style: const TextStyle(fontSize: 16),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

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
          margin: EdgeInsets.only(top: 2, left: height * 0.0049),
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            border: Border.all(color: AppColors.white),
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            boxShadow: const [BoxShadow(blurRadius: 1)],
          ),
          child: Text(
            tagText,
            style: normalTextStyle.copyWith(
              fontSize: height * 0.0195,
              color: AppColors.white,
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
