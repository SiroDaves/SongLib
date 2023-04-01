import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../navigator/mixin/back_navigator.dart';
import '../../../navigator/route_names.dart';
import '../../../theme/theme_colors.dart';
import '../../../vm/songs/song_editor_vm.dart';
import '../../../widget/inputs/form_input.dart';
import '../../../widget/progress/circular_progress.dart';
import '../../../widget/provider/provider_widget.dart';

/// Song editor screen to draft a new song or edit an existing one
class SongEditor extends StatefulWidget {
  static const String routeName = RouteNames.editSong;
  const SongEditor({Key? key}) : super(key: key);

  @override
  SongEditorState createState() => SongEditorState();
}

@visibleForTesting
class SongEditorState extends State<SongEditor>
    with BackNavigatorMixin
    implements SongEditorNavigator {
  Size? size;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return ProviderWidget<SongEditorVm>(
      create: () => GetIt.I()..init(this),
      consumerWithThemeAndLocalization:
          (context, vm, child, theme, localization) {
        //vm.context = context;
        var mainContainer = SingleChildScrollView(
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
                    iController: vm.titleController!,
                    prefix: const Icon(Icons.text_fields),
                  ),
                  FormInput(
                    iLabel: 'Song Content',
                    iController: vm.contentController!,
                    prefix: const Icon(Icons.list),
                    isMultiline: true,
                    iType: TextInputType.multiline,
                    maxInput: 20000,
                  ).expanded(),
                  FormInput(
                    iLabel: 'Song Key (Optional)',
                    iController: vm.keyController!,
                    prefix: const Icon(Icons.key),
                  ),
                  FormInput(
                    iLabel: 'Song Alias (Optional)',
                    iController: vm.aliasController!,
                    prefix: const Icon(Icons.text_format),
                  ),
                ],
              ),
            ),
          ),
        );

        return Scaffold(
          appBar: AppBar(
            title: const Text('Edit Your Song'),
            actions: <Widget>[
              InkWell(
                onTap: () => vm.saveChanges(),
                child: const Padding(
                  padding: EdgeInsets.all(10),
                  child: Icon(Icons.check),
                ),
              ),
              InkWell(
                onTap: () => vm.confirmCancel(context),
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
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white,
                  Colors.orange,
                  ThemeColors.accent,
                  ThemeColors.primary,
                  Colors.black,
                ],
              ),
            ),
            child: vm.isLoading ? const CircularProgress() : mainContainer,
          ),
        );
      },
    );
  }
}
