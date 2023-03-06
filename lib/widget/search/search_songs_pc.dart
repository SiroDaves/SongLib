import 'package:flutter/material.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../theme/theme_colors.dart';
import '../../vm/home/home_vm.dart';

/// Search songs widget for big screen
class SearchSongsPc extends StatelessWidget {
  final HomeVm? vm;
  const SearchSongsPc(this.vm, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        controller: vm!.searchController,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.search, color: ThemeColors.primaryDark),
          suffixIcon: InkWell(
            onTap: () => vm!.onClear(),
            child: const Icon(Icons.clear, color: ThemeColors.primaryDark),
          ),
          isDense: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white),
          ),
        ),
        style: const TextStyle(fontSize: 18, color: ThemeColors.primaryDark),
        textInputAction: TextInputAction.done,
        onChanged: (String query) => vm!.onSearch(query),
      ).decorated(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
