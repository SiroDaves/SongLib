import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../exports.dart';

/// Books screen after Books
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
      body: songLoading(context),
      /*body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 75),
          child: LineProgress(
            isVertical: true,
            progressSize: size!.width * 0.6,
            progressVl: 100,
            borderColor: Colors.black,
            progressColor: AppColors.secondaryColor,
            backgroundColor: AppColors.white,
          ),
        ),
      ),*/
    );
  }

  Widget songLoading(BuildContext context) {
    return FutureBuilder<List<Song>?>(
      future: controller.fetchSongs(),
      builder: (BuildContext context, AsyncSnapshot<List<Song>?> snapshot) {
        Widget? widget;

        if (snapshot.hasData) {
          if (snapshot.data!.isNotEmpty) {
            return Center(
              child: Container(
                margin: const EdgeInsets.all(30),
                child: LineProgress(
                  progressSize: 100,
                  progressVl: controller.progressValue,
                  borderColor: Colors.black,
                  progressColor: AppColors.primaryColor,
                  backgroundColor: AppColors.secondaryColor,
                ),
              ),
            );
          } else {
            return Center(
              child: Container(
                width: 500,
                height: 175,
                margin: const EdgeInsets.all(30),
                decoration: const BoxDecoration(
                  color: AppColors.white,
                  //border: Border.all(color: ),
                  boxShadow: [BoxShadow(blurRadius: 5)],
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Center(
                    child: Column(children: [
                      Text(
                        AppConstants.noConnection,
                        style: titleTextStyle.copyWith(
                          fontSize: 20,
                          color: AppColors.red,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        AppConstants.noConnectionBody,
                        style: TextStyle(fontSize: 16),
                      ),
                    ]),
                  ),
                ),
              ),
            );
          }
        } else if (snapshot.hasError) {
          widget = Container();
        } else {
          widget = const CircularProgress();
        }
        return widget;
      },
    );
  }

}
