import 'package:flutter/material.dart';

import '../../../model/base/draft.dart';
import '../../../util/constants/utilities.dart';
import '../../../viewmodel/home/home_vm.dart';
import '../../../widget/general/list_items.dart';

class SearchDrafts extends SearchDelegate<List> {
  List<Draft> itemList = [], filtered = [];
  final HomeVm homeVm;
  final double? height;

  SearchDrafts(BuildContext context, this.homeVm, this.height, this.itemList) {
    filtered = itemList;
  }

  @override
  String get searchFieldLabel => "Search a Song";

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
    List<Draft> matchQuery = [];
    for (var item in itemList) {
      if (isNumeric(query)) {
        matchQuery.add(item);
      } else if (item.title!.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      } else if (item.alias!.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      } else if (item.content!.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
      itemBuilder: (context, index) {
        var result = homeVm.drafts![index];
        return DraftItem(
          draft: result,
          height: height!,
          onTap: () => homeVm.openPresentor(draft: result),
        );
      },
      itemCount: homeVm.drafts!.length,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Draft> matchQuery = [];

    for (var item in itemList) {
      if (item.title!.toLowerCase().startsWith(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }

    return ListView.builder(
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return DraftItem(
          draft: result,
          height: height!,
          onTap: () => homeVm.openPresentor(draft: result),
        );
      },
      itemCount: matchQuery.length,
    );
  }
}
