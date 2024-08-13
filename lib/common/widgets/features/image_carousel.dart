import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../core/theme/theme_colors.dart';

class ImageCaurosel extends StatefulWidget {
  const ImageCaurosel({super.key});

  @override
  State<ImageCaurosel> createState() => _ImageCauroselState();
}

class _ImageCauroselState extends State<ImageCaurosel> {
  List imageList = [
    {"id": 1, "image_path": 'assets/images/banner1.png'},
    {"id": 2, "image_path": 'assets/images/banner2.png'},
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    var inkWellWidget = InkWell(
      onTap: () {},
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width - 24,
          decoration: BoxDecoration(
              border: Border.all(color: ThemeColors.blackText),
              borderRadius: BorderRadius.circular(10)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CarouselSlider(
              items: imageList
                  .map(
                    (item) => Image.asset(
                      item['image_path'],
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width - 24,
                    ),
                  )
                  .toList(),
              carouselController: carouselController,
              options: CarouselOptions(
                scrollPhysics: const BouncingScrollPhysics(),
                autoPlay: true,
                aspectRatio: 1.6,
                viewportFraction: 1,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
    var positionedWidget = Positioned(
      bottom: 10,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: imageList.asMap().entries.map((entry) {
          return GestureDetector(
            onTap: () => carouselController.animateToPage(entry.key),
            child: Container(
              width: currentIndex == entry.key ? 17 : 7,
              height: 7.0,
              margin: const EdgeInsets.symmetric(
                horizontal: 3.0,
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: currentIndex == entry.key
                      ? ThemeColors.britamRed
                      : ThemeColors.primary),
            ),
          );
        }).toList(),
      ),
    );
    return Card(
      elevation: 3,
      child: Stack(
        children: [
          inkWellWidget,
          positionedWidget,
        ],
      ),
    );
  }
}
