part of '../home_screen.dart';

class HomeMobile extends StatefulWidget {
  final HomeBodyState parent;
  const HomeMobile({super.key, required this.parent});

  @override
  State<HomeMobile> createState() => HomeMobileState();
}

class HomeMobileState extends State<HomeMobile> {
  late HomeBodyState parent;

  @override
  Widget build(BuildContext context) {
    parent = widget.parent;
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppConstants.appTitle,
          style: TextStyles.pageTitle1,
        ),
        actions: _buildAppBarActions(size.height),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: parent.selectedPageIndex,
        onPageChange: parent.onPageChanged,
        pages: parent.pages,
      ),
      body: PageView(
        controller: parent.pageController,
        onPageChanged: parent.onPageChanged,
        physics: const NeverScrollableScrollPhysics(),
        children: parent.pages.map((item) => item.screen).toList(),
      ),
    );
  }

  List<Widget> _buildAppBarActions(double height) {
    return [
      InkWell(
        onTap: () async {
          await showSearch(
            context: context,
            delegate: SongsSearch(context, parent._bloc, height),
          );
        },
        child: const Padding(
          padding: EdgeInsets.all(10),
          child: Icon(Icons.search),
        ),
      ),
      /*InkWell(
        onTap: () {},
        child: const Padding(
           padding: EdgeInsets.all(10),
           child: Icon(Icons.help),
         ),
       ),*/
      InkWell(
        onTap: () => Navigator.pushNamed(context, RouteNames.settings),
        child: const Padding(
          padding: EdgeInsets.all(10),
          child: Icon(Icons.settings),
        ),
      ),
    ];
  }
}
