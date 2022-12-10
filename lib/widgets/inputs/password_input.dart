import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class PasswordInput extends StatelessWidget {
  final TextEditingController? iController;
  final TextInputType? iType;
  final String? iLabel;
  final bool? isLight;
  final bool? isEnabled;
  final bool? isPassword;
  final FormFieldValidator<String>? iValidator;
  final Function()? onSuffixTap;
  final IconData? suffix;
  final double bdRadius;

  const PasswordInput({
    Key? key,
    this.iLabel = 'Password',
    this.iType = TextInputType.text,
    this.iController,
    this.isLight = false,
    this.isEnabled = true,
    this.isPassword = true,
    this.iValidator,
    this.onSuffixTap,
    this.suffix,
    this.bdRadius = 5,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color foreColor = isLight! ? Colors.white : AppColors.primary;
    return Container(
      margin: const EdgeInsets.all(15),
      child: TextFormField(
        controller: iController,
        obscureText: isPassword!,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: iValidator,
        decoration: InputDecoration(
          labelText: iLabel,
          prefixIcon: const Icon(Icons.lock_outline),
          labelStyle: TextStyle(fontSize: 20, color: foreColor),
          isDense: true,
          contentPadding: const EdgeInsets.all(10),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(bdRadius),
            borderSide: BorderSide(color: foreColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(bdRadius),
            borderSide: BorderSide(color: foreColor),
          ),
          suffixIcon: InkWell(
            onTap: onSuffixTap,
            child: Icon(suffix, color: Colors.grey),
          ),
        ),
        style: TextStyle(
          fontSize: 16,
          color: foreColor,
        ),
        textInputAction: TextInputAction.next,
      ),
    );
  }
}
