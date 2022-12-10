import 'package:drift/drift.dart';

class HistoryExt {
  int? id;
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
    this.id,
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

  factory HistoryExt.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return HistoryExt(
      createdAt: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      book: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}book'])!,
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
