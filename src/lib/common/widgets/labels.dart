import 'package:card_swiper/card_swiper.dart';
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
                  color: AppColors.red,
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

class PageSwiper extends SwiperPlugin {
  /// Distance between pagination and the container
  final EdgeInsetsGeometry margin;

  /// Build the widget
  final SwiperPlugin builder;

  final Key? key;

  const PageSwiper({
    this.key,
    this.margin = const EdgeInsets.all(10.0),
    this.builder = const DotSwiperPaginationBuilder(
      activeColor: AppColors.primaryColor,
      color: AppColors.activeColor,
    ),
  });

  @override
  Widget build(BuildContext context, SwiperPluginConfig config) {
    Widget child = Container(
      margin: margin,
      child: builder.build(context, config),
    );
    if (!config.outer!) {
      child = Align(
        key: key,
        alignment: Alignment.topCenter,
        child: child,
      );
    }
    return child;
  }
}

class PageSwiperControl extends SwiperPlugin {
  ///IconData for previous
  final Widget? iconPrevious;

  ///iconData fopr next
  final Widget? iconNext;

  ///icon size
  final double size;

  ///Icon normal color, The theme's [ThemeData.primaryColor] by default.
  final Color? color;

  ///if set loop=false on Swiper, this color will be used when swiper goto the last slide.
  ///The theme's [ThemeData.disabledColor] by default.
  final Color? disableColor;

  final EdgeInsetsGeometry padding;

  final Key? key;

  const PageSwiperControl({
    this.iconPrevious,
    this.iconNext,
    this.color,
    this.disableColor,
    this.key,
    this.size = 30.0,
    this.padding = const EdgeInsets.only(top: 40),
  });

  Widget buildButton({
    required SwiperPluginConfig? config,
    required Color color,
    required Widget indicator,
    required int quarterTurns,
    required bool previous,
  }) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        if (previous) {
          config!.controller.previous(animation: true);
        } else {
          config!.controller.next(animation: true);
        }
      },
      child: Padding(padding: padding, child: indicator),
    );
  }

  @override
  Widget build(BuildContext context, SwiperPluginConfig config) {
    final themeData = Theme.of(context);

    final color = this.color ?? themeData.primaryColor;
    final disableColor = this.disableColor ?? themeData.disabledColor;
    Color prevColor;
    Color nextColor;

    if (config.loop) {
      prevColor = nextColor = color;
    } else {
      final next = config.activeIndex < config.itemCount - 1;
      final prev = config.activeIndex > 0;
      prevColor = prev ? color : disableColor;
      nextColor = next ? color : disableColor;
    }

    Widget child;
    if (config.scrollDirection == Axis.horizontal) {
      child = Row(
        key: key,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          buildButton(
            config: config,
            color: prevColor,
            indicator: Opacity(
              opacity: config.activeIndex != 1 ? 0 : 1,
              child: iconPrevious!,
            ),
            quarterTurns: 0,
            previous: true,
          ),
          buildButton(
            config: config,
            color: nextColor,
            indicator: Opacity(
              opacity: config.activeIndex != 1 ? 0 : 1,
              child: iconNext!,
            ),
            quarterTurns: 0,
            previous: false,
          )
        ],
      );
    } else {
      child = Column(
        key: key,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          buildButton(
            config: config,
            color: prevColor,
            indicator: iconPrevious!,
            quarterTurns: -3,
            previous: true,
          ),
          buildButton(
            config: config,
            color: nextColor,
            indicator: iconNext!,
            quarterTurns: -3,
            previous: false,
          )
        ],
      );
    }

    return SizedBox(
      height: 150,
      width: double.infinity,
      child: child,
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
