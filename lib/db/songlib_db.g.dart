// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'songlib_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Books extends DataClass implements Insertable<Books> {
  final int id;
  final String objectId;
  final bool enabled;
  final int bookNo;
  final String title;
  final String subTitle;
  final int songs;
  final int position;
  final String createdAt;
  final String updatedAt;
  Books(
      {required this.id,
      required this.objectId,
      required this.enabled,
      required this.bookNo,
      required this.title,
      required this.subTitle,
      required this.songs,
      required this.position,
      required this.createdAt,
      required this.updatedAt});
  factory Books.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Books(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      objectId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}object_id'])!,
      enabled: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}enabled'])!,
      bookNo: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}book_no'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      subTitle: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}sub_title'])!,
      songs: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}songs'])!,
      position: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}position'])!,
      createdAt: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
      updatedAt: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['object_id'] = Variable<String>(objectId);
    map['enabled'] = Variable<bool>(enabled);
    map['book_no'] = Variable<int>(bookNo);
    map['title'] = Variable<String>(title);
    map['sub_title'] = Variable<String>(subTitle);
    map['songs'] = Variable<int>(songs);
    map['position'] = Variable<int>(position);
    map['created_at'] = Variable<String>(createdAt);
    map['updated_at'] = Variable<String>(updatedAt);
    return map;
  }

  BooksTableCompanion toCompanion(bool nullToAbsent) {
    return BooksTableCompanion(
      id: Value(id),
      objectId: Value(objectId),
      enabled: Value(enabled),
      bookNo: Value(bookNo),
      title: Value(title),
      subTitle: Value(subTitle),
      songs: Value(songs),
      position: Value(position),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Books.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Books(
      id: serializer.fromJson<int>(json['id']),
      objectId: serializer.fromJson<String>(json['objectId']),
      enabled: serializer.fromJson<bool>(json['enabled']),
      bookNo: serializer.fromJson<int>(json['bookNo']),
      title: serializer.fromJson<String>(json['title']),
      subTitle: serializer.fromJson<String>(json['subTitle']),
      songs: serializer.fromJson<int>(json['songs']),
      position: serializer.fromJson<int>(json['position']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      updatedAt: serializer.fromJson<String>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'objectId': serializer.toJson<String>(objectId),
      'enabled': serializer.toJson<bool>(enabled),
      'bookNo': serializer.toJson<int>(bookNo),
      'title': serializer.toJson<String>(title),
      'subTitle': serializer.toJson<String>(subTitle),
      'songs': serializer.toJson<int>(songs),
      'position': serializer.toJson<int>(position),
      'createdAt': serializer.toJson<String>(createdAt),
      'updatedAt': serializer.toJson<String>(updatedAt),
    };
  }

  Books copyWith(
          {int? id,
          String? objectId,
          bool? enabled,
          int? bookNo,
          String? title,
          String? subTitle,
          int? songs,
          int? position,
          String? createdAt,
          String? updatedAt}) =>
      Books(
        id: id ?? this.id,
        objectId: objectId ?? this.objectId,
        enabled: enabled ?? this.enabled,
        bookNo: bookNo ?? this.bookNo,
        title: title ?? this.title,
        subTitle: subTitle ?? this.subTitle,
        songs: songs ?? this.songs,
        position: position ?? this.position,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('Books(')
          ..write('id: $id, ')
          ..write('objectId: $objectId, ')
          ..write('enabled: $enabled, ')
          ..write('bookNo: $bookNo, ')
          ..write('title: $title, ')
          ..write('subTitle: $subTitle, ')
          ..write('songs: $songs, ')
          ..write('position: $position, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, objectId, enabled, bookNo, title,
      subTitle, songs, position, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Books &&
          other.id == this.id &&
          other.objectId == this.objectId &&
          other.enabled == this.enabled &&
          other.bookNo == this.bookNo &&
          other.title == this.title &&
          other.subTitle == this.subTitle &&
          other.songs == this.songs &&
          other.position == this.position &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class BooksTableCompanion extends UpdateCompanion<Books> {
  final Value<int> id;
  final Value<String> objectId;
  final Value<bool> enabled;
  final Value<int> bookNo;
  final Value<String> title;
  final Value<String> subTitle;
  final Value<int> songs;
  final Value<int> position;
  final Value<String> createdAt;
  final Value<String> updatedAt;
  const BooksTableCompanion({
    this.id = const Value.absent(),
    this.objectId = const Value.absent(),
    this.enabled = const Value.absent(),
    this.bookNo = const Value.absent(),
    this.title = const Value.absent(),
    this.subTitle = const Value.absent(),
    this.songs = const Value.absent(),
    this.position = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  BooksTableCompanion.insert({
    this.id = const Value.absent(),
    required String objectId,
    this.enabled = const Value.absent(),
    this.bookNo = const Value.absent(),
    this.title = const Value.absent(),
    this.subTitle = const Value.absent(),
    this.songs = const Value.absent(),
    this.position = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : objectId = Value(objectId);
  static Insertable<Books> custom({
    Expression<int>? id,
    Expression<String>? objectId,
    Expression<bool>? enabled,
    Expression<int>? bookNo,
    Expression<String>? title,
    Expression<String>? subTitle,
    Expression<int>? songs,
    Expression<int>? position,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (objectId != null) 'object_id': objectId,
      if (enabled != null) 'enabled': enabled,
      if (bookNo != null) 'book_no': bookNo,
      if (title != null) 'title': title,
      if (subTitle != null) 'sub_title': subTitle,
      if (songs != null) 'songs': songs,
      if (position != null) 'position': position,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  BooksTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? objectId,
      Value<bool>? enabled,
      Value<int>? bookNo,
      Value<String>? title,
      Value<String>? subTitle,
      Value<int>? songs,
      Value<int>? position,
      Value<String>? createdAt,
      Value<String>? updatedAt}) {
    return BooksTableCompanion(
      id: id ?? this.id,
      objectId: objectId ?? this.objectId,
      enabled: enabled ?? this.enabled,
      bookNo: bookNo ?? this.bookNo,
      title: title ?? this.title,
      subTitle: subTitle ?? this.subTitle,
      songs: songs ?? this.songs,
      position: position ?? this.position,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (objectId.present) {
      map['object_id'] = Variable<String>(objectId.value);
    }
    if (enabled.present) {
      map['enabled'] = Variable<bool>(enabled.value);
    }
    if (bookNo.present) {
      map['book_no'] = Variable<int>(bookNo.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (subTitle.present) {
      map['sub_title'] = Variable<String>(subTitle.value);
    }
    if (songs.present) {
      map['songs'] = Variable<int>(songs.value);
    }
    if (position.present) {
      map['position'] = Variable<int>(position.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BooksTableCompanion(')
          ..write('id: $id, ')
          ..write('objectId: $objectId, ')
          ..write('enabled: $enabled, ')
          ..write('bookNo: $bookNo, ')
          ..write('title: $title, ')
          ..write('subTitle: $subTitle, ')
          ..write('songs: $songs, ')
          ..write('position: $position, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $BooksTableTable extends BooksTable
    with TableInfo<$BooksTableTable, Books> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BooksTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _objectIdMeta = const VerificationMeta('objectId');
  @override
  late final GeneratedColumn<String?> objectId = GeneratedColumn<String?>(
      'object_id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      defaultConstraints: 'UNIQUE');
  final VerificationMeta _enabledMeta = const VerificationMeta('enabled');
  @override
  late final GeneratedColumn<bool?> enabled = GeneratedColumn<bool?>(
      'enabled', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (enabled IN (0, 1))',
      defaultValue: const Constant(false));
  final VerificationMeta _bookNoMeta = const VerificationMeta('bookNo');
  @override
  late final GeneratedColumn<int?> bookNo = GeneratedColumn<int?>(
      'book_no', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  final VerificationMeta _subTitleMeta = const VerificationMeta('subTitle');
  @override
  late final GeneratedColumn<String?> subTitle = GeneratedColumn<String?>(
      'sub_title', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  final VerificationMeta _songsMeta = const VerificationMeta('songs');
  @override
  late final GeneratedColumn<int?> songs = GeneratedColumn<int?>(
      'songs', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  final VerificationMeta _positionMeta = const VerificationMeta('position');
  @override
  late final GeneratedColumn<int?> position = GeneratedColumn<int?>(
      'position', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String?> createdAt = GeneratedColumn<String?>(
      'created_at', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String?> updatedAt = GeneratedColumn<String?>(
      'updated_at', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        objectId,
        enabled,
        bookNo,
        title,
        subTitle,
        songs,
        position,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? 'db_book_table';
  @override
  String get actualTableName => 'db_book_table';
  @override
  VerificationContext validateIntegrity(Insertable<Books> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('object_id')) {
      context.handle(_objectIdMeta,
          objectId.isAcceptableOrUnknown(data['object_id']!, _objectIdMeta));
    } else if (isInserting) {
      context.missing(_objectIdMeta);
    }
    if (data.containsKey('enabled')) {
      context.handle(_enabledMeta,
          enabled.isAcceptableOrUnknown(data['enabled']!, _enabledMeta));
    }
    if (data.containsKey('book_no')) {
      context.handle(_bookNoMeta,
          bookNo.isAcceptableOrUnknown(data['book_no']!, _bookNoMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    }
    if (data.containsKey('sub_title')) {
      context.handle(_subTitleMeta,
          subTitle.isAcceptableOrUnknown(data['sub_title']!, _subTitleMeta));
    }
    if (data.containsKey('songs')) {
      context.handle(
          _songsMeta, songs.isAcceptableOrUnknown(data['songs']!, _songsMeta));
    }
    if (data.containsKey('position')) {
      context.handle(_positionMeta,
          position.isAcceptableOrUnknown(data['position']!, _positionMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Books map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Books.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $BooksTableTable createAlias(String alias) {
    return $BooksTableTable(attachedDatabase, alias);
  }
}

class Drafts extends DataClass implements Insertable<Drafts> {
  final int id;
  final String objectId;
  final int book;
  final int songNo;
  final String title;
  final String alias;
  final String content;
  final String key;
  final String author;
  final int views;
  final String createdAt;
  final String updatedAt;
  final bool liked;
  Drafts(
      {required this.id,
      required this.objectId,
      required this.book,
      required this.songNo,
      required this.title,
      required this.alias,
      required this.content,
      required this.key,
      required this.author,
      required this.views,
      required this.createdAt,
      required this.updatedAt,
      required this.liked});
  factory Drafts.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Drafts(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      objectId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}object_id'])!,
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
      createdAt: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
      updatedAt: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at'])!,
      liked: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}liked'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['object_id'] = Variable<String>(objectId);
    map['book'] = Variable<int>(book);
    map['song_no'] = Variable<int>(songNo);
    map['title'] = Variable<String>(title);
    map['alias'] = Variable<String>(alias);
    map['content'] = Variable<String>(content);
    map['key'] = Variable<String>(key);
    map['author'] = Variable<String>(author);
    map['views'] = Variable<int>(views);
    map['created_at'] = Variable<String>(createdAt);
    map['updated_at'] = Variable<String>(updatedAt);
    map['liked'] = Variable<bool>(liked);
    return map;
  }

  DraftsTableCompanion toCompanion(bool nullToAbsent) {
    return DraftsTableCompanion(
      id: Value(id),
      objectId: Value(objectId),
      book: Value(book),
      songNo: Value(songNo),
      title: Value(title),
      alias: Value(alias),
      content: Value(content),
      key: Value(key),
      author: Value(author),
      views: Value(views),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      liked: Value(liked),
    );
  }

  factory Drafts.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Drafts(
      id: serializer.fromJson<int>(json['id']),
      objectId: serializer.fromJson<String>(json['objectId']),
      book: serializer.fromJson<int>(json['book']),
      songNo: serializer.fromJson<int>(json['songNo']),
      title: serializer.fromJson<String>(json['title']),
      alias: serializer.fromJson<String>(json['alias']),
      content: serializer.fromJson<String>(json['content']),
      key: serializer.fromJson<String>(json['key']),
      author: serializer.fromJson<String>(json['author']),
      views: serializer.fromJson<int>(json['views']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      updatedAt: serializer.fromJson<String>(json['updatedAt']),
      liked: serializer.fromJson<bool>(json['liked']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'objectId': serializer.toJson<String>(objectId),
      'book': serializer.toJson<int>(book),
      'songNo': serializer.toJson<int>(songNo),
      'title': serializer.toJson<String>(title),
      'alias': serializer.toJson<String>(alias),
      'content': serializer.toJson<String>(content),
      'key': serializer.toJson<String>(key),
      'author': serializer.toJson<String>(author),
      'views': serializer.toJson<int>(views),
      'createdAt': serializer.toJson<String>(createdAt),
      'updatedAt': serializer.toJson<String>(updatedAt),
      'liked': serializer.toJson<bool>(liked),
    };
  }

  Drafts copyWith(
          {int? id,
          String? objectId,
          int? book,
          int? songNo,
          String? title,
          String? alias,
          String? content,
          String? key,
          String? author,
          int? views,
          String? createdAt,
          String? updatedAt,
          bool? liked}) =>
      Drafts(
        id: id ?? this.id,
        objectId: objectId ?? this.objectId,
        book: book ?? this.book,
        songNo: songNo ?? this.songNo,
        title: title ?? this.title,
        alias: alias ?? this.alias,
        content: content ?? this.content,
        key: key ?? this.key,
        author: author ?? this.author,
        views: views ?? this.views,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        liked: liked ?? this.liked,
      );
  @override
  String toString() {
    return (StringBuffer('Drafts(')
          ..write('id: $id, ')
          ..write('objectId: $objectId, ')
          ..write('book: $book, ')
          ..write('songNo: $songNo, ')
          ..write('title: $title, ')
          ..write('alias: $alias, ')
          ..write('content: $content, ')
          ..write('key: $key, ')
          ..write('author: $author, ')
          ..write('views: $views, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('liked: $liked')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, objectId, book, songNo, title, alias,
      content, key, author, views, createdAt, updatedAt, liked);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Drafts &&
          other.id == this.id &&
          other.objectId == this.objectId &&
          other.book == this.book &&
          other.songNo == this.songNo &&
          other.title == this.title &&
          other.alias == this.alias &&
          other.content == this.content &&
          other.key == this.key &&
          other.author == this.author &&
          other.views == this.views &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.liked == this.liked);
}

class DraftsTableCompanion extends UpdateCompanion<Drafts> {
  final Value<int> id;
  final Value<String> objectId;
  final Value<int> book;
  final Value<int> songNo;
  final Value<String> title;
  final Value<String> alias;
  final Value<String> content;
  final Value<String> key;
  final Value<String> author;
  final Value<int> views;
  final Value<String> createdAt;
  final Value<String> updatedAt;
  final Value<bool> liked;
  const DraftsTableCompanion({
    this.id = const Value.absent(),
    this.objectId = const Value.absent(),
    this.book = const Value.absent(),
    this.songNo = const Value.absent(),
    this.title = const Value.absent(),
    this.alias = const Value.absent(),
    this.content = const Value.absent(),
    this.key = const Value.absent(),
    this.author = const Value.absent(),
    this.views = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.liked = const Value.absent(),
  });
  DraftsTableCompanion.insert({
    this.id = const Value.absent(),
    this.objectId = const Value.absent(),
    this.book = const Value.absent(),
    this.songNo = const Value.absent(),
    this.title = const Value.absent(),
    this.alias = const Value.absent(),
    this.content = const Value.absent(),
    this.key = const Value.absent(),
    this.author = const Value.absent(),
    this.views = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.liked = const Value.absent(),
  });
  static Insertable<Drafts> custom({
    Expression<int>? id,
    Expression<String>? objectId,
    Expression<int>? book,
    Expression<int>? songNo,
    Expression<String>? title,
    Expression<String>? alias,
    Expression<String>? content,
    Expression<String>? key,
    Expression<String>? author,
    Expression<int>? views,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
    Expression<bool>? liked,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (objectId != null) 'object_id': objectId,
      if (book != null) 'book': book,
      if (songNo != null) 'song_no': songNo,
      if (title != null) 'title': title,
      if (alias != null) 'alias': alias,
      if (content != null) 'content': content,
      if (key != null) 'key': key,
      if (author != null) 'author': author,
      if (views != null) 'views': views,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (liked != null) 'liked': liked,
    });
  }

  DraftsTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? objectId,
      Value<int>? book,
      Value<int>? songNo,
      Value<String>? title,
      Value<String>? alias,
      Value<String>? content,
      Value<String>? key,
      Value<String>? author,
      Value<int>? views,
      Value<String>? createdAt,
      Value<String>? updatedAt,
      Value<bool>? liked}) {
    return DraftsTableCompanion(
      id: id ?? this.id,
      objectId: objectId ?? this.objectId,
      book: book ?? this.book,
      songNo: songNo ?? this.songNo,
      title: title ?? this.title,
      alias: alias ?? this.alias,
      content: content ?? this.content,
      key: key ?? this.key,
      author: author ?? this.author,
      views: views ?? this.views,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      liked: liked ?? this.liked,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (objectId.present) {
      map['object_id'] = Variable<String>(objectId.value);
    }
    if (book.present) {
      map['book'] = Variable<int>(book.value);
    }
    if (songNo.present) {
      map['song_no'] = Variable<int>(songNo.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (alias.present) {
      map['alias'] = Variable<String>(alias.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (views.present) {
      map['views'] = Variable<int>(views.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    if (liked.present) {
      map['liked'] = Variable<bool>(liked.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DraftsTableCompanion(')
          ..write('id: $id, ')
          ..write('objectId: $objectId, ')
          ..write('book: $book, ')
          ..write('songNo: $songNo, ')
          ..write('title: $title, ')
          ..write('alias: $alias, ')
          ..write('content: $content, ')
          ..write('key: $key, ')
          ..write('author: $author, ')
          ..write('views: $views, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('liked: $liked')
          ..write(')'))
        .toString();
  }
}

class $DraftsTableTable extends DraftsTable
    with TableInfo<$DraftsTableTable, Drafts> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DraftsTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _objectIdMeta = const VerificationMeta('objectId');
  @override
  late final GeneratedColumn<String?> objectId = GeneratedColumn<String?>(
      'object_id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  final VerificationMeta _bookMeta = const VerificationMeta('book');
  @override
  late final GeneratedColumn<int?> book = GeneratedColumn<int?>(
      'book', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  final VerificationMeta _songNoMeta = const VerificationMeta('songNo');
  @override
  late final GeneratedColumn<int?> songNo = GeneratedColumn<int?>(
      'song_no', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  final VerificationMeta _aliasMeta = const VerificationMeta('alias');
  @override
  late final GeneratedColumn<String?> alias = GeneratedColumn<String?>(
      'alias', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  final VerificationMeta _contentMeta = const VerificationMeta('content');
  @override
  late final GeneratedColumn<String?> content = GeneratedColumn<String?>(
      'content', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  final VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String?> key = GeneratedColumn<String?>(
      'key', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  final VerificationMeta _authorMeta = const VerificationMeta('author');
  @override
  late final GeneratedColumn<String?> author = GeneratedColumn<String?>(
      'author', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  final VerificationMeta _viewsMeta = const VerificationMeta('views');
  @override
  late final GeneratedColumn<int?> views = GeneratedColumn<int?>(
      'views', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String?> createdAt = GeneratedColumn<String?>(
      'created_at', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String?> updatedAt = GeneratedColumn<String?>(
      'updated_at', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  final VerificationMeta _likedMeta = const VerificationMeta('liked');
  @override
  late final GeneratedColumn<bool?> liked = GeneratedColumn<bool?>(
      'liked', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (liked IN (0, 1))',
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        objectId,
        book,
        songNo,
        title,
        alias,
        content,
        key,
        author,
        views,
        createdAt,
        updatedAt,
        liked
      ];
  @override
  String get aliasedName => _alias ?? 'db_draft_table';
  @override
  String get actualTableName => 'db_draft_table';
  @override
  VerificationContext validateIntegrity(Insertable<Drafts> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('object_id')) {
      context.handle(_objectIdMeta,
          objectId.isAcceptableOrUnknown(data['object_id']!, _objectIdMeta));
    }
    if (data.containsKey('book')) {
      context.handle(
          _bookMeta, book.isAcceptableOrUnknown(data['book']!, _bookMeta));
    }
    if (data.containsKey('song_no')) {
      context.handle(_songNoMeta,
          songNo.isAcceptableOrUnknown(data['song_no']!, _songNoMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    }
    if (data.containsKey('alias')) {
      context.handle(
          _aliasMeta, alias.isAcceptableOrUnknown(data['alias']!, _aliasMeta));
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    }
    if (data.containsKey('key')) {
      context.handle(
          _keyMeta, key.isAcceptableOrUnknown(data['key']!, _keyMeta));
    }
    if (data.containsKey('author')) {
      context.handle(_authorMeta,
          author.isAcceptableOrUnknown(data['author']!, _authorMeta));
    }
    if (data.containsKey('views')) {
      context.handle(
          _viewsMeta, views.isAcceptableOrUnknown(data['views']!, _viewsMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('liked')) {
      context.handle(
          _likedMeta, liked.isAcceptableOrUnknown(data['liked']!, _likedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Drafts map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Drafts.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DraftsTableTable createAlias(String alias) {
    return $DraftsTableTable(attachedDatabase, alias);
  }
}

class Histories extends DataClass implements Insertable<Histories> {
  final int id;
  final String objectId;
  final int song;
  final String createdAt;
  Histories(
      {required this.id,
      required this.objectId,
      required this.song,
      required this.createdAt});
  factory Histories.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Histories(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      objectId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}object_id'])!,
      song: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}song'])!,
      createdAt: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['object_id'] = Variable<String>(objectId);
    map['song'] = Variable<int>(song);
    map['created_at'] = Variable<String>(createdAt);
    return map;
  }

  HistoriesTableCompanion toCompanion(bool nullToAbsent) {
    return HistoriesTableCompanion(
      id: Value(id),
      objectId: Value(objectId),
      song: Value(song),
      createdAt: Value(createdAt),
    );
  }

  factory Histories.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Histories(
      id: serializer.fromJson<int>(json['id']),
      objectId: serializer.fromJson<String>(json['objectId']),
      song: serializer.fromJson<int>(json['song']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'objectId': serializer.toJson<String>(objectId),
      'song': serializer.toJson<int>(song),
      'createdAt': serializer.toJson<String>(createdAt),
    };
  }

  Histories copyWith(
          {int? id, String? objectId, int? song, String? createdAt}) =>
      Histories(
        id: id ?? this.id,
        objectId: objectId ?? this.objectId,
        song: song ?? this.song,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('Histories(')
          ..write('id: $id, ')
          ..write('objectId: $objectId, ')
          ..write('song: $song, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, objectId, song, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Histories &&
          other.id == this.id &&
          other.objectId == this.objectId &&
          other.song == this.song &&
          other.createdAt == this.createdAt);
}

class HistoriesTableCompanion extends UpdateCompanion<Histories> {
  final Value<int> id;
  final Value<String> objectId;
  final Value<int> song;
  final Value<String> createdAt;
  const HistoriesTableCompanion({
    this.id = const Value.absent(),
    this.objectId = const Value.absent(),
    this.song = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  HistoriesTableCompanion.insert({
    this.id = const Value.absent(),
    this.objectId = const Value.absent(),
    this.song = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  static Insertable<Histories> custom({
    Expression<int>? id,
    Expression<String>? objectId,
    Expression<int>? song,
    Expression<String>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (objectId != null) 'object_id': objectId,
      if (song != null) 'song': song,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  HistoriesTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? objectId,
      Value<int>? song,
      Value<String>? createdAt}) {
    return HistoriesTableCompanion(
      id: id ?? this.id,
      objectId: objectId ?? this.objectId,
      song: song ?? this.song,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (objectId.present) {
      map['object_id'] = Variable<String>(objectId.value);
    }
    if (song.present) {
      map['song'] = Variable<int>(song.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HistoriesTableCompanion(')
          ..write('id: $id, ')
          ..write('objectId: $objectId, ')
          ..write('song: $song, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $HistoriesTableTable extends HistoriesTable
    with TableInfo<$HistoriesTableTable, Histories> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HistoriesTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _objectIdMeta = const VerificationMeta('objectId');
  @override
  late final GeneratedColumn<String?> objectId = GeneratedColumn<String?>(
      'object_id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  final VerificationMeta _songMeta = const VerificationMeta('song');
  @override
  late final GeneratedColumn<int?> song = GeneratedColumn<int?>(
      'song', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String?> createdAt = GeneratedColumn<String?>(
      'created_at', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  @override
  List<GeneratedColumn> get $columns => [id, objectId, song, createdAt];
  @override
  String get aliasedName => _alias ?? 'db_history_table';
  @override
  String get actualTableName => 'db_history_table';
  @override
  VerificationContext validateIntegrity(Insertable<Histories> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('object_id')) {
      context.handle(_objectIdMeta,
          objectId.isAcceptableOrUnknown(data['object_id']!, _objectIdMeta));
    }
    if (data.containsKey('song')) {
      context.handle(
          _songMeta, song.isAcceptableOrUnknown(data['song']!, _songMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Histories map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Histories.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $HistoriesTableTable createAlias(String alias) {
    return $HistoriesTableTable(attachedDatabase, alias);
  }
}

class Listeds extends DataClass implements Insertable<Listeds> {
  final int id;
  final String objectId;
  final int parentid;
  final int song;
  final String title;
  final String description;
  final int position;
  final String createdAt;
  final String updatedAt;
  Listeds(
      {required this.id,
      required this.objectId,
      required this.parentid,
      required this.song,
      required this.title,
      required this.description,
      required this.position,
      required this.createdAt,
      required this.updatedAt});
  factory Listeds.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Listeds(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      objectId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}object_id'])!,
      parentid: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}parentid'])!,
      song: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}song'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      description: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}description'])!,
      position: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}position'])!,
      createdAt: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
      updatedAt: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['object_id'] = Variable<String>(objectId);
    map['parentid'] = Variable<int>(parentid);
    map['song'] = Variable<int>(song);
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['position'] = Variable<int>(position);
    map['created_at'] = Variable<String>(createdAt);
    map['updated_at'] = Variable<String>(updatedAt);
    return map;
  }

  ListedsTableCompanion toCompanion(bool nullToAbsent) {
    return ListedsTableCompanion(
      id: Value(id),
      objectId: Value(objectId),
      parentid: Value(parentid),
      song: Value(song),
      title: Value(title),
      description: Value(description),
      position: Value(position),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory Listeds.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Listeds(
      id: serializer.fromJson<int>(json['id']),
      objectId: serializer.fromJson<String>(json['objectId']),
      parentid: serializer.fromJson<int>(json['parentid']),
      song: serializer.fromJson<int>(json['song']),
      title: serializer.fromJson<String>(json['title']),
      description: serializer.fromJson<String>(json['description']),
      position: serializer.fromJson<int>(json['position']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      updatedAt: serializer.fromJson<String>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'objectId': serializer.toJson<String>(objectId),
      'parentid': serializer.toJson<int>(parentid),
      'song': serializer.toJson<int>(song),
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'position': serializer.toJson<int>(position),
      'createdAt': serializer.toJson<String>(createdAt),
      'updatedAt': serializer.toJson<String>(updatedAt),
    };
  }

  Listeds copyWith(
          {int? id,
          String? objectId,
          int? parentid,
          int? song,
          String? title,
          String? description,
          int? position,
          String? createdAt,
          String? updatedAt}) =>
      Listeds(
        id: id ?? this.id,
        objectId: objectId ?? this.objectId,
        parentid: parentid ?? this.parentid,
        song: song ?? this.song,
        title: title ?? this.title,
        description: description ?? this.description,
        position: position ?? this.position,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('Listeds(')
          ..write('id: $id, ')
          ..write('objectId: $objectId, ')
          ..write('parentid: $parentid, ')
          ..write('song: $song, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('position: $position, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, objectId, parentid, song, title,
      description, position, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Listeds &&
          other.id == this.id &&
          other.objectId == this.objectId &&
          other.parentid == this.parentid &&
          other.song == this.song &&
          other.title == this.title &&
          other.description == this.description &&
          other.position == this.position &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ListedsTableCompanion extends UpdateCompanion<Listeds> {
  final Value<int> id;
  final Value<String> objectId;
  final Value<int> parentid;
  final Value<int> song;
  final Value<String> title;
  final Value<String> description;
  final Value<int> position;
  final Value<String> createdAt;
  final Value<String> updatedAt;
  const ListedsTableCompanion({
    this.id = const Value.absent(),
    this.objectId = const Value.absent(),
    this.parentid = const Value.absent(),
    this.song = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.position = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  ListedsTableCompanion.insert({
    this.id = const Value.absent(),
    this.objectId = const Value.absent(),
    this.parentid = const Value.absent(),
    this.song = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.position = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  static Insertable<Listeds> custom({
    Expression<int>? id,
    Expression<String>? objectId,
    Expression<int>? parentid,
    Expression<int>? song,
    Expression<String>? title,
    Expression<String>? description,
    Expression<int>? position,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (objectId != null) 'object_id': objectId,
      if (parentid != null) 'parentid': parentid,
      if (song != null) 'song': song,
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (position != null) 'position': position,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  ListedsTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? objectId,
      Value<int>? parentid,
      Value<int>? song,
      Value<String>? title,
      Value<String>? description,
      Value<int>? position,
      Value<String>? createdAt,
      Value<String>? updatedAt}) {
    return ListedsTableCompanion(
      id: id ?? this.id,
      objectId: objectId ?? this.objectId,
      parentid: parentid ?? this.parentid,
      song: song ?? this.song,
      title: title ?? this.title,
      description: description ?? this.description,
      position: position ?? this.position,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (objectId.present) {
      map['object_id'] = Variable<String>(objectId.value);
    }
    if (parentid.present) {
      map['parentid'] = Variable<int>(parentid.value);
    }
    if (song.present) {
      map['song'] = Variable<int>(song.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (position.present) {
      map['position'] = Variable<int>(position.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ListedsTableCompanion(')
          ..write('id: $id, ')
          ..write('objectId: $objectId, ')
          ..write('parentid: $parentid, ')
          ..write('song: $song, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('position: $position, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $ListedsTableTable extends ListedsTable
    with TableInfo<$ListedsTableTable, Listeds> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ListedsTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _objectIdMeta = const VerificationMeta('objectId');
  @override
  late final GeneratedColumn<String?> objectId = GeneratedColumn<String?>(
      'object_id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  final VerificationMeta _parentidMeta = const VerificationMeta('parentid');
  @override
  late final GeneratedColumn<int?> parentid = GeneratedColumn<int?>(
      'parentid', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  final VerificationMeta _songMeta = const VerificationMeta('song');
  @override
  late final GeneratedColumn<int?> song = GeneratedColumn<int?>(
      'song', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  final VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String?> description = GeneratedColumn<String?>(
      'description', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  final VerificationMeta _positionMeta = const VerificationMeta('position');
  @override
  late final GeneratedColumn<int?> position = GeneratedColumn<int?>(
      'position', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String?> createdAt = GeneratedColumn<String?>(
      'created_at', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String?> updatedAt = GeneratedColumn<String?>(
      'updated_at', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        objectId,
        parentid,
        song,
        title,
        description,
        position,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? 'db_listed_table';
  @override
  String get actualTableName => 'db_listed_table';
  @override
  VerificationContext validateIntegrity(Insertable<Listeds> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('object_id')) {
      context.handle(_objectIdMeta,
          objectId.isAcceptableOrUnknown(data['object_id']!, _objectIdMeta));
    }
    if (data.containsKey('parentid')) {
      context.handle(_parentidMeta,
          parentid.isAcceptableOrUnknown(data['parentid']!, _parentidMeta));
    }
    if (data.containsKey('song')) {
      context.handle(
          _songMeta, song.isAcceptableOrUnknown(data['song']!, _songMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('position')) {
      context.handle(_positionMeta,
          position.isAcceptableOrUnknown(data['position']!, _positionMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Listeds map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Listeds.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ListedsTableTable createAlias(String alias) {
    return $ListedsTableTable(attachedDatabase, alias);
  }
}

class Searches extends DataClass implements Insertable<Searches> {
  final int id;
  final String objectId;
  final String title;
  final String createdAt;
  Searches(
      {required this.id,
      required this.objectId,
      required this.title,
      required this.createdAt});
  factory Searches.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Searches(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      objectId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}object_id'])!,
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      createdAt: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['object_id'] = Variable<String>(objectId);
    map['title'] = Variable<String>(title);
    map['created_at'] = Variable<String>(createdAt);
    return map;
  }

  SearchesTableCompanion toCompanion(bool nullToAbsent) {
    return SearchesTableCompanion(
      id: Value(id),
      objectId: Value(objectId),
      title: Value(title),
      createdAt: Value(createdAt),
    );
  }

  factory Searches.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Searches(
      id: serializer.fromJson<int>(json['id']),
      objectId: serializer.fromJson<String>(json['objectId']),
      title: serializer.fromJson<String>(json['title']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'objectId': serializer.toJson<String>(objectId),
      'title': serializer.toJson<String>(title),
      'createdAt': serializer.toJson<String>(createdAt),
    };
  }

  Searches copyWith(
          {int? id, String? objectId, String? title, String? createdAt}) =>
      Searches(
        id: id ?? this.id,
        objectId: objectId ?? this.objectId,
        title: title ?? this.title,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('Searches(')
          ..write('id: $id, ')
          ..write('objectId: $objectId, ')
          ..write('title: $title, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, objectId, title, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Searches &&
          other.id == this.id &&
          other.objectId == this.objectId &&
          other.title == this.title &&
          other.createdAt == this.createdAt);
}

class SearchesTableCompanion extends UpdateCompanion<Searches> {
  final Value<int> id;
  final Value<String> objectId;
  final Value<String> title;
  final Value<String> createdAt;
  const SearchesTableCompanion({
    this.id = const Value.absent(),
    this.objectId = const Value.absent(),
    this.title = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  SearchesTableCompanion.insert({
    this.id = const Value.absent(),
    this.objectId = const Value.absent(),
    this.title = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  static Insertable<Searches> custom({
    Expression<int>? id,
    Expression<String>? objectId,
    Expression<String>? title,
    Expression<String>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (objectId != null) 'object_id': objectId,
      if (title != null) 'title': title,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  SearchesTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? objectId,
      Value<String>? title,
      Value<String>? createdAt}) {
    return SearchesTableCompanion(
      id: id ?? this.id,
      objectId: objectId ?? this.objectId,
      title: title ?? this.title,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (objectId.present) {
      map['object_id'] = Variable<String>(objectId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SearchesTableCompanion(')
          ..write('id: $id, ')
          ..write('objectId: $objectId, ')
          ..write('title: $title, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $SearchesTableTable extends SearchesTable
    with TableInfo<$SearchesTableTable, Searches> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SearchesTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _objectIdMeta = const VerificationMeta('objectId');
  @override
  late final GeneratedColumn<String?> objectId = GeneratedColumn<String?>(
      'object_id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String?> createdAt = GeneratedColumn<String?>(
      'created_at', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  @override
  List<GeneratedColumn> get $columns => [id, objectId, title, createdAt];
  @override
  String get aliasedName => _alias ?? 'db_search_table';
  @override
  String get actualTableName => 'db_search_table';
  @override
  VerificationContext validateIntegrity(Insertable<Searches> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('object_id')) {
      context.handle(_objectIdMeta,
          objectId.isAcceptableOrUnknown(data['object_id']!, _objectIdMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Searches map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Searches.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $SearchesTableTable createAlias(String alias) {
    return $SearchesTableTable(attachedDatabase, alias);
  }
}

class Songs extends DataClass implements Insertable<Songs> {
  final int id;
  final String objectId;
  final int book;
  final int songNo;
  final String title;
  final String alias;
  final String content;
  final String key;
  final String author;
  final int views;
  final int likes;
  final String createdAt;
  final String updatedAt;
  final bool liked;
  Songs(
      {required this.id,
      required this.objectId,
      required this.book,
      required this.songNo,
      required this.title,
      required this.alias,
      required this.content,
      required this.key,
      required this.author,
      required this.views,
      required this.likes,
      required this.createdAt,
      required this.updatedAt,
      required this.liked});
  factory Songs.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Songs(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      objectId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}object_id'])!,
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
      createdAt: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created_at'])!,
      updatedAt: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}updated_at'])!,
      liked: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}liked'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['object_id'] = Variable<String>(objectId);
    map['book'] = Variable<int>(book);
    map['song_no'] = Variable<int>(songNo);
    map['title'] = Variable<String>(title);
    map['alias'] = Variable<String>(alias);
    map['content'] = Variable<String>(content);
    map['key'] = Variable<String>(key);
    map['author'] = Variable<String>(author);
    map['views'] = Variable<int>(views);
    map['likes'] = Variable<int>(likes);
    map['created_at'] = Variable<String>(createdAt);
    map['updated_at'] = Variable<String>(updatedAt);
    map['liked'] = Variable<bool>(liked);
    return map;
  }

  SongsTableCompanion toCompanion(bool nullToAbsent) {
    return SongsTableCompanion(
      id: Value(id),
      objectId: Value(objectId),
      book: Value(book),
      songNo: Value(songNo),
      title: Value(title),
      alias: Value(alias),
      content: Value(content),
      key: Value(key),
      author: Value(author),
      views: Value(views),
      likes: Value(likes),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      liked: Value(liked),
    );
  }

  factory Songs.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Songs(
      id: serializer.fromJson<int>(json['id']),
      objectId: serializer.fromJson<String>(json['objectId']),
      book: serializer.fromJson<int>(json['book']),
      songNo: serializer.fromJson<int>(json['songNo']),
      title: serializer.fromJson<String>(json['title']),
      alias: serializer.fromJson<String>(json['alias']),
      content: serializer.fromJson<String>(json['content']),
      key: serializer.fromJson<String>(json['key']),
      author: serializer.fromJson<String>(json['author']),
      views: serializer.fromJson<int>(json['views']),
      likes: serializer.fromJson<int>(json['likes']),
      createdAt: serializer.fromJson<String>(json['createdAt']),
      updatedAt: serializer.fromJson<String>(json['updatedAt']),
      liked: serializer.fromJson<bool>(json['liked']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'objectId': serializer.toJson<String>(objectId),
      'book': serializer.toJson<int>(book),
      'songNo': serializer.toJson<int>(songNo),
      'title': serializer.toJson<String>(title),
      'alias': serializer.toJson<String>(alias),
      'content': serializer.toJson<String>(content),
      'key': serializer.toJson<String>(key),
      'author': serializer.toJson<String>(author),
      'views': serializer.toJson<int>(views),
      'likes': serializer.toJson<int>(likes),
      'createdAt': serializer.toJson<String>(createdAt),
      'updatedAt': serializer.toJson<String>(updatedAt),
      'liked': serializer.toJson<bool>(liked),
    };
  }

  Songs copyWith(
          {int? id,
          String? objectId,
          int? book,
          int? songNo,
          String? title,
          String? alias,
          String? content,
          String? key,
          String? author,
          int? views,
          int? likes,
          String? createdAt,
          String? updatedAt,
          bool? liked}) =>
      Songs(
        id: id ?? this.id,
        objectId: objectId ?? this.objectId,
        book: book ?? this.book,
        songNo: songNo ?? this.songNo,
        title: title ?? this.title,
        alias: alias ?? this.alias,
        content: content ?? this.content,
        key: key ?? this.key,
        author: author ?? this.author,
        views: views ?? this.views,
        likes: likes ?? this.likes,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        liked: liked ?? this.liked,
      );
  @override
  String toString() {
    return (StringBuffer('Songs(')
          ..write('id: $id, ')
          ..write('objectId: $objectId, ')
          ..write('book: $book, ')
          ..write('songNo: $songNo, ')
          ..write('title: $title, ')
          ..write('alias: $alias, ')
          ..write('content: $content, ')
          ..write('key: $key, ')
          ..write('author: $author, ')
          ..write('views: $views, ')
          ..write('likes: $likes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('liked: $liked')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, objectId, book, songNo, title, alias,
      content, key, author, views, likes, createdAt, updatedAt, liked);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Songs &&
          other.id == this.id &&
          other.objectId == this.objectId &&
          other.book == this.book &&
          other.songNo == this.songNo &&
          other.title == this.title &&
          other.alias == this.alias &&
          other.content == this.content &&
          other.key == this.key &&
          other.author == this.author &&
          other.views == this.views &&
          other.likes == this.likes &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.liked == this.liked);
}

class SongsTableCompanion extends UpdateCompanion<Songs> {
  final Value<int> id;
  final Value<String> objectId;
  final Value<int> book;
  final Value<int> songNo;
  final Value<String> title;
  final Value<String> alias;
  final Value<String> content;
  final Value<String> key;
  final Value<String> author;
  final Value<int> views;
  final Value<int> likes;
  final Value<String> createdAt;
  final Value<String> updatedAt;
  final Value<bool> liked;
  const SongsTableCompanion({
    this.id = const Value.absent(),
    this.objectId = const Value.absent(),
    this.book = const Value.absent(),
    this.songNo = const Value.absent(),
    this.title = const Value.absent(),
    this.alias = const Value.absent(),
    this.content = const Value.absent(),
    this.key = const Value.absent(),
    this.author = const Value.absent(),
    this.views = const Value.absent(),
    this.likes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.liked = const Value.absent(),
  });
  SongsTableCompanion.insert({
    this.id = const Value.absent(),
    required String objectId,
    this.book = const Value.absent(),
    this.songNo = const Value.absent(),
    this.title = const Value.absent(),
    this.alias = const Value.absent(),
    this.content = const Value.absent(),
    this.key = const Value.absent(),
    this.author = const Value.absent(),
    this.views = const Value.absent(),
    this.likes = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.liked = const Value.absent(),
  }) : objectId = Value(objectId);
  static Insertable<Songs> custom({
    Expression<int>? id,
    Expression<String>? objectId,
    Expression<int>? book,
    Expression<int>? songNo,
    Expression<String>? title,
    Expression<String>? alias,
    Expression<String>? content,
    Expression<String>? key,
    Expression<String>? author,
    Expression<int>? views,
    Expression<int>? likes,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
    Expression<bool>? liked,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (objectId != null) 'object_id': objectId,
      if (book != null) 'book': book,
      if (songNo != null) 'song_no': songNo,
      if (title != null) 'title': title,
      if (alias != null) 'alias': alias,
      if (content != null) 'content': content,
      if (key != null) 'key': key,
      if (author != null) 'author': author,
      if (views != null) 'views': views,
      if (likes != null) 'likes': likes,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (liked != null) 'liked': liked,
    });
  }

  SongsTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? objectId,
      Value<int>? book,
      Value<int>? songNo,
      Value<String>? title,
      Value<String>? alias,
      Value<String>? content,
      Value<String>? key,
      Value<String>? author,
      Value<int>? views,
      Value<int>? likes,
      Value<String>? createdAt,
      Value<String>? updatedAt,
      Value<bool>? liked}) {
    return SongsTableCompanion(
      id: id ?? this.id,
      objectId: objectId ?? this.objectId,
      book: book ?? this.book,
      songNo: songNo ?? this.songNo,
      title: title ?? this.title,
      alias: alias ?? this.alias,
      content: content ?? this.content,
      key: key ?? this.key,
      author: author ?? this.author,
      views: views ?? this.views,
      likes: likes ?? this.likes,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      liked: liked ?? this.liked,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (objectId.present) {
      map['object_id'] = Variable<String>(objectId.value);
    }
    if (book.present) {
      map['book'] = Variable<int>(book.value);
    }
    if (songNo.present) {
      map['song_no'] = Variable<int>(songNo.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (alias.present) {
      map['alias'] = Variable<String>(alias.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (views.present) {
      map['views'] = Variable<int>(views.value);
    }
    if (likes.present) {
      map['likes'] = Variable<int>(likes.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<String>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<String>(updatedAt.value);
    }
    if (liked.present) {
      map['liked'] = Variable<bool>(liked.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SongsTableCompanion(')
          ..write('id: $id, ')
          ..write('objectId: $objectId, ')
          ..write('book: $book, ')
          ..write('songNo: $songNo, ')
          ..write('title: $title, ')
          ..write('alias: $alias, ')
          ..write('content: $content, ')
          ..write('key: $key, ')
          ..write('author: $author, ')
          ..write('views: $views, ')
          ..write('likes: $likes, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('liked: $liked')
          ..write(')'))
        .toString();
  }
}

class $SongsTableTable extends SongsTable
    with TableInfo<$SongsTableTable, Songs> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SongsTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _objectIdMeta = const VerificationMeta('objectId');
  @override
  late final GeneratedColumn<String?> objectId = GeneratedColumn<String?>(
      'object_id', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: true,
      defaultConstraints: 'UNIQUE');
  final VerificationMeta _bookMeta = const VerificationMeta('book');
  @override
  late final GeneratedColumn<int?> book = GeneratedColumn<int?>(
      'book', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  final VerificationMeta _songNoMeta = const VerificationMeta('songNo');
  @override
  late final GeneratedColumn<int?> songNo = GeneratedColumn<int?>(
      'song_no', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  final VerificationMeta _aliasMeta = const VerificationMeta('alias');
  @override
  late final GeneratedColumn<String?> alias = GeneratedColumn<String?>(
      'alias', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  final VerificationMeta _contentMeta = const VerificationMeta('content');
  @override
  late final GeneratedColumn<String?> content = GeneratedColumn<String?>(
      'content', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  final VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String?> key = GeneratedColumn<String?>(
      'key', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  final VerificationMeta _authorMeta = const VerificationMeta('author');
  @override
  late final GeneratedColumn<String?> author = GeneratedColumn<String?>(
      'author', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  final VerificationMeta _viewsMeta = const VerificationMeta('views');
  @override
  late final GeneratedColumn<int?> views = GeneratedColumn<int?>(
      'views', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  final VerificationMeta _likesMeta = const VerificationMeta('likes');
  @override
  late final GeneratedColumn<int?> likes = GeneratedColumn<int?>(
      'likes', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String?> createdAt = GeneratedColumn<String?>(
      'created_at', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String?> updatedAt = GeneratedColumn<String?>(
      'updated_at', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  final VerificationMeta _likedMeta = const VerificationMeta('liked');
  @override
  late final GeneratedColumn<bool?> liked = GeneratedColumn<bool?>(
      'liked', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (liked IN (0, 1))',
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        objectId,
        book,
        songNo,
        title,
        alias,
        content,
        key,
        author,
        views,
        likes,
        createdAt,
        updatedAt,
        liked
      ];
  @override
  String get aliasedName => _alias ?? 'db_song_table';
  @override
  String get actualTableName => 'db_song_table';
  @override
  VerificationContext validateIntegrity(Insertable<Songs> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('object_id')) {
      context.handle(_objectIdMeta,
          objectId.isAcceptableOrUnknown(data['object_id']!, _objectIdMeta));
    } else if (isInserting) {
      context.missing(_objectIdMeta);
    }
    if (data.containsKey('book')) {
      context.handle(
          _bookMeta, book.isAcceptableOrUnknown(data['book']!, _bookMeta));
    }
    if (data.containsKey('song_no')) {
      context.handle(_songNoMeta,
          songNo.isAcceptableOrUnknown(data['song_no']!, _songNoMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    }
    if (data.containsKey('alias')) {
      context.handle(
          _aliasMeta, alias.isAcceptableOrUnknown(data['alias']!, _aliasMeta));
    }
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
    }
    if (data.containsKey('key')) {
      context.handle(
          _keyMeta, key.isAcceptableOrUnknown(data['key']!, _keyMeta));
    }
    if (data.containsKey('author')) {
      context.handle(_authorMeta,
          author.isAcceptableOrUnknown(data['author']!, _authorMeta));
    }
    if (data.containsKey('views')) {
      context.handle(
          _viewsMeta, views.isAcceptableOrUnknown(data['views']!, _viewsMeta));
    }
    if (data.containsKey('likes')) {
      context.handle(
          _likesMeta, likes.isAcceptableOrUnknown(data['likes']!, _likesMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('liked')) {
      context.handle(
          _likedMeta, liked.isAcceptableOrUnknown(data['liked']!, _likedMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Songs map(Map<String, dynamic> data, {String? tablePrefix}) {
    return Songs.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $SongsTableTable createAlias(String alias) {
    return $SongsTableTable(attachedDatabase, alias);
  }
}

abstract class _$SongLibDb extends GeneratedDatabase {
  _$SongLibDb(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  _$SongLibDb.connect(DatabaseConnection c) : super.connect(c);
  late final $BooksTableTable booksTable = $BooksTableTable(this);
  late final $DraftsTableTable draftsTable = $DraftsTableTable(this);
  late final $HistoriesTableTable historiesTable = $HistoriesTableTable(this);
  late final $ListedsTableTable listedsTable = $ListedsTableTable(this);
  late final $SearchesTableTable searchesTable = $SearchesTableTable(this);
  late final $SongsTableTable songsTable = $SongsTableTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        booksTable,
        draftsTable,
        historiesTable,
        listedsTable,
        searchesTable,
        songsTable
      ];
}
