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
                : const SizedBox.shrink();

      case PageType.search:
        return searchWidget;

      case PageType.likes:
        return vm!.isLoading
            ? const ListLoading()
            : vm!.likes!.isNotEmpty
                ? searchWidget
                : const SizedBox.shrink();

      case PageType.drafts:
        return vm!.isLoading
            ? const ListLoading()
            : vm!.drafts!.isNotEmpty
                ? searchWidget
                : const SizedBox.shrink();

      case PageType.helpdesk:
        return const SizedBox.shrink();

      case PageType.settings:
        return const SizedBox.shrink();
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
          onPressed: () => newListForm(context, vm!),
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
        return const SizedBox.shrink();

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
        return const SizedBox.shrink();

      case PageType.settings:
        return const SizedBox.shrink();
    }
  }
}

/// Manage Song Books
class ManageBooksBtn extends StatelessWidget {
  final HomeVm? vm;
  final bool isClicked;
  const ManageBooksBtn(
    this.vm, {
    Key? key,
    this.isClicked = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: RawMaterialButton(
        textStyle: TextStyles.Btn.bold.size(16).textColor(Colors.white),
        fillColor: ThemeColors.primary,
        highlightColor: Colors.white.withOpacity(.1),
        focusElevation: 0,
        hoverColor: ThemeColors.accent,
        hoverElevation: 1,
        highlightElevation: 0,
        elevation: 3,
        padding: const EdgeInsets.all(10),
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: ThemeColors.primary),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        onPressed: () => vm!.navigator.goToSelection(),
        child: SizedBox(
          width: 160,
          height: 90,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(10),
                child: Icon(Icons.check_box),
              ),
              const Text(
                'Manage Your SongBooks',
                maxLines: 3,
              ).expanded(),
            ],
          ),
        ),
      ),
    );
  }
}
