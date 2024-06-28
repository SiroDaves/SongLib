import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:styled_widget/styled_widget.dart';

import '../../../common/theme/theme_colors.dart';
import '../../../data/models/basic_model.dart';
import 'sidebar_btn.dart';

class Sidebar extends StatelessWidget {
  final Function(PageType) onPageSelect;
  final VoidCallback? onSettingsSelect;
  final PageType? pageType;
  final bool isWeb;

  const Sidebar({
    Key? key,
    required this.pageType,
    required this.onPageSelect,
    this.onSettingsSelect,
    this.isWeb = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var l10n = AppLocalizations.of(context)!;
    var activeColor = Theme.of(context).brightness == Brightness.light
        ? ThemeColors.primary
        : Colors.white;

    var isWebColumn = Column(
      children: <Widget>[
        SidebarBtn(
          Icons.search,
          l10n.searchTitle,
          pageType: PageType.search,
          isSelected: pageType == PageType.search,
          onPressed: () => onPageSelect(PageType.search),
        ),
        Divider(color: activeColor),
        const Spacer(),
        Divider(color: activeColor),
        SidebarBtn(
          Icons.support,
          l10n.helpdeskTitle,
          pageType: PageType.helpdesk,
          isSelected: pageType == PageType.helpdesk,
          onPressed: () => onPageSelect(PageType.helpdesk),
        ),
      ],
    );

    var notWebColumn = Column(
      children: <Widget>[
        SidebarBtn(
          Icons.search,
          l10n.searchTitle,
          pageType: PageType.search,
          isSelected: pageType == PageType.search,
          onPressed: () => onPageSelect(PageType.search),
        ),
        /*Divider(color: activeColor),
        SidebarBtn(
          Icons.list,
          l10n.listTitle,
          pageType: PageType.lists,
          isSelected: pageType == PageType.lists,
          onPressed: () => onPageSelect(PageType.lists),
        ),
        Divider(color: activeColor),
        SidebarBtn(
          Icons.favorite,
          l10n.likesTitle,
          pageType: PageType.likes,
          isSelected: pageType == PageType.likes,
          onPressed: () => onPageSelect(PageType.likes),
        ),
        Divider(color: activeColor),
        SidebarBtn(
          Icons.edit,
          l10n.draftTitle,
          pageType: PageType.drafts,
          isSelected: pageType == PageType.drafts,
          onPressed: () => onPageSelect(PageType.drafts),
        ),*/
        Divider(color: activeColor),
        const Spacer(),
        Divider(color: activeColor),
        /*SidebarBtn(
          Icons.support,
          l10n.helpdeskTitle,
          pageType: PageType.helpdesk,
          isSelected: pageType == PageType.helpdesk,
          onPressed: () => onPageSelect(PageType.helpdesk),
        ),
        Divider(color: activeColor),
        */
        SidebarBtn(
          Icons.settings,
          l10n.settingsTitle,
          pageType: PageType.settings,
          isSelected: pageType == PageType.settings,
          onPressed: onSettingsSelect,
        ),
      ],
    );

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.light
            ? ThemeColors.accent
            : ThemeColors.kPrimaryDeepOrange,
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 2,
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: (isWeb ? isWebColumn : notWebColumn)
          .padding(bottom: 20)
          .constrained(maxWidth: 280),
    );
  }
}
