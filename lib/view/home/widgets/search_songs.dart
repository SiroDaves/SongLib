import 'package:flutter/material.dart';
import 'package:songlib/util/constants/utilities.dart';

import '../../../model/base/songext.dart';
import '../../../viewmodel/home/home_vm.dart';
import '../../../widget/general/list_items.dart';

class SearchSongs extends SearchDelegate<List> {
  List<SongExt> itemList = [], filtered = [];
  final HomeVm homeVm;
  final double? height;

  SearchSongs(BuildContext context, this.homeVm, this.height, this.itemList) {
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
    List<SongExt> matchQuery = [];
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
      itemCount: homeVm.filtered!.length,
      padding: EdgeInsets.only(
        left: height! * 0.0082,
        right: height! * 0.0082,
      ),
      itemBuilder: (context, index) {
        final SongExt song = homeVm.filtered![index];
        return SongItem(
          song: song,
          height: height!,
          onTap: () => homeVm.openPresentor(song: song),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<SongExt> matchQuery = [];

    for (var item in itemList) {
      if (item.title!.toLowerCase().startsWith(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }

    return ListView.builder(
      padding: EdgeInsets.only(
        left: height! * 0.0082,
        right: height! * 0.0082,
      ),
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return SongItem(
          song: result,
          height: height!,
          onTap: () => homeVm.openPresentor(song: result),
        );
      },
    );
  }
}
