import 'package:songlib/widget/general/styled/songlib_button.dart';
import 'package:songlib/widget/provider/data_provider_widget.dart';
import 'package:flutter/material.dart';

class SongLibValueButton extends StatefulWidget {
  final int value;
  final int minValue;
  final int maxValue;
  final String text;
  final String? label;
  final ValueChanged<int>? onChange;
  final SongLibButtonType type;

  const SongLibValueButton({
    required this.value,
    required this.text,
    this.label,
    this.type = SongLibButtonType.yellow,
    this.minValue = 0,
    this.maxValue = 8,
    this.onChange,
    Key? key,
  }) : super(key: key);

  @override
  State<SongLibValueButton> createState() => _SongLibValueButtonState();
}

class _SongLibValueButtonState extends State<SongLibValueButton> {
  late var value = widget.value;

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilder: (context, theme, localization) {
        final buttons = Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SongLibButton(
              type: SongLibButtonType.iconMinus,
              onClick: () {
                if (--value < widget.minValue) {
                  value = widget.maxValue;
                }
                widget.onChange?.call(value);
              },
            ),
            const SizedBox(width: 2),
            SongLibButton(
              text: widget.text,
              type: widget.type,
            ),
            const SizedBox(width: 2),
            SongLibButton(
              type: SongLibButtonType.iconPlus,
              onClick: () {
                if (++value > widget.maxValue) {
                  value = widget.minValue;
                }
                widget.onChange?.call(value);
              },
            ),
          ],
        );
        if (widget.label != null) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 4),
              Center(
                child: Text(
                  widget.label!,
                  style: theme.coreTextTheme.bodyUltraSmall,
                ),
              ),
              const SizedBox(height: 4),
              buttons,
            ],
          );
        }
        return buttons;
      },
    );
  }
}
