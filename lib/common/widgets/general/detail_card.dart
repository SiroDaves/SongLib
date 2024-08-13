import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../core/theme/theme_colors.dart';

class DetailCard extends StatelessWidget {
  final Widget? actionButton;
  final String clientName;
  final String plan;
  final String number;
  final String status;
  const DetailCard({
    super.key,
    this.actionButton,
    required this.clientName,
    required this.plan,
    required this.number,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    var bottomWidget = Row(
      children: [
        [
          Text(
            status,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: const TextStyle(fontSize: 14, color: ThemeColors.textGray),
          ),
          Text(
            number,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: const TextStyle(
              fontSize: 14,
              color: ThemeColors.textGray,
            ),
          )
        ].toColumn(crossAxisAlignment: CrossAxisAlignment.start).expanded(),
        actionButton ?? const SizedBox()
      ],
    );
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: ThemeColors.primary),
      ),
      child: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              clientName,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Text(
              plan,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style:
                  const TextStyle(fontSize: 12, color: ThemeColors.britamRed),
            ),
            bottomWidget,
          ],
        ).padding(left: 10, right: 10, top: 5, bottom: 5).expanded(),
      ].toRow(),
    );
  }
}

class ProspectCard extends StatelessWidget {
  final Widget? actionButton;
  final String fullName;
  final String phoneNumber;
  final String emailAddress;
  const ProspectCard({
    super.key,
    this.actionButton,
    required this.fullName,
    required this.phoneNumber,
    required this.emailAddress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        border: Border.all(
          color: ThemeColors.primary,
          width: 2,
        ),
      ),
      child: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              fullName,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Text(
              phoneNumber,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: const TextStyle(fontSize: 12, color: ThemeColors.textGray),
            ),
            Text(
              emailAddress,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: const TextStyle(fontSize: 12, color: ThemeColors.textGray),
            ),
          ],
        ).padding(left: 10, top: 5, bottom: 5).expanded(),
        actionButton ?? const SizedBox(),
      ].toRow(),
    );
  }
}
