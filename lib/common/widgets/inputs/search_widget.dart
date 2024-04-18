import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SearchWidget extends StatelessWidget {
  final Function(String) onSearch;
  final Function()? onClear;
  final String hint;
  final TextEditingController? searchController;

  const SearchWidget({
    Key? key,
    this.hint = '',
    this.onClear,
    required this.onSearch,
    required this.searchController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchController,
      onSubmitted:  (String query) {
        if (query.length > 2) {
          onSearch(query);
        }
      },
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: const Icon(Iconsax.search_normal),
        suffixIcon: InkWell(
          onTap: () {
            searchController!.clear();
          },
          child: const Icon(Icons.clear),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
