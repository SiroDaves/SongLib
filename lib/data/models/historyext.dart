import 'package:floor/floor.dart';

import '../../common/utils/constants/app_constants.dart';

@DatabaseView(
  '${AppConstants.historyExtSql};',
  viewName: AppConstants.historiesTableViews,
)
class HistoryExt {
  int? rid;
  String? createdAt;
  int? book;
  int? songNo;
  String? title;
  String? alias;
  String? content;
  String? key;
  String? author;
  int? views;
  int? likes;
  bool? liked;
  int? songId;
  String? songbook;

  HistoryExt({
    this.rid,
    this.createdAt,
    this.book,
    this.songNo,
    this.title,
    this.alias,
    this.content,
    this.key,
    this.author,
    this.views,
    this.likes,
    this.liked,
    this.songId,
    this.songbook,
  });
}
