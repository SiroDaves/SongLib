import 'package:flutter/material.dart';
import 'package:skeleton_loader/skeleton_loader.dart';

import '../../theme/theme_colors.dart';
import '../../theme/theme_styles.dart';

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
        builder: rowWidget,
        items: 10,
        period: const Duration(seconds: 3),
        highlightColor: ThemeColors.primary,
        direction: SkeletonDirection.ltr,
      ),
    );
  }
}

class SelectionLoading extends StatelessWidget {
  const SelectionLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var rowWidget = Container(
      margin: const EdgeInsets.all(Sizes.sm),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(Sizes.m),
            width: 20,
            height: 20,
            color: Colors.black,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: Sizes.xs),
                height: 20,
                width: size.width - 150,
                color: Colors.black,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: Sizes.xs),
                height: 15,
                width: size.width - 200,
                color: Colors.black,
              ),
            ],
          )
        ],
      ),
    );

    return SingleChildScrollView(
      child: SkeletonLoader(
        builder: rowWidget,
        items: 10,
        period: const Duration(seconds: 5),
        highlightColor: ThemeColors.primary,
        direction: SkeletonDirection.ltr,
      ),
    );
  }
}

class HomeLoading extends StatelessWidget {
  const HomeLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var rowWidget = Container(
        margin:
            const EdgeInsets.only(left: Sizes.m, right: Sizes.m, top: Sizes.m),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: Sizes.xs),
              height: 15,
              width: size.width - 120,
              color: Colors.black,
            ),
            Container(
              margin: const EdgeInsets.only(bottom: Sizes.xs),
              height: 30,
              width: size.width - 50,
              color: Colors.black,
            ),
            Row(
              children: [
                Container(
                  height: 10,
                  width: size.width / 6,
                  color: Colors.black,
                ),
                SizedBox(width: Sizes.xs),
                Container(
                  height: 10,
                  width: size.width / 6,
                  color: Colors.black,
                ),
                SizedBox(width: Sizes.xs),
                Container(
                  height: 10,
                  width: size.width / 5,
                  color: Colors.black,
                ),
              ],
            ),
          ],
        ));

    return SingleChildScrollView(
      child: SkeletonLoader(
        builder: rowWidget,
        items: 10,
        period: const Duration(seconds: 5),
        highlightColor: ThemeColors.primary,
        direction: SkeletonDirection.ltr,
      ),
    );
  }
}
