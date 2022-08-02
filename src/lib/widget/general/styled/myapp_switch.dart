import 'package:flutter/material.dart';
import 'package:songlib/widget/provider/data_provider_widget.dart';

class MyappSwitch extends StatelessWidget {
  final bool value;
  final ValueChanged<bool> onChanged;

  const MyappSwitch({
    required this.value,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataProviderWidget(
      childBuilderTheme: (context, theme) => Switch.adaptive(
        value: value,
        onChanged: onChanged,
        activeColor: theme.colorsTheme.accent,
      ),
    );
  }
}
