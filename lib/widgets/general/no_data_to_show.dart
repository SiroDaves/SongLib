import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class NoDataToShow extends StatelessWidget {
  final String? title;
  final String? description;

  const NoDataToShow({Key? key, this.title, this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 500,
        height: 175,
        margin: const EdgeInsets.all(30),
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [BoxShadow(blurRadius: 5)],
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(children: [
              Text(
                title!,
                style: const TextStyle(
                  fontSize: 20,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                description!,
                style: const TextStyle(fontSize: 16),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
