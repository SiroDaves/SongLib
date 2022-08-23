import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../model/base/draft.dart';
import '../../model/base/songext.dart';
import '../../navigator/main_navigator.dart';
import '../../navigator/mixin/back_navigator.dart';
import '../../navigator/route_names.dart';
import '../../theme/theme_colors.dart';
import '../../util/constants/app_constants.dart';
import '../../vm/songs/editor_vm.dart';
import '../../widget/general/inputs.dart';
import '../../widget/provider/provider_widget.dart';

class EditorScreen extends StatefulWidget {
  static const String routeName = RouteNames.editorScreen;

  final SongExt? song;
  final Draft? draft;
  const EditorScreen({Key? key, this.draft, this.song}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // ignore: no_logic_in_create_state
    return EditorScreenState(draft, song);
  }
}

@visibleForTesting
class EditorScreenState extends State<EditorScreen>
    with BackNavigatorMixin
    implements EditorNavigator {
  EditorScreenState(this.draft, this.song);
  SongExt? song;
  Draft? draft;
  Size? size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return ProviderWidget<EditorVm>(
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

  Widget screenWidget(EditorVm viewModel) {
    if (draft != null) viewModel.draft = draft!;
    if (song != null) viewModel.song = song!;

    viewModel.loadEditor();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          viewModel.isNewContent ? 'Draft a New Song' : 'Edit Your Song',
        ),
        actions: <Widget>[
          InkWell(
            onTap: viewModel.saveChanges,
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

  Widget mainContainer(BuildContext context, EditorVm viewModel) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          FormInput(
            iLabel: 'Song Title',
            iController: viewModel.titleController!,
            prefix: const Icon(Icons.text_fields),
            iOptions: const <String>[],
          ),
          FormInput(
            iLabel: 'Song Content',
            iController: viewModel.contentController!,
            prefix: const Icon(Icons.text_format),
            isMultiline: true,
            iType: TextInputType.multiline,
            iOptions: const <String>[],
          ),
          FormInput(
            iLabel: 'Song Alias (Optional)',
            iController: viewModel.aliasController!,
            prefix: const Icon(Icons.text_fields),
            iOptions: const <String>[],
          ),
          FormInput(
            iLabel: 'Song Key Optional',
            iController: viewModel.keyController!,
            prefix: const Icon(Icons.text_fields),
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
