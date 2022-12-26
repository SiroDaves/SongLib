import 'package:flutter/material.dart';

import '../../theme/theme_colors.dart';

class PageTitle extends StatelessWidget {
  final String? label;
  final Size? size;

  const PageTitle({
    Key? key,
    required this.label,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size!.height * 0.087,
      child: Center(
        child: Text(
          label!,
          style: TextStyle(
            fontSize: size!.height * 0.0367,
            fontWeight: FontWeight.bold,
            color: ThemeColors.primary,
          ),
        ),
      ),
    );
  }
}

class PageSearch extends StatelessWidget {
  final String? label;
  final Size? size;
  final Function()? onTap;

  const PageSearch({
    Key? key,
    required this.label,
    required this.size,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: size!.width * 0.608,
        height: size!.height * 0.0732,
        margin: EdgeInsets.symmetric(
          vertical: size!.height * 0.0146,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(blurRadius: 3)],
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        /*child: TextField(
          textAlign: TextAlign.center,
          readOnly: true,
          style: TextStyle(
            fontSize: size!.height * 0.0367,
            color: ThemeColors.primary,
          ),
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: ThemeColors.primary),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: ThemeColors.primary),
            ),
            prefixIcon: const Icon(Icons.search, color: ThemeColors.primary),
            suffixIcon: const Icon(Icons.mic, color: ThemeColors.primary),
            border: InputBorder.none,
            hintText: label,
            hintStyle: const TextStyle(
              color: ThemeColors.primary,
              fontWeight: FontWeight.bold,
            ),
            contentPadding: const EdgeInsets.all(10),
          ),
        ),*/

        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size!.height * 0.03,
          ),
          child: Row(
            children: [
              Text(
                label!,
                style: TextStyle(
                  fontSize: size!.height * 0.0367,
                  fontWeight: FontWeight.bold,
                  color: ThemeColors.primary,
                ),
              ),
              const Spacer(),
              const Icon(Icons.search, color: ThemeColors.primary),
            ],
          ),
        ),
      ),
    );
  }
}
