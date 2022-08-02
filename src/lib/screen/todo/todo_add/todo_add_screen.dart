import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:songlib/navigator/mixin/back_navigator.dart';
import 'package:songlib/navigator/mixin/error_navigator.dart';
import 'package:songlib/navigator/route_names.dart';
import 'package:songlib/styles/theme_dimens.dart';
import 'package:songlib/viewmodel/todo/todo_add/todo_add_viewmodel.dart';
import 'package:songlib/widget/general/styled/myapp_back_button.dart';
import 'package:songlib/widget/general/styled/myapp_button.dart';
import 'package:songlib/widget/general/styled/myapp_input_field.dart';
import 'package:songlib/widget/provider/provider_widget.dart';
import 'package:get_it/get_it.dart';
import 'package:scroll_when_needed/scroll_when_needed.dart';

class TodoAddScreen extends StatefulWidget {
  static const String routeName = RouteNames.todoAddScreen;

  const TodoAddScreen({Key? key}) : super(key: key);

  @override
  TodoAddScreenState createState() => TodoAddScreenState();
}

@visibleForTesting
class TodoAddScreenState extends State<TodoAddScreen> with BackNavigatorMixin, ErrorNavigatorMixin implements TodoAddNavigator {
  @override
  Widget build(BuildContext context) {
    return ProviderWidget<TodoAddViewModel>(
      create: () => GetIt.I()..init(this),
      childBuilderWithViewModel: (context, viewModel, _, localization) => Scaffold(
        appBar: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle.light,
          leading: MyappBackButton.light(onClick: viewModel.onBackClicked),
          title: Text(localization.todoAddTitle),
        ),
        body: ScrollConfiguration(
          behavior: ScrollWhenNeededBehavior(),
          child: Scrollbar(
            child: ListView(
              physics: ScrollWhenNeededPhysics(targetPlatform: Theme.of(context).platform),
              padding: const EdgeInsets.all(ThemeDimens.padding16),
              children: [
                MyappInputField(
                  hint: localization.todoAddInputHint,
                  onChanged: viewModel.onTodoChanged,
                ),
                Container(height: ThemeDimens.padding16),
                MyappButton(
                  text: localization.generalLabelSave,
                  isEnabled: viewModel.isSaveEnabled,
                  onClick: viewModel.onSaveClicked,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
