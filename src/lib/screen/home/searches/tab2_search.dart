import 'package:flutter/material.dart';

import '../../../model/base/book.dart';
import '../../../model/base/song.dart';
import '../../../theme/theme_colors.dart';
import '../../../widget/general/list_items.dart';
import '../../../widget/general/search/search_widget.dart';

class Tab2Search extends StatelessWidget {
  final List<Book>? books;
  final List<Song>? songs;
  final double? height;

  const Tab2Search({
    Key? key,
    required this.books,
    required this.songs,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SearchWidget<Song>(
      dataList: songs!,
      hideSearchBoxWhenItemSelected: false,
      listContainerHeight: height! - 125,
      queryBuilder: (query, list) {
        return list
            .where(
              (song) => song.title!.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();
      },
      popupListItemBuilder: (song) {
        return SongItem(
          song: song,
          height: height!,
          onTap: () {},
        );
      },
      selectedItemBuilder: (selectedSong, deleteSelectedSong) {
        //return selectedSongWidget(selectedSong, deleteSelectedSong);
        return Container();
      },
      noItemsFoundWidget: noSongsFound(),
      textFieldBuilder: (controller, focusNode) {
        return searchField(controller, focusNode);
      },
      onItemSelected: (song) {
        //_selectedItem = item;
      },
    );
  }

  Widget searchField(
      TextEditingController qryController, FocusNode? focusNode) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: height! * 0.0082,
        horizontal: height! * 0.0163,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(blurRadius: 3)],
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: TextField(
        controller: qryController,
        focusNode: focusNode,
        style: TextStyle(
          fontSize: height! * 0.0326,
          color: ThemeColors.primary,
        ),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: ThemeColors.primary),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: ThemeColors.primary),
          ),
          prefixIcon: const Icon(Icons.search, color: ThemeColors.primary),
          //suffixIcon: const Icon(Icons.mic, color: ThemeColors.primary),
          border: InputBorder.none,
          hintText: "Search a Song",
          hintStyle: const TextStyle(
            color: ThemeColors.primary,
          ),
          contentPadding: const EdgeInsets.all(10),
        ),
      ),
    );
  }

  Widget selectedSongWidgetx(
    Song selectedSong,
    VoidCallback deleteSelectedSong,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 2,
        horizontal: 4,
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 8,
                bottom: 8,
              ),
              child: Text(
                selectedSong.title!,
                style: const TextStyle(fontSize: 14),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline, size: 22),
            color: Colors.grey[700],
            onPressed: deleteSelectedSong,
          ),
        ],
      ),
    );
  }

  Widget noSongsFound() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(
          Icons.folder_open,
          size: 24,
          color: Colors.grey[900]!.withOpacity(0.7),
        ),
        const SizedBox(width: 10),
        Text(
          "No Songs Found",
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[900]!.withOpacity(0.7),
          ),
        ),
      ],
    );
  }

  Widget popupListSongWidget(Song song) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Text(
        song.title!,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
