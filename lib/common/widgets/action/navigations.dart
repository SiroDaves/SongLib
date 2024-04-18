import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../navigator/route_names.dart';
import '../../theme/theme_colors.dart';
import '../../theme/theme_styles.dart';
import 'base_buttons.dart';

class NavButton extends StatelessWidget {
  final VoidCallback onTap;
  final Color? buttonColor;
  final double? borderRadius;
  final Color? textColor;
  final String buttonText;
  final double? padding;
  final IconData icon;

  const NavButton({
    super.key,
    required this.onTap,
    this.buttonColor,
    this.borderRadius,
    this.textColor,
    required this.buttonText,
    this.padding,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: buttonColor ?? Colors.white,
          borderRadius: BorderRadius.circular(borderRadius ?? 0),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Container(
              padding: EdgeInsets.all(padding ?? 10),
              child: Row(
                children: [
                  Icon(
                    icon,
                    size: 24,
                    color: ThemeColors.blackText,
                    weight: 2,
                  ),
                  const SizedBox(width: 13),
                  Text(
                    buttonText,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.chevron_right,
                    size: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BottomNavigation extends StatelessWidget {
  final Widget? thirdWidget;
  const BottomNavigation({super.key, this.thirdWidget});

  @override
  Widget build(BuildContext context) {
    AppLocalizations? tr = AppLocalizations.of(context)!;
    var padding = const EdgeInsets.only(
      bottom: Sizes.sm,
      left: Sizes.m,
      right: Sizes.m,
    );
    var rowNavigation = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppButton(
          label: tr.labelHome,
          onPressed: () => Navigator.pushNamedAndRemoveUntil(
              context, RouteNames.home, (route) => false),
          bgColor: ThemeColors.primary,
          foreColor: Colors.white,
        ),
        AppButton(
          label: tr.labelBack,
          onPressed: () => Navigator.pop(context, true),
          bgColor: ThemeColors.britamRed,
          foreColor: Colors.white,
        ),
      ],
    );
    if (thirdWidget != null) {
      return Padding(
        padding: padding,
        child: IntrinsicHeight(
          child: Column(
            children: [
              thirdWidget!,
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: rowNavigation,
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(
          bottom: Sizes.sm,
          left: Sizes.m,
          right: Sizes.m,
        ),
        child: rowNavigation,
      );
    }
  }
}
