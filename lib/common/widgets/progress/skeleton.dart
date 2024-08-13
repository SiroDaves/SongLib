import 'package:flutter/material.dart';
import 'package:skeleton_loader/skeleton_loader.dart';

import '../../../core/theme/theme_colors.dart';

class SkeletonLoading extends StatelessWidget {
  const SkeletonLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var rowWidget = ListTile(
      onTap: () {},
      leading: Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          width: 20,
          height: 20,
          color: Colors.black,
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 5),
        child: Container(
          width: 50,
          height: 20,
          color: Colors.black,
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 10),
        child: Container(
          width: 50,
          height: 20,
          color: Colors.black,
        ),
      ),
    );

    return SingleChildScrollView(
      child: SkeletonLoader(
        builder: Container(
          height: 80,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          child: rowWidget,
        ),
        items: 10,
        period: const Duration(seconds: 3),
        highlightColor: ThemeColors.primary,
        direction: SkeletonDirection.ltr,
      ),
    );
  }
}
