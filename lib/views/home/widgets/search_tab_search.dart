import 'package:flutter/material.dart';

import '../../../models/base/song.dart';
import '../../../models/exts/songext.dart';
import '../../../theme/app_colors.dart';
import '../../../utils/constants/utilities.dart';
import '../../../view_models/home/home_vm.dart';
import '../../../widgets/general/list_items.dart';
import '../../../widgets/search/search_widget.dart';

/// Search widget for search tab
class SearchTabSearch extends StatelessWidget {
  final HomeVm viewModel;
  final List<SongExt>? songs;
  final double? height;

  const SearchTabSearch({
    Key? key,
    required this.viewModel,
    required this.songs,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SearchWidget<SongExt>(
      dataList: songs!,
      hideSearchBoxWhenItemSelected: false,
      listContainerHeight: height! - 125,
      queryBuilder: (query, list) {
        final List<SongExt> filtered = [];
        for (int i = 0; i < list.length; i++) {
          final SongExt song = list[i];
          if (isNumeric(query)) {
            if (song.songNo! == int.parse(query)) {
              filtered.add(song);
            }
          } else {
            if (song.title!.toLowerCase().contains(query.toLowerCase()) ||
                song.alias!.toLowerCase().contains(query.toLowerCase()) ||
                song.content!.toLowerCase().contains(query.toLowerCase())) {
              filtered.add(song);
            }
          }
        }
        return filtered;
      },
      popupListItemBuilder: (song) {
        return SongItem(
          song: song,
          height: height!,
          onTap: () => viewModel.openPresentor(song: song),
        );
      },
      selectedItemBuilder: (selectedSong, deleteSelectedSong) {
        return Container();
      },
      noItemsFoundWidget: noSongsFound(),
      textFieldBuilder: (controller, focusNode) {
        return searchField(controller, focusNode);
      },
      onItemSelected: (song) {},
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
          color: AppColors.primary,
        ),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColors.primary),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColors.primary),
          ),
          prefixIcon: const Icon(Icons.search, color: AppColors.primary),
          //suffixIcon: const Icon(Icons.mic, color: AppColors.primary),
          border: InputBorder.none,
          hintText: "Search a Song",
          hintStyle: const TextStyle(
            color: AppColors.primary,
          ),
          contentPadding: const EdgeInsets.all(10),
        ),
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
