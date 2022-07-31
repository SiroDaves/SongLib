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
          icons: [
            indicatorIcon1(),
            indicatorIcon2(),
            indicatorIcon3(),
          ],
        ),
      ),
    );
  }

  Widget indicatorIcon1() {
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

  Widget indicatorIcon2x() {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          const Icon(
            Icons.favorite,
            color: AppColors.primaryColor,
            size: 20,
          ),
          Text(
            'Likes',
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

  Widget indicatorIcon2() {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        children: [
          const Icon(
            Icons.search,
            color: AppColors.primaryColor,
            size: 20,
          ),
          Text(
            'Search',
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

  Widget indicatorIcon3() {
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
