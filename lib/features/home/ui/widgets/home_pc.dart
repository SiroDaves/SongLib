part of '../home_screen.dart';

class HomePc extends StatefulWidget {
  final HomeBodyState parent;
  const HomePc({super.key, required this.parent});

  @override
  State<HomePc> createState() => HomePcState();
}

class HomePcState extends State<HomePc> {
  late HomeBodyState parent;

  @override
  Widget build(BuildContext context) {
    parent = widget.parent;
    return Stack(
      children: [
        FadingIndexedStack(
          duration: AppDurations.slow,
          index: parent.selectedPageIndex,
          children: parent.pages.map((item) => item.screen).toList(),
        )
            .positioned(left: 300, right: 0, bottom: 0, top: 0, animate: true)
            .animate(.35.seconds, Curves.bounceIn),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: const BoxDecoration(
            color: ThemeColors.accent,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 2,
                blurRadius: 2,
                offset: Offset(0, 1),
              ),
            ],
          ),
          child: Column(
            children: <Widget>[
              SidebarBtn(
                Icons.search,
                'Songs',
                isSelected: parent.selectedPageIndex == 0,
                onPressed: () => parent.onPageChanged(0),
              ),
              const Divider(color: ThemeColors.primaryDark),
              SidebarBtn(
                Icons.favorite,
                'Likes',
                isSelected: parent.selectedPageIndex == 1,
                onPressed: () => parent.onPageChanged(1),
              ),
              const Spacer(),
              SidebarBtn(
                Icons.settings,
                'Settings',
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(Sizes.l),
                        ),
                        child: const SizedBox(
                          height: 350,
                          width: 500,
                          child: SettingsScreen(),
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        )
            .positioned(left: 0, top: 0, bottom: 0, width: 300, animate: true)
            .animate(.35.seconds, Curves.easeOut),
      ],
    );
  }
}
