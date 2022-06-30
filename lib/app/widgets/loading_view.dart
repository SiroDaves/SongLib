import 'package:flutter/material.dart';

import '../exports.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Center(
        child: CircularProgressIndicator(
          color: AppColors.themeColor,
        ),
      ),
      color: Colors.white.withOpacity(0.8),
    );
  }
}
