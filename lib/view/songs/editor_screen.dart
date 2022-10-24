import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../navigator/mixin/back_navigator.dart';
import '../../navigator/route_names.dart';
import '../../theme/theme_colors.dart';
import '../../viewmodel/songs/editor_vm.dart';
import '../../widget/general/inputs.dart';
import '../../widget/progress/circular_progress.dart';
import '../../widget/provider/provider_widget.dart';

/// Song editor screen to draft a new song or edit an existing one
class EditorScreen extends StatefulWidget {
  static const String routeName = RouteNames.editorScreen;
  const EditorScreen({Key? key}) : super(key: key);

  @override
  EditorScreenState createState() => EditorScreenState();
}

@visibleForTesting
class EditorScreenState extends State<EditorScreen>
    with BackNavigatorMixin
    implements EditorNavigator {
  EditorVm? vm;
  Size? size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return ProviderWidget<EditorVm>(
      create: () => GetIt.I()..init(this),
      consumerWithThemeAndLocalization:
          (context, viewModel, child, theme, localization) {
        vm = viewModel;
        return screenWidget();
      },
    );
  }

  Widget screenWidget() {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          vm!.isNewContent ? 'Draft a New Song' : 'Edit Your Song',
        ),
        actions: <Widget>[
          InkWell(
            onTap: () => vm!.saveChanges(),
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: Icon(Icons.check),
            ),
          ),
          InkWell(
            onTap: () => vm!.confirmCancel(context),
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
        child: vm!.isBusy ? const CircularProgress() : mainContainer(),
      ),
    );
  }

  Widget mainContainer() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(5),
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              FormInput(
                iLabel: 'Song Title',
                iController: vm!.titleController!,
                prefix: const Icon(Icons.text_fields),
                iOptions: const <String>[],
              ),
              FormInput(
                iLabel: 'Song Content',
                iController: vm!.contentController!,
                prefix: const Icon(Icons.list),
                isMultiline: true,
                iType: TextInputType.multiline,
                iOptions: const <String>[],
              ),
              FormInput(
                iLabel: 'Song Key (Optional)',
                iController: vm!.keyController!,
                prefix: const Icon(Icons.key),
                iOptions: const <String>[],
              ),
              FormInput(
                iLabel: 'Song Alias (Optional)',
                iController: vm!.aliasController!,
                prefix: const Icon(Icons.text_format),
                iOptions: const <String>[],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
