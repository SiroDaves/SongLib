import 'package:songlib/vm/global/global_vm.dart';
import 'package:songlib/widget/debug/selector_item.dart';
import 'package:songlib/widget/provider/data_provider_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SelectLanguageDialog extends StatelessWidget {
  final VoidCallback goBack;

  const SelectLanguageDialog({
    required this.goBack,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final globalVm = Provider.of<GlobalVm>(context);
    return DataProviderWidget(
      childBuilderLocalization: (context, localization) => AlertDialog(
        title: const Text('localization.debugLocaleSelector'),
        content: SizedBox(
          height: 150,
          width: MediaQuery.of(context).size.width / 1.2,
          child: ListView(
            shrinkWrap: true,
            children: [
              SelectorItem(
                title: 'localization.generalLabelSystemDefault',
                selected: globalVm.isLanguageSelected(null),
                onClick: () {
                  globalVm.onUpdateLocaleClicked(null);
                  goBack();
                },
              ),
              SelectorItem(
                title: 'English',
                selected: globalVm.isLanguageSelected('en'),
                onClick: () {
                  globalVm.onUpdateLocaleClicked(const Locale('en'));
                  goBack();
                },
              ),
              SelectorItem(
                title: 'Nederlands',
                selected: globalVm.isLanguageSelected('nl'),
                onClick: () {
                  globalVm.onUpdateLocaleClicked(const Locale('nl'));
                  goBack();
                },
              ),
              SelectorItem(
                title: 'Français',
                selected: globalVm.isLanguageSelected('fr'),
                onClick: () {
                  globalVm.onUpdateLocaleClicked(const Locale('fr'));
                  goBack();
                },
              ),
              SelectorItem(
                title: 'Español',
                selected: globalVm.isLanguageSelected('es'),
                onClick: () {
                  globalVm.onUpdateLocaleClicked(const Locale('es'));
                  goBack();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
