import 'package:flutter/material.dart';

import '../../../theme/app_colors.dart';

class CircularProgress extends StatelessWidget {
  const CircularProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 100.0,
        height: 100.0,
        child: CircularProgressIndicator(
          color: AppColors.primary,
          strokeWidth: 5,
          backgroundColor: Colors.white.withOpacity(0.3),
        ),
      ),
    );
  }
}
