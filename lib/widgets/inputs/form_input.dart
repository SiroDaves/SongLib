import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class FormInput extends StatelessWidget {
  final String? iLabel;
  final TextEditingController? iController;
  final TextInputType iType;
  final bool? isLight;
  final bool? isEnabled;
  final bool? executeValueChange;
  final FormFieldValidator<String>? iValidator;
  final Function(String)? onChanged;
  final Function()? onValueChanged;
  final Icon? prefix;
  final bool? isActive;
  final bool? isMultiline;
  final double bdRadius;

  const FormInput({
    Key? key,
    this.iLabel = "",
    this.iType = TextInputType.text,
    this.iController,
    this.isLight = false,
    this.isEnabled = true,
    this.executeValueChange = false,
    this.iValidator,
    this.onChanged,
    this.onValueChanged,
    this.prefix,
    this.isActive = true,
    this.isMultiline = false,
    this.bdRadius = 5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color foreColor = isLight! ? Colors.white : AppColors.primary;

    return Container(
      margin: const EdgeInsets.all(15),
      child: TextFormField(
        controller: iController,
        keyboardType: iType,
        autovalidateMode: isMultiline! ? AutovalidateMode.disabled : AutovalidateMode.onUserInteraction,
        validator: iValidator,
        minLines: isMultiline! ? 15 : 1,
        maxLines: isMultiline! ? 30 : 1,
        enabled: isEnabled,
        decoration: InputDecoration(
          labelText: iLabel,
          prefixIcon: prefix,
          labelStyle: TextStyle(fontSize: 20, color: foreColor),
          isDense: isMultiline! ? true : false,
          contentPadding: isMultiline! ? null : const EdgeInsets.all(5),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(bdRadius),
            borderSide: BorderSide(color: foreColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(bdRadius),
            borderSide: BorderSide(color: foreColor),
          ),
        ),
        style: TextStyle(
          fontSize: 18,
          color: foreColor,
        ),
        textInputAction: isMultiline! ? TextInputAction.newline : TextInputAction.next,
        onChanged: onChanged,
      ),
    );
  }

}
