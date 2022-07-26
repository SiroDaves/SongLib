import 'package:flutter/material.dart';

import '../../../../../exports.dart';

class Tab1Search extends StatelessWidget {
  final List<Listed>? listeds;
  final double? height;

  const Tab1Search({
    Key? key,
    required this.listeds,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SearchWidget<Listed>(
      dataList: listeds!,
      hideSearchBoxWhenItemSelected: false,
      listContainerHeight: height! - 125,
      queryBuilder: (query, list) {
        return list
            .where(
              (listed) => listed.title.toLowerCase().contains(query.toLowerCase()),
            )
            .toList();
      },
      popupListItemBuilder: (listed) {
        return ListedItem(listed: listed, height: height!);
      },
      selectedItemBuilder: (selectedListed, deleteSelectedListed) {
        return selectedListedWidget(selectedListed, deleteSelectedListed);
      },
      noItemsFoundWidget: noListedsFound(),
      textFieldBuilder: (controller, focusNode) {
        return searchField(controller, focusNode);
      },
      onItemSelected: (listed) {
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
        color: AppColors.white,
        boxShadow: [BoxShadow(blurRadius: 3)],
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: TextField(
        controller: qryController,
        focusNode: focusNode,
        style: normalTextStyle.copyWith(
          fontSize: height! * 0.0326,
          color: AppColors.primaryColor,
        ),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColors.primaryColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColors.primaryColor),
          ),
          prefixIcon: const Icon(Icons.search, color: AppColors.primaryColor),
          //suffixIcon: const Icon(Icons.mic, color: AppColors.primaryColor),
          border: InputBorder.none,
          hintText: "Search a List",
          hintStyle: normalTextStyle.copyWith(
            color: AppColors.primaryColor,
          ),
          contentPadding: const EdgeInsets.all(10),
        ),
      ),
    );
  }

  Widget selectedListedWidget(
    Listed selectedListed,
    VoidCallback deleteSelectedListed,
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
                selectedListed.title,
                style: const TextStyle(fontSize: 14),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline, size: 22),
            color: Colors.grey[700],
            onPressed: deleteSelectedListed,
          ),
        ],
      ),
    );
  }

  Widget noListedsFound() {
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
          "No Listeds Found",
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[900]!.withOpacity(0.7),
          ),
        ),
      ],
    );
  }

  Widget popupListListedWidget(Listed listed) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Text(
        listed.title,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
