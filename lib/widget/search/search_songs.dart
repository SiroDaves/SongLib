import 'package:flutter/material.dart';

import '../../model/base/songext.dart';
import '../../theme/theme_colors.dart';
import '../../util/constants/utilities.dart';
import '../../vm/home/home_vm.dart';
import '../general/list_items.dart';

/// Small screen search
class SearchSongs extends SearchDelegate<List> {
  final HomeVm vm;
  final double? height;

  SearchSongs(BuildContext context, this.vm, this.height);

  @override
  String get searchFieldLabel => "Search a Song";

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: const AppBarTheme(backgroundColor: ThemeColors.primary),
      textTheme: const TextTheme(titleLarge: TextStyle(color: Colors.white)),
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
      onPressed: () => close(context, vm.songs!),
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) => searchThis(context);

  @override
  Widget buildSuggestions(BuildContext context) => searchThis(context);

  Widget searchThis(BuildContext context) {
    List<SongExt> matchQuery = vm.songs!.where((s) {
      return (isNumeric(query) && s.songNo == int.parse(query)) ||
          s.title!.toLowerCase().contains(query.toLowerCase()) ||
          s.alias!.toLowerCase().contains(query.toLowerCase()) ||
          s.content!.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.white, ThemeColors.accent, Colors.black],
        ),
      ),
      child: ListView.builder(
        //padding: EdgeInsets.all(height! * 0.015),
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
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
            isSearching: true,
            onPressed: () {
              vm.localStorage.song = vm.setSong = result;
              vm.navigator.goToSongPresentor();
            },
          );
        },
      ),
    );
  }
}
