import 'package:drift/drift.dart';

class Book {
  int? id;
  int? bookId;
  int? user;
  String? title;
  String? subTitle;
  int? songs;
  int? position;
  int? bookNo;
  bool? enabled;
  String? created;
  String? updated;

  Book({
    this.id,
    this.bookId,
    this.user,
    this.title,
    this.subTitle,
    this.songs,
    this.position,
    this.bookNo,
    this.enabled,
    this.created,
    this.updated,
  });

  Book.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bookId = json['bookId'];
    user = json['user'];
    title = json['title'];
    subTitle = json['subTitle'];
    songs = json['songs'];
    position = json['position'];
    bookNo = json['bookNo'];
    enabled = json['enabled'];
    created = json['created'];
    updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['bookId'] = bookId;
    data['user'] = user;
    data['title'] = title;
    data['subTitle'] = subTitle;
    data['songs'] = songs;
    data['position'] = position;
    data['bookNo'] = bookNo;
    data['enabled'] = enabled;
    data['created'] = created;
    data['updated'] = updated;
    return data;
  }

 /* List<Book> fromParse(List<ParseObject?> data) {
    return data
        .map(
          (object) => Book(
            bookId: object!.get<String>('bookId'),
            id: object.get<int>('id'),
            bookNo: object.get<int>('bookNo'),
            title: object.get<String>('title'),
            subTitle: object.get<String>('subTitle'),
            position: object.get<int>('position'),
            songs: object.get<int>('songs'),
            enabled: object.get<bool>('enabled'),
            created: dateToString(object.get<DateTime>('created')!),
            updated: dateToString(object.get<DateTime>('updated')!),
          ),
        )
        .toList();
  }*/

  factory Book.fromData(Map<String, dynamic> data) {
    return Book(
      id: const IntType().mapFromDatabaseResponse(data['id'])!,
      bookId:
          const IntType().mapFromDatabaseResponse(data['object_id'])!,
      title: const StringType().mapFromDatabaseResponse(data['title'])!,
      subTitle:
          const StringType().mapFromDatabaseResponse(data['sub_title'])!,
      songs: const IntType().mapFromDatabaseResponse(data['songs'])!,
      position: const IntType().mapFromDatabaseResponse(data['position'])!,
      bookNo: const IntType().mapFromDatabaseResponse(data['book_no'])!,
      enabled: const BoolType().mapFromDatabaseResponse(data['enabled'])!,
      created:
          const StringType().mapFromDatabaseResponse(data['created'])!,
      updated:
          const StringType().mapFromDatabaseResponse(data['updated'])!,
    );
  }
}
