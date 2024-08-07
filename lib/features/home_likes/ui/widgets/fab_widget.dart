part of '../likes_screen.dart';

class FabWidget extends StatefulWidget {
  final LikesScreenState parent;
  const FabWidget({super.key, required this.parent});

  @override
  State<FabWidget> createState() => FabWidgetState();
}

class FabWidgetState extends State<FabWidget> {
  late LikesScreenState parent;

  @override
  Widget build(BuildContext context) {
    parent = widget.parent;

    return Stack(
      children: [
        Positioned(
          right: 0,
          bottom: 0,
          child: FloatingActionButton(
            onPressed: () async {
              await showSearch(
                context: context,
                delegate: LikesSearch(
                  context,
                  parent.bloc,
                  MediaQuery.of(context).size.height,
                ),
              );
            },
            backgroundColor: Theme.of(context).brightness == Brightness.light
                ? ThemeColors.primary
                : ThemeColors.kPrimaryDeepOrange,
            child: const Icon(Icons.search),
          ),
        ),
        if (parent._showBackToTopButton) ...[
          Positioned(
            right: 0,
            bottom: 65,
            child: FloatingActionButton(
              mini: true,
              onPressed: () {
                parent._scrollController.animateTo(
                  0,
                  duration: const Duration(seconds: 2),
                  curve: Curves.easeInOut,
                );
              },
              backgroundColor: Theme.of(context).brightness == Brightness.light
                  ? ThemeColors.primary
                  : ThemeColors.kPrimaryDeepOrange,
              child: const Icon(Icons.arrow_upward),
            ),
          ),
        ],
      ],
    );
  }
}
