import 'package:flutter/material.dart';

import '../exports.dart';

class CircularProgress extends StatelessWidget {
  const CircularProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 100.0,
        height: 100.0,
        child: CircularProgressIndicator(
          color: AppColors.primaryColor,
          strokeWidth: 5,
          backgroundColor: AppColors.white.withOpacity(0.3),
        ),
      ),
    );
  }
}
