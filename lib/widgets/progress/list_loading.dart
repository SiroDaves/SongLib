import 'package:flutter/material.dart';
import 'package:skeleton_loader/skeleton_loader.dart';

import '../../theme/app_colors.dart';

class ListLoading extends StatelessWidget {
  const ListLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SkeletonLoader(
      builder: Container(
        height: 90,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: rowWidget(),
      ),
      items: 10,
      period: const Duration(seconds: 3),
      highlightColor: AppColors.primary,
      direction: SkeletonDirection.ltr,
    );
  }

  Widget rowWidget() {
    return Column(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 20,
          color: Colors.white,
        ),
        const SizedBox(height: 5),
        Container(
          width: double.infinity,
          height: 30,
          color: Colors.white,
        ),
        const SizedBox(height: 5),
        SizedBox(
          height: 15,
          child: Row(
            children: <Widget>[
              const Spacer(),
              Container(
                width: 75,
                margin: const EdgeInsets.only(left: 10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                ),
              ),
              Container(
                width: 75,
                margin: const EdgeInsets.only(left: 10),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}