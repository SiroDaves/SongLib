import 'package:drift/drift.dart';

class SongExt {
  int? book;
  int? songNo;
  String? objectId;
  String? title;
  String? alias;
  String? content;
  String? key;
  String? author;
  int? views;
  int? likes;
  String? created;
  String? updated;
  bool? liked;
  int? id;
  String? songbook;

  SongExt({
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
    this.created,
    this.updated,
    this.liked,
    this.id,
    this.songbook,
  });

  factory SongExt.fromData(Map<String, dynamic> data) {
    return SongExt(
      id: const IntType().mapFromDatabaseResponse(data['id'])!,
      book: const IntType().mapFromDatabaseResponse(data['book'])!,
      songNo: const IntType().mapFromDatabaseResponse(data['song_no'])!,
      objectId: const StringType().mapFromDatabaseResponse(data['objectid'])!,
      title: const StringType().mapFromDatabaseResponse(data['title'])!,
      alias: const StringType().mapFromDatabaseResponse(data['alias'])!,
      content: const StringType().mapFromDatabaseResponse(data['content'])!,
      key: const StringType().mapFromDatabaseResponse(data['key'])!,
      author: const StringType().mapFromDatabaseResponse(data['author'])!,
      views: const IntType().mapFromDatabaseResponse(data['views'])!,
      likes: const IntType().mapFromDatabaseResponse(data['likes'])!,
      created:
          const StringType().mapFromDatabaseResponse(data['created'])!,
      updated:
          const StringType().mapFromDatabaseResponse(data['updated'])!,
      liked: const BoolType().mapFromDatabaseResponse(data['liked'])!,
      songbook: const StringType().mapFromDatabaseResponse(data['songbook'])!,
    );
  }
}
