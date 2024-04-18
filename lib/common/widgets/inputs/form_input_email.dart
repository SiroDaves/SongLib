import 'package:songlib/common/utils/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../theme/theme_colors.dart';
import '../action/base_buttons.dart';
import 'form_input.dart';

class FormInputEmail extends StatefulWidget {
  final String? error;
  final TextEditingController? controller;
  final ValueChanged<String>? onDomainChanged;
  final Function(String)? onSubmitted;
  final Function()? onTap;
  final double bdRadius;
  final int maxInput;
  final String? initialValue;
  final TextInputAction next;
  final FocusNode? focus;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  const FormInputEmail({
    Key? key,
    this.error = "",
    this.controller,
    this.onDomainChanged,
    this.onSubmitted,
    this.onTap,
    this.bdRadius = 10,
    this.maxInput = 20000,
    this.next = TextInputAction.next,
    this.focus,
    this.padding,
    this.initialValue,
    this.margin,
  }) : super(key: key);

  @override
  FormInputEmailState createState() => FormInputEmailState();
}

class FormInputEmailState extends State<FormInputEmail> {
  String emailAddress = '';

  @override
  Widget build(BuildContext context) {
    var tr = AppLocalizations.of(context)!;
    String emailEnding = AppConstants.emails[0];
    var labelWidget = Text(
      tr.labelEmail,
      style: const TextStyle(
        color: ThemeColors.blackText,
        fontWeight: FontWeight.bold,
      ),
    );
    EdgeInsetsGeometry padding =
        const EdgeInsets.only(left: 5, top: 5, bottom: 10);
    EdgeInsetsGeometry margin = const EdgeInsets.symmetric(horizontal: 10);

    var inputWidgets = Container(
      margin: widget.margin ?? const EdgeInsets.only(top: 10),
      padding: widget.margin ??
          const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(widget.bdRadius),
        border: Border.all(color: ThemeColors.blackText, width: 1),
      ),
      child: Row(
        children: [
          FormInput(
            hint: 'Enter your email',
            controller: widget.controller,
            type: TextInputType.text,
            next: TextInputAction.done,
            padding: padding,
            margin: margin,
            showBoarder: false,
          ).expanded(),
          DropDownWidget(
            value: emailEnding,
            items: AppConstants.emails,
            onChanged: (String? newValue) {
              setState(() {
                emailEnding = newValue!;
                widget.onDomainChanged!(newValue);
              });
            },
          ).flexible(),
        ],
      ),
    );

    return Container(
      margin: widget.margin ?? const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          labelWidget,
          inputWidgets,
        ],
      ),
    );
  }
}
