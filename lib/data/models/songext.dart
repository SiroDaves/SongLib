import 'package:floor/floor.dart';

import '../../common/utils/constants/app_constants.dart';

const String aliasTbl1 = 'songs', aliasTbl2 = 'books';

@DatabaseView(
  'SELECT $aliasTbl1.rid, $aliasTbl1.id, $aliasTbl1.book, $aliasTbl1.songNo, $aliasTbl1.title, $aliasTbl1.alias, '
  '$aliasTbl1.content, $aliasTbl1.key, $aliasTbl1.author, $aliasTbl1.views, $aliasTbl1.likes, $aliasTbl1.createdAt, '
  '$aliasTbl1.updatedAt, $aliasTbl1.liked, $aliasTbl1.objectId AS objectid, books.title AS songbook '
  'FROM ${AppConstants.songsTable} AS $aliasTbl1 '
  'LEFT JOIN ${AppConstants.booksTable} AS $aliasTbl2 '
  'ON $aliasTbl1.book=$aliasTbl2.bookNo '
  'ORDER BY songNo ASC;',
  viewName: 'songExt',
)
class SongExt {
  int book;
  int songNo;
  String objectId;
  String title;
  String alias;
  String content;
  String key;
  String author;
  int views;
  int likes;
  String createdAt;
  String updatedAt;
  bool liked;
  int id;
  String songbook;

  SongExt(
    this.book,
    this.songNo,
    this.objectId,
    this.title,
    this.alias,
    this.content,
    this.key,
    this.author,
    this.views,
    this.likes,
    this.createdAt,
    this.updatedAt,
    this.liked,
    this.id,
    this.songbook,
  );
}
