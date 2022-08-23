import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../model/base/listed.dart';
import '../../navigator/main_navigator.dart';
import '../../navigator/mixin/back_navigator.dart';
import '../../navigator/route_names.dart';
import '../../vm/lists/list_vm.dart';
import '../../widget/provider/provider_widget.dart';

class ListScreen extends StatefulWidget {
  static const String routeName = RouteNames.listScreen;
  final Listed? listed;

  const ListScreen({
    Key? key,
    required this.listed,
  }) : super(key: key);

  @override
  ListScreenState createState() => ListScreenState();
}

@visibleForTesting
class ListScreenState extends State<ListScreen>
    with BackNavigatorMixin
    implements ListNavigator {
  Listed? listed;
  @override
  Widget build(BuildContext context) {
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
    viewModel.listed = listed;
    viewModel.fetchData();
    return Scaffold(
      appBar: AppBar(
        title: Text(listed!.title!),
        actions: <Widget>[
          InkWell(
            onTap: () => {},
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: Icon(Icons.edit),
            ),
          ),
          InkWell(
            onTap: () => {},
            child: const Padding(
              padding: EdgeInsets.all(10),
              child: Icon(Icons.delete),
            ),
          ),
        ],
      ),
      body: Container(),
    );
  }

  @override
  void goToHome() => MainNavigatorWidget.of(context).goToHome();

  @override
  void goToSelection() => MainNavigatorWidget.of(context).goToSelection();
}
