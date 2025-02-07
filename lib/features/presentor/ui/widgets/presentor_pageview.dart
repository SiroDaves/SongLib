part of '../presentor_screen.dart';

class PresentorPageView extends StatelessWidget {
  final PageController pageController;
  final List<Widget> contents;
  final ValueChanged<int> onPageChanged;

  const PresentorPageView({
    super.key,
    required this.pageController,
    required this.contents,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      physics: const AlwaysScrollableScrollPhysics(),
      itemCount: contents.length,
      onPageChanged: onPageChanged,
      itemBuilder: (context, index) => contents[index],
    );
  }
}

