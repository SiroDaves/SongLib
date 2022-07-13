import 'package:flutter/material.dart';

/// Used for defining alert buttons.
///
/// [child] and [onPressed] parameters are required.
class AlertButton extends StatelessWidget {
  final String? text;
  final double? width;
  final double? height;
  final Color? color;
  final Color? highlightColor;
  final Color? splashColor;
  final Gradient? gradient;
  final BorderRadius? radius;
  final VoidCallback? onPressed;
  final BoxBorder? border;
  final EdgeInsets? padding;
  final EdgeInsets? margin;

  /// AlertButton constructor
  const AlertButton({
    Key? key,
    this.text,
    this.width,
    this.height = 40.0,
    this.color,
    this.highlightColor,
    this.splashColor,
    this.gradient,
    this.radius = const BorderRadius.all(Radius.circular(6)),
    this.border = const Border.fromBorderSide(
      BorderSide(
        color: Color(0x00000000),
        width: 0,
        style: BorderStyle.solid,
      ),
    ),
    this.padding = const EdgeInsets.only(left: 5, right: 5),
    this.margin = const EdgeInsets.all(5),
    this.onPressed,
  }) : super(key: key);

  /// Creates alert buttons based on constructor params
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      margin: margin,
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).primaryColor,
        gradient: gradient,
        borderRadius: radius,
        border: border,
      ),
      child: TextButton(
        child: Text(
          text!,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
