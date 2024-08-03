import 'package:flutter/material.dart';
import 'package:skeleton_loader/skeleton_loader.dart';

import '../../../core/theme/theme_colors.dart';
import '../../../core/theme/theme_styles.dart';

class SkeletonLoading extends StatelessWidget {
  final String type;
  final int items;
  const SkeletonLoading({
    Key? key,
    this.type = '',
    this.items = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget? rowWidget;
    Widget booksWidget = ListTile(
      leading: Container(
        width: Sizes.l,
        height: Sizes.l,
        padding: const EdgeInsets.all(Sizes.m),
        color: Colors.white,
      ),
      title: Container(
        width: Sizes.xl * 2,
        height: Sizes.l,
        padding: const EdgeInsets.symmetric(horizontal: Sizes.xs),
        color: Colors.white,
      ),
      subtitle: Container(
        width: Sizes.xl * 2,
        height: Sizes.l,
        padding: const EdgeInsets.symmetric(horizontal: Sizes.xs),
        color: Colors.white,
      ),
    );

    Widget songsWidget = ListTile(
      title: Container(
        height: Sizes.l,
        color: Colors.white,
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: double.infinity,
            height: Sizes.l,
            margin: const EdgeInsets.only(top: Sizes.sm),
            color: Colors.white,
          ),
          Container(
            height: Sizes.m,
            margin: const EdgeInsets.only(top: Sizes.sm),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  width: Sizes.xl * 3,
                  margin: const EdgeInsets.only(right: Sizes.xl),
                  color: Colors.white,
                );
              },
            ),
          ),
        ],
      ),
    );

    switch (type) {
      case 'songs':
        rowWidget = songsWidget;
        break;

      default:
        rowWidget = booksWidget;
        break;
    }

    return SingleChildScrollView(
      child: SkeletonLoader(
        builder: Padding(
          padding: const EdgeInsets.only(bottom: Sizes.m),
          child: rowWidget,
        ),
        items: items,
        period: const Duration(seconds: 3),
        highlightColor: ThemeColors.primary,
        direction: SkeletonDirection.ltr,
      ),
    );
  }
}
