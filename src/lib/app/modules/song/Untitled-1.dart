import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:card_swiper/card_swiper.dart';

import '../../../../exports.dart';

// ignore: must_be_immutable
class HomeView extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());
  final MyDatabase database;
  Size? size;

  HomeView({Key? key, required this.database}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.db = database;
    size = Get.size;

    HistoryTab tab1 = HistoryTab(database: database);
    SearchTab tab2 = SearchTab(database: database);
    LikesTab tab3 = LikesTab(database: database);

    final appPages = <Widget>[
      Center(child: tab1),
      Center(child: tab2),
      Center(child: tab3),
    ];

    return Scaffold(
      body: Swiper(
        itemBuilder: (context, index) {
          return appPages[index];
        },
        indicatorLayout: PageIndicatorLayout.COLOR,
        autoplay: false,
        itemCount: appPages.length,
        pagination: const SwiperPagination(),
        control: const SwiperControl(),
      ),
    );
  }
}
