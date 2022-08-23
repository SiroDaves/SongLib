import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../model/base/listed.dart';
import '../../navigator/main_navigator.dart';
import '../../navigator/mixin/back_navigator.dart';
import '../../navigator/route_names.dart';
import '../../theme/theme_colors.dart';
import '../../vm/lists/list_vm.dart';
import '../../widget/general/inputs.dart';
import '../../widget/provider/provider_widget.dart';

class ListEditScreen extends StatefulWidget {
  static const String routeName = RouteNames.editorScreen;

  final Listed? listed;
  const ListEditScreen({Key? key, this.listed}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return ListEditScreenState(listed);
  }
}

@visibleForTesting
class ListEditScreenState extends State<ListEditScreen>
    with BackNavigatorMixin
    implements ListNavigator {
  ListEditScreenState(this.listed);
  Listed? listed;
  Size? size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return ProviderWidget<ListVm>(
      create: () => GetIt.I()..init(this),
      consumerWithThemeAndLocalization: (
        context,
        viewModel,
        child,
        theme,
        localization,
      ) =>
          screenWidget(viewModel),
    );
  }

  Widget screenWidget(ListVm viewModel) {
    if (listed != null) viewModel.listed = listed!;

    viewModel.loadEditor();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          listed != null ? 'Draft a New List' : 'Edit Your List',
        ),
        actions: <Widget>[
          InkWell(
            onTap: () => viewModel.saveChanges,
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: Icon(Icons.check),
            ),
          ),
          InkWell(
            onTap: () => viewModel.confirmCancel(context),
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: Icon(Icons.clear),
            ),
          ),
        ],
      ),
      body: Container(
        height: size!.height,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.white,
              Colors.orange,
              ThemeColors.accent,
              ThemeColors.primary,
              Colors.black,
            ],
          ),
        ),
        child: mainContainer(context, viewModel),
      ),
    );
  }

  Widget mainContainer(BuildContext context, ListVm viewModel) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FormInput(
            iLabel: 'Title',
            iController: viewModel.titleController!,
            prefix: const Icon(Icons.text_fields),
            iOptions: const <String>[],
          ),
          FormInput(
            iLabel: 'Description (Optional)',
            iController: viewModel.contentController!,
            prefix: const Icon(Icons.text_format),
            iOptions: const <String>[],
          ),
        ],
      ),
    );
  }

  @override
  void goToHome() => MainNavigatorWidget.of(context).goToHome();

  @override
  void goToSelection() => MainNavigatorWidget.of(context).goToSelection();
}
