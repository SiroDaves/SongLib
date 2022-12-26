import 'package:context_menus/context_menus.dart';
import 'package:flutter/material.dart';

import '../../../model/base/listed.dart';
import '../../../util/constants/app_constants.dart';
import '../../../viewmodel/home/home_vm.dart';
import '../../../widget/general/list_items.dart';

class SearchList extends SearchDelegate<List> {
  List<Listed> itemList = [], filtered = [];
  final HomeVm homeVm;
  final double? height;

  SearchList(BuildContext context, this.homeVm, this.height, this.itemList) {
    filtered = itemList;
  }

  @override
  String get searchFieldLabel => "Search a List";

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xAAEB5200),
      ),
      textTheme: const TextTheme(
        headline6: TextStyle(color: Colors.white),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(color: Colors.white),
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () => query = '',
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () => close(context, itemList),
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Listed> matchQuery = [];
    for (var item in itemList) {
      if (item.title!.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
      itemCount: homeVm.listeds!.length,
      padding: EdgeInsets.only(
        left: height! * 0.0082,
        right: height! * 0.0082,
      ),
      itemBuilder: (context, index) {
        final Listed listed = homeVm.listeds![index];
        return ContextMenuRegion(
          contextMenu: GenericContextMenu(
            buttonConfigs: [
              ContextMenuButtonConfig(
                AppConstants.deleteList,
                icon: const Icon(Icons.delete, size: 20),
                onPressed: () => homeVm.deleteList(context, listed),
              ),
            ],
          ),
          child: ListedItem(
            listed: listed,
            height: height!,
            onTap: () => homeVm.openListView(listed),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Listed> matchQuery = [];

    for (var item in itemList) {
      if (item.title!.toLowerCase().startsWith(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }

    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(
        color: Colors.black,
      ),
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result.title!),
          onTap: () async {
            close(context, filtered);
          },
        );
      },
      itemCount: matchQuery.length,
    );
  }
}
