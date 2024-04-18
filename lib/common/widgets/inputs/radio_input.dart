import 'package:flutter/material.dart';

import '../../theme/theme_colors.dart';

class RadioInput extends StatefulWidget {
  final List<String> options;
  final String? label;
  final bool? vertical;
  final Function(String)? onChanged;

  const RadioInput({
    super.key,
    required this.options,
    this.onChanged,
    this.label = '',
    this.vertical = true,
  });

  @override
  RadioInputState createState() => RadioInputState();
}

class RadioInputState extends State<RadioInput> {
  late String _selectedOption;

  @override
  void initState() {
    super.initState();
    _selectedOption = widget.options[0]; // Default to the first option
  }

  @override
  Widget build(BuildContext context) {
    var labelWidget = Text(
      widget.label!,
      style: const TextStyle(
        color: ThemeColors.blackText,
        fontWeight: FontWeight.bold,
      ),
    );
    if (widget.vertical!) {
      return Container(
        margin: const EdgeInsets.only(top: 10, left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (widget.label!.isNotEmpty) ...[labelWidget],
            Column(
              children: widget.options.map((option) {
                return RadioListTile<String>(
                  title: Text(
                    option,
                    style: const TextStyle(fontSize: 16),
                  ),
                  value: option,
                  groupValue: _selectedOption,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  visualDensity: const VisualDensity(
                    horizontal: VisualDensity.minimumDensity,
                    vertical: VisualDensity.minimumDensity,
                  ),
                  onChanged: (value) {
                    setState(() {
                      _selectedOption = value.toString();
                      widget.onChanged!(_selectedOption);
                    });
                  },
                );
              }).toList(),
            ),
          ],
        ),
      );
    } else {
      return Container(
        margin: const EdgeInsets.only(top: 10, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (widget.label!.isNotEmpty) ...[labelWidget],
            Row(
              children: widget.options.map((option) {
                return Row(
                  children: <Widget>[
                    Radio(
                      value: option,
                      groupValue: _selectedOption,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      onChanged: (value) {
                        setState(() {
                          _selectedOption = value.toString();
                          widget.onChanged!(_selectedOption);
                        });
                      },
                    ),
                    Text(
                      option,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      );
    }
  }
}
