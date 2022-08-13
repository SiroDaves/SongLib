import 'package:songlib/widget/provider/data_provider_widget.dart';
import 'package:flutter/material.dart';

class SongLibInputField extends StatelessWidget {
  final String hint;
  final bool enabled;
  final ValueChanged<String> onChanged;
  final TextEditingController? controller;

  const SongLibInputField({
    required this.hint,
    required this.onChanged,
    this.enabled = true,
    this.controller,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderTheme: (context, theme) => TextField(
        controller: controller,
        enabled: enabled,
        decoration: InputDecoration(
          filled: true,
          hintText: hint,
          fillColor: theme.colorsTheme.inputFieldFill,
        ),
        onChanged: onChanged,
      ),
    );
  }
}
