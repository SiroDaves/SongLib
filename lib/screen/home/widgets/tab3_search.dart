import 'package:flutter/material.dart';

import '../../../model/base/draft.dart';
import '../../../theme/theme_colors.dart';
import '../../../vm/home/home_vm.dart';
import '../../../widget/general/list_items.dart';
import '../../../widget/search/search_widget.dart';

class Tab3Search extends StatelessWidget {
  final HomeVm viewModel;
  final List<Draft>? drafts;
  final double? height;

  const Tab3Search({
    Key? key,
    required this.viewModel,
    required this.drafts,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SearchWidget<Draft>(
      dataList: drafts!,
      hideSearchBoxWhenItemSelected: false,
      listContainerHeight: height! - 125,
      queryBuilder: (query, list) {
        return list
            .where(
              (draft) => draft.title!.toLowerCase().contains(
                    query.toLowerCase(),
                  ),
            )
            .toList();
      },
      popupListItemBuilder: (draft) {
        return DraftItem(
          draft: draft,
          height: height!,
          onTap: () => viewModel.openPresentor(draft: draft),
        );
      },
      selectedItemBuilder: (selectedDraft, deleteSelectedDraft) {
        return selectedDraftWidget(selectedDraft, deleteSelectedDraft);
      },
      noItemsFoundWidget: noDraftsFound(),
      textFieldBuilder: (controller, focusNode) {
        return searchField(controller, focusNode);
      },
      onItemSelected: (draft) {},
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
          hintText: "Search a Draft",
          hintStyle: TextStyle(
            color: ThemeColors.primary,
          ),
          contentPadding: const EdgeInsets.all(10),
        ),
      ),
    );
  }

  Widget selectedDraftWidget(
    Draft selectedDraft,
    VoidCallback deleteSelectedDraft,
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
                selectedDraft.title!,
                style: const TextStyle(fontSize: 14),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline, size: 22),
            color: Colors.grey[700],
            onPressed: deleteSelectedDraft,
          ),
        ],
      ),
    );
  }

  Widget noDraftsFound() {
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
          "No Drafts Found",
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[900]!.withOpacity(0.7),
          ),
        ),
      ],
    );
  }

  Widget popupListDraftWidget(Draft draft) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Text(
        draft.title!,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
