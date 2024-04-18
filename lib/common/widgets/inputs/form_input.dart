import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../theme/theme_colors.dart';

class FormInput extends StatefulWidget {
  final String? label;
  final String? hint;
  final String? error;
  final TextEditingController? controller;
  final TextInputType type;
  final AutovalidateMode? validationMode;
  final bool? isReadOnly;
  final bool? isLight;
  final bool? isEnabled;
  final bool? executeValueChange;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final Function()? onValueChanged;
  final Function(String)? onSubmitted;
  final Function()? onTap;
  final Widget? prefix;
  final Widget? suffix;
  final bool? isActive;
  final bool showBoarder;
  final double bdRadius;
  final int maxInput;
  final String? initialValue;
  final TextInputAction next;
  final FocusNode? focus;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? inputPadding;
  final EdgeInsetsGeometry? margin;
  final List<TextInputFormatter> inputFormatters;
  final bool showClearButton;
  final bool inlineLabel;

  const   FormInput({
    Key? key,
    this.label = "",
    this.hint = "",
    this.error = "",
    this.type = TextInputType.text,
    this.controller,
    this.validationMode = AutovalidateMode.disabled,
    this.isReadOnly = false,
    this.isLight = false,
    this.isEnabled = true,
    this.executeValueChange = false,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.onValueChanged,
    this.onTap,
    this.prefix,
    this.suffix,
    this.isActive = true,
    this.showBoarder = true,
    this.bdRadius = 10,
    this.maxInput = 20000,
    this.next = TextInputAction.next,
    this.focus,
    this.padding,
    this.inputPadding,
    this.initialValue,
    this.margin,
    this.inputFormatters = const [],
    this.showClearButton = true,
    this.inlineLabel = false,
  }) : super(key: key);

  @override
  FormInputState createState() => FormInputState();
}

class FormInputState extends State<FormInput> {
  @override
  Widget build(BuildContext context) {
    Color foreColor = widget.isLight! ? Colors.white : ThemeColors.blackText;
    var labelWidget = Text(
      widget.label!,
      style: const TextStyle(
        color: ThemeColors.blackText,
        fontWeight: FontWeight.bold,
      ),
    );
    var inputWidget = TextFormField(
      controller: widget.controller,
      keyboardType: widget.type,
      autovalidateMode: widget.validationMode,
      validator: widget.validator,
      enabled: widget.isEnabled,
      initialValue: widget.initialValue,
      readOnly: widget.isReadOnly!,
      onTap: widget.onTap,
      textInputAction: widget.next,
      inputFormatters: [
        ...widget.inputFormatters,
        LengthLimitingTextInputFormatter(widget.maxInput),
      ],
      decoration: InputDecoration(
        label: widget.inlineLabel ? labelWidget.padding(horizontal: 5) : null,
        prefixIcon: widget.prefix,
        hintText: widget.hint,
        hintStyle: const TextStyle(fontSize: 14),
        //filled: true,
        //fillColor: widget.isReadOnly! ? ThemeColors.grey : Colors.white,
        suffix: widget.suffix,
        suffixIcon: widget.showClearButton
            ? (widget.isReadOnly!
                ? null
                : InkWell(
                    onTap: () => widget.controller!.clear(),
                    child: Icon(Icons.clear, color: foreColor),
                  ))
            : null,
        labelStyle: TextStyle(fontSize: 16, color: foreColor),
        isDense: false,
        contentPadding: widget.inputPadding ??
            const EdgeInsets.symmetric(horizontal: 10, vertical: 18),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.bdRadius),
          borderSide: BorderSide(
              color: widget.isReadOnly!
                  ? Colors.grey
                  : (widget.showBoarder ? foreColor : Colors.white)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.bdRadius),
          borderSide: BorderSide(
              color: widget.isReadOnly!
                  ? Colors.grey
                  : (widget.showBoarder ? foreColor : Colors.white)),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        focusColor: widget.isReadOnly!
            ? Colors.grey
            : (widget.showBoarder ? foreColor : Colors.white),
      ),
      style: TextStyle(
          fontSize: 18,
          color: widget.isReadOnly! ? ThemeColors.primaryDark : foreColor),
      onChanged: widget.onChanged,
      focusNode: widget.focus,
      onFieldSubmitted: widget.onSubmitted,
    );

    if (widget.label!.isNotEmpty) {
      return Container(
        margin: widget.margin ?? const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget.inlineLabel
                ? const SizedBox()
                : Padding(
                    padding: widget.padding ??
                        const EdgeInsets.only(
                            left: 10, right: 10, top: 20, bottom: 10),
                    child: labelWidget,
                  ),
            inputWidget,
          ],
        ),
      );
    }
    return inputWidget;
  }
}
