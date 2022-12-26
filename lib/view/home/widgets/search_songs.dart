import 'package:context_menus/context_menus.dart';
import 'package:flutter/material.dart';

import '../../../model/base/songext.dart';
import '../../../util/constants/app_constants.dart';
import '../../../viewmodel/home/home_vm.dart';
import '../../../widget/general/list_items.dart';
import '../../lists/list_view_popup.dart';

class SearchSongs extends SearchDelegate<List> {
  List<SongExt> itemList = [], filtered = [];
  final HomeVm homeVm;
  final double? height;

  SearchSongs(
      BuildContext context, this.homeVm, this.height, this.itemList) {
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
      if (item.title!.toLowerCase().contains(query.toLowerCase())) {
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
        return ContextMenuRegion(
          contextMenu: GenericContextMenu(
            buttonConfigs: [
              ContextMenuButtonConfig(
                AppConstants.likeSong,
                icon: Icon(
                  song.liked! ? Icons.favorite : Icons.favorite_border,
                  size: 20,
                ),
                onPressed: () => homeVm.likeSong(song),
              ),
              ContextMenuButtonConfig(
                AppConstants.copySong,
                icon: const Icon(Icons.copy, size: 20),
                onPressed: () => homeVm.copySong(song),
              ),
              ContextMenuButtonConfig(
                AppConstants.shareSong,
                icon: const Icon(Icons.share, size: 20),
                onPressed: () => homeVm.shareSong(song),
              ),
              ContextMenuButtonConfig(
                AppConstants.editSong,
                icon: const Icon(Icons.edit, size: 20),
                onPressed: () => homeVm.openEditor(song: song),
              ),
              ContextMenuButtonConfig(
                AppConstants.addtoList,
                icon: const Icon(Icons.add, size: 20),
                onPressed: () => showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return ListViewPopup(song: song);
                  },
                ),
              ),
            ],
          ),
          child: SongItem(
            song: song,
            height: height!,
            onTap: () => homeVm.openPresentor(song: song),
          ),
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
