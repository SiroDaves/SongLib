import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:card_swiper/card_swiper.dart';

import '../../../../../exports.dart';

// ignore: must_be_immutable
class HomeView extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
  Size? size;

  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = Get.size;
    controller.fetchListData();
    controller.fetchSongData();
    controller.fetchDraftsData();

    final appPages = <Widget>[
      ListsTab(),
      SearchTab(),
      NotesTab(),
    ];

    return Scaffold(
      body: Swiper(
        index: 0,
        itemBuilder: (context, index) {
          return appPages[index];
        },
        indicatorLayout: PageIndicatorLayout.COLOR,
        autoplay: false,
        itemCount: appPages.length,
        pagination: const PageSwiper(
          margin: EdgeInsets.only(top: 35),
        ),
        control: PageSwiperControl(
          iconPrevious: previousWidget(),
          iconNext: nextWidget(),
        ),
      ),
    );
  }

  Widget previousWidget() {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          const Icon(
            Icons.list_alt,
            color: AppColors.primaryColor,
            size: 20,
          ),
          Text(
            'Lists',
            style: titleTextStyle.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget nextWidget() {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          const Icon(
            Icons.edit,
            color: AppColors.primaryColor,
            size: 20,
          ),
          Text(
            'Notes',
            style: titleTextStyle.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
