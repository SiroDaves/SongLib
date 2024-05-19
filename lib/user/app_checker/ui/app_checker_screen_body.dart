part of 'app_checker_screen.dart';

class AppCheckerScreenBody extends StatefulWidget {
  final AppCheckerScreenState parent;
  const AppCheckerScreenBody({super.key, required this.parent});

  @override
  State<AppCheckerScreenBody> createState() => _AppCheckerScreenBodyState();
}

class _AppCheckerScreenBodyState extends State<AppCheckerScreenBody> {
  late AppCheckerBloc _bloc;
  late AppCheckerScreenState parent;

  bool updateFound = false;
  bool isTabletOrIpad = false;
  late AppLocalizations tr;

  Future<void> checkPermissions() async {
    final PermissionStatus permission = await Permission.storage.status;
    if (permission != PermissionStatus.granted) {
      await Permission.storage.request();
      // access media location needed for android 10/Q
      await Permission.accessMediaLocation.request();
      // manage external storage needed for android 11/R
      await Permission.manageExternalStorage.request();
      //showToast(text: 'Permission granted', state: ToastStates.success);
    } else if (permission != PermissionStatus.denied) {
      //showToast(text: 'Permission denied', state: ToastStates.error);
    } else if (permission != PermissionStatus.permanentlyDenied) {
      showPermanentlyDeniedDialog();
    }
  }

  Future<void> showPermanentlyDeniedDialog() async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(tr.labelPermissionTitle),
          content: Text(tr.labelPermissionText),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(tr.cancel),
            ),
            TextButton(
              onPressed: () => openAppSettings(),
              child: Text(tr.openSettings),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _bloc = context.read<AppCheckerBloc>();

    if (isMobile) {
      checkPermissions();
      if (FlavorConfig.isProd()) {
        _bloc.add(const AppCheckerCheckUpdates());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    parent = widget.parent;
    tr = AppLocalizations.of(context)!;
    Size size = MediaQuery.of(context).size;
    isTabletOrIpad = size.shortestSide > 550;

    return BlocConsumer<AppCheckerBloc, AppCheckerState>(
      bloc: _bloc,
      listener: (context, state) {
        if (state.status == Status.updateFound) {
          setState(() => updateFound = true);
          CustomSnackbar.show(
            context,
            feedbackMessage(state.feedback, tr),
            isSuccess: true,
          );
        }
        if (state.status == Status.success) {
          setState(() => updateFound = false);
        }
      },
      builder: (context, state) {
        if (state.status == Status.updateFound) {
          return UpdateWidget(
            size: size.width / 3,
            onPressed: () => _bloc.add(const AppCheckerUpdateApp()),
          );
        } else {
          return const SplashScreen();
        }
      },
    );
  }
}

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
          style: TextStyles.bodyStyle1.size(20).textHeight(1.2),
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
