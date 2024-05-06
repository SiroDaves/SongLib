part of 'home_screen.dart';

class UpdateWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final double? size;

  const UpdateWidget({
    Key? key,
    this.onPressed,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.system_update,
          size: size,
          color: ThemeColors.primary,
        ),
        const Center(
          child: Text(
            'Update Found',
            style: TextStyle(
              color: ThemeColors.britamRed,
              fontSize: 29,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Text(
          'We have a new update of the app',
          textAlign: TextAlign.center,
          style: TextStyles.bodyStyleOne.size(20).textHeight(1.2),
        ).center().padding(all: 20),
        AppButton(
          label: 'Update',
          onPressed: onPressed,
          bgColor: ThemeColors.primary,
          foreColor: Colors.white,
          hoverColor: Colors.red,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ).center()
      ],
    );
  }
}

class HomeScreenBody extends StatefulWidget {
  final HomeScreenState parent;
  const HomeScreenBody({super.key, required this.parent});

  @override
  State<HomeScreenBody> createState() => HomeScreenBodyState();
}

class HomeScreenBodyState extends State<HomeScreenBody> {
  @override
  Widget build(BuildContext context) {
    return <Widget>[
      MobileSearchTab(),
      const SizedBox.expand(child: Center(child: Text('Page 2'))),
      const SizedBox.expand(child: Center(child: Text('Page 3'))),
      const SizedBox.expand(child: Center(child: Text('Page 4'))),
    ][widget.parent.currentPage];
  }
}
