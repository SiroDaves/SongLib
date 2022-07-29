import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import '../../exports.dart';

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
  ///list of widgets for icons
  final List<Widget>? icons;

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
    this.icons,
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

    Widget child = Row(
      key: key,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        buildButton(
          config: config,
          color: prevColor,
          indicator: config.activeIndex == 0
              ? Container()
              : icons![config.activeIndex - 1],
          quarterTurns: 0,
          previous: true,
        ),
        buildButton(
          config: config,
          color: nextColor,
          indicator: config.activeIndex == (icons!.length - 1)
              ? Container()
              : icons![config.activeIndex + 1],
          quarterTurns: 0,
          previous: false,
        )
      ],
    );

    return SizedBox(
      height: 150,
      width: double.infinity,
      child: child,
    );
  }
}
