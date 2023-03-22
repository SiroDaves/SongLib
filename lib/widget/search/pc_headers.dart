part of '../../view/home/home_screen.dart';

/// Search songs widget for big screen
class PcSearch extends StatelessWidget {
  final HomeVm? vm;
  const PcSearch(this.vm, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var searchWidget = Expanded(
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
    switch (vm!.setPage) {
      case PageType.lists:
        return vm!.isLoading
            ? const ListLoading()
            : vm!.listeds!.isNotEmpty
                ? searchWidget
                : Container();

      case PageType.search:
        return searchWidget;

      case PageType.likes:
      case PageType.drafts:
        return InkWell(
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.all(10),
            child: Icon(Icons.add),
          ),
        );

      case PageType.helpdesk:
        return Container();

      case PageType.settings:
        return Container();
    }
  }
}

/// Action button 1
class PcActionBtn1 extends StatelessWidget {
  final HomeVm? vm;
  const PcActionBtn1(this.vm, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (vm!.setPage) {
      case PageType.lists:
        return TextButton(
          onPressed: () => newListForm(vm!, context),
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            child: Row(
              children: const <Widget>[
                Icon(Icons.add),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    'ADD A LIST', //vm!.tr!.proceed,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        );

      case PageType.search:
        return Container();

      case PageType.likes:
      case PageType.drafts:
        return InkWell(
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.all(10),
            child: Icon(Icons.add),
          ),
        );

      case PageType.helpdesk:
        return Container();

      case PageType.settings:
        return Container();
    }
  }
}
