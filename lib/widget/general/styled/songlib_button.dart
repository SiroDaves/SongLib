import 'package:songlib/theme/theme_assets.dart';
import 'package:songlib/widget/provider/data_provider_widget.dart';
import 'package:flutter/material.dart';

enum SongLibButtonType {
  blue(ThemeAssets.buttonBluePressed, ThemeAssets.buttonBlue),
  red(ThemeAssets.buttonRedPressed, ThemeAssets.buttonRed),
  green(ThemeAssets.buttonGreenPressed, ThemeAssets.buttonGreen),
  yellow(ThemeAssets.buttonYellowPressed, ThemeAssets.buttonYellow),
  iconInfo(ThemeAssets.buttonIconPressed, ThemeAssets.buttonIconInfo),
  iconPlus(ThemeAssets.buttonIconPressed, ThemeAssets.buttonIconPlus),
  iconMinus(ThemeAssets.buttonIconPressed, ThemeAssets.buttonIconMinus),
  iconNext(ThemeAssets.buttonIconPressed, ThemeAssets.buttonIconNext),
  iconClose(ThemeAssets.buttonIconPressed, ThemeAssets.buttonIconClose),
  iconCredits(ThemeAssets.buttonIconPressed, ThemeAssets.buttonIconCredits),
  iconSettings(ThemeAssets.buttonIconPressed, ThemeAssets.buttonIconSettings);

  final String pressed;
  final String normal;

  const SongLibButtonType(this.pressed, this.normal);
}

class SongLibButton extends StatefulWidget {
  final bool isEnabled;
  final double size;
  final String? text;
  final VoidCallback? onClick;
  final SongLibButtonType type;

  const SongLibButton({
    this.onClick,
    this.text,
    this.size = 48,
    this.isEnabled = true,
    this.type = SongLibButtonType.blue,
    Key? key,
  }) : super(key: key);

  @override
  State<SongLibButton> createState() => _SongLibButtonState();
}

class _SongLibButtonState extends State<SongLibButton> {
  var _isPressed = false;

  String get _imageAsset {
    if (!widget.isEnabled) return ThemeAssets.buttonDisabled;
    return _isPressed ? widget.type.pressed : widget.type.normal;
  }

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilder: (context, theme, localization) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: GestureDetector(
          onTapDown: (details) {
            if (!widget.isEnabled || widget.onClick == null) return;
            setState(() {
              _isPressed = true;
            });
          },
          onTapUp: (details) {
            if (!widget.isEnabled || widget.onClick == null) return;
            setState(() {
              _isPressed = false;
            });
            widget.onClick?.call();
          },
          onPanUpdate: (details) {
            if (!widget.isEnabled || widget.onClick == null) return;
            setState(() {
              _isPressed = false;
            });
          },
          child: Stack(
            children: [
              Image.asset(
                _imageAsset,
                fit: BoxFit.fitHeight,
                height: widget.size,
              ),
              if (widget.text != null) ...[
                Positioned.fill(
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 8,
                      right: 8,
                      top: _isPressed && widget.isEnabled ? 4 : 0,
                      bottom: 8,
                    ),
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        widget.text ?? '',
                        style: theme.coreTextTheme.labelButtonBig,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
