import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../exports.dart';

// ignore: must_be_immutable
class SongsView extends StatelessWidget {
  final SongsController controller = Get.put(SongsController());
  final GetStorage userData = GetStorage();
  final MyDatabase database;
  Size? size;

  SongsView({Key? key, required this.database}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.db = database;
    size = Get.size;

    return Scaffold(
      backgroundColor: AppColors.grey,
      body: Center(
        key: const ValueKey('${KeyConstants.songsScreen}center'),
        child: Container(
          key: const ValueKey('${KeyConstants.songsScreen}container'),
          margin: const EdgeInsets.all(30),
          child: GetBuilder<SongsController>(
            builder: (controller) => songLoading(context),
          ),
        ),
      ),
    );
  }

  Widget songLoading(BuildContext context) {
    return FutureBuilder<List<Song>?>(
      future: controller.fetchSongs(),
      builder: (BuildContext context, AsyncSnapshot<List<Song>?> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.isNotEmpty) {
            return LineProgress(
              key: const ValueKey('${KeyConstants.songsScreen}progress'),
              progressSize: 100,
              progressVl: controller.progressValue,
              borderColor: Colors.black,
              progressColor: AppColors.primaryColor,
              backgroundColor: AppColors.secondaryColor,
            );
          } else {
            return const NoDataToShow(
              title: AppConstants.errorOccurred,
              description: AppConstants.errorOccurredBody,
            );
          }
        } else if (snapshot.hasError) {
          return const NoDataToShow(
            title: AppConstants.errorOccurred,
            description: AppConstants.noConnectionBody,
          );
        } else {
          return const CircularProgress(
            key: ValueKey(KeyConstants.circularProgress),
          );
        }
      },
    );
  }
}
