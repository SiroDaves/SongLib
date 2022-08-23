import 'package:drift/drift.dart';

class ListedExt {
  int? parentid;
  int? position;
  String? createdAt;
  String? updatedAt;
  int? id;
  int? song;
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

  ListedExt({
    this.parentid,
    this.position,
    this.createdAt,
    this.updatedAt,
    this.id,
    this.song,
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

  factory ListedExt.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ListedExt(
      parentid: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}parentid'])!,
      position: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}position'])!,
      createdAt: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
      updatedAt: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at'])!,
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      book: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}book'])!,
      song: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}song'])!,
      songNo: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}song_no'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      alias: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}alias'])!,
      content: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}content'])!,
      key: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}key'])!,
      author: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}author'])!,
      views: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}views'])!,
      likes: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}likes'])!,
      liked: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}liked'])!,
      songId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}songId'])!,
      songbook: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}songbook'])!,
    );
  }
}
