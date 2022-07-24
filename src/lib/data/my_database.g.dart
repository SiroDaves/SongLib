// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class DbBook extends DataClass implements Insertable<DbBook> {
  final int id;
  final String objectId;
  final int? bookid;
  final int? enabled;
  final String title;
  final String subtitle;
  final int? songs;
  final int? position;
  final String createdAt;
  final String updatedAt;
  DbBook(
      {required this.id,
      required this.objectId,
      this.bookid,
      this.enabled,
      required this.title,
      required this.subtitle,
      this.songs,
      this.position,
      required this.createdAt,
      required this.updatedAt});
  factory DbBook.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DbBook(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      objectId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}object_id'])!,
      bookid: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}bookid']),
      enabled: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}enabled']),
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      subtitle: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}subtitle'])!,
      songs: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}songs']),
      position: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}position']),
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
    if (!nullToAbsent || bookid != null) {
      map['bookid'] = Variable<int?>(bookid);
    }
    if (!nullToAbsent || enabled != null) {
      map['enabled'] = Variable<int?>(enabled);
    }
    map['title'] = Variable<String>(title);
    map['subtitle'] = Variable<String>(subtitle);
    if (!nullToAbsent || songs != null) {
      map['songs'] = Variable<int?>(songs);
    }
    if (!nullToAbsent || position != null) {
      map['position'] = Variable<int?>(position);
    }
    map['created_at'] = Variable<String>(createdAt);
    map['updated_at'] = Variable<String>(updatedAt);
    return map;
  }

  DbBookTableCompanion toCompanion(bool nullToAbsent) {
    return DbBookTableCompanion(
      id: Value(id),
      objectId: Value(objectId),
      bookid:
          bookid == null && nullToAbsent ? const Value.absent() : Value(bookid),
      enabled: enabled == null && nullToAbsent
          ? const Value.absent()
          : Value(enabled),
      title: Value(title),
      subtitle: Value(subtitle),
      songs:
          songs == null && nullToAbsent ? const Value.absent() : Value(songs),
      position: position == null && nullToAbsent
          ? const Value.absent()
          : Value(position),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory DbBook.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbBook(
      id: serializer.fromJson<int>(json['id']),
      objectId: serializer.fromJson<String>(json['objectId']),
      bookid: serializer.fromJson<int?>(json['bookid']),
      enabled: serializer.fromJson<int?>(json['enabled']),
      title: serializer.fromJson<String>(json['title']),
      subtitle: serializer.fromJson<String>(json['subtitle']),
      songs: serializer.fromJson<int?>(json['songs']),
      position: serializer.fromJson<int?>(json['position']),
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
      'bookid': serializer.toJson<int?>(bookid),
      'enabled': serializer.toJson<int?>(enabled),
      'title': serializer.toJson<String>(title),
      'subtitle': serializer.toJson<String>(subtitle),
      'songs': serializer.toJson<int?>(songs),
      'position': serializer.toJson<int?>(position),
      'createdAt': serializer.toJson<String>(createdAt),
      'updatedAt': serializer.toJson<String>(updatedAt),
    };
  }

  DbBook copyWith(
          {int? id,
          String? objectId,
          int? bookid,
          int? enabled,
          String? title,
          String? subtitle,
          int? songs,
          int? position,
          String? createdAt,
          String? updatedAt}) =>
      DbBook(
        id: id ?? this.id,
        objectId: objectId ?? this.objectId,
        bookid: bookid ?? this.bookid,
        enabled: enabled ?? this.enabled,
        title: title ?? this.title,
        subtitle: subtitle ?? this.subtitle,
        songs: songs ?? this.songs,
        position: position ?? this.position,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('DbBook(')
          ..write('id: $id, ')
          ..write('objectId: $objectId, ')
          ..write('bookid: $bookid, ')
          ..write('enabled: $enabled, ')
          ..write('title: $title, ')
          ..write('subtitle: $subtitle, ')
          ..write('songs: $songs, ')
          ..write('position: $position, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, objectId, bookid, enabled, title,
      subtitle, songs, position, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbBook &&
          other.id == this.id &&
          other.objectId == this.objectId &&
          other.bookid == this.bookid &&
          other.enabled == this.enabled &&
          other.title == this.title &&
          other.subtitle == this.subtitle &&
          other.songs == this.songs &&
          other.position == this.position &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class DbBookTableCompanion extends UpdateCompanion<DbBook> {
  final Value<int> id;
  final Value<String> objectId;
  final Value<int?> bookid;
  final Value<int?> enabled;
  final Value<String> title;
  final Value<String> subtitle;
  final Value<int?> songs;
  final Value<int?> position;
  final Value<String> createdAt;
  final Value<String> updatedAt;
  const DbBookTableCompanion({
    this.id = const Value.absent(),
    this.objectId = const Value.absent(),
    this.bookid = const Value.absent(),
    this.enabled = const Value.absent(),
    this.title = const Value.absent(),
    this.subtitle = const Value.absent(),
    this.songs = const Value.absent(),
    this.position = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  DbBookTableCompanion.insert({
    this.id = const Value.absent(),
    required String objectId,
    this.bookid = const Value.absent(),
    this.enabled = const Value.absent(),
    required String title,
    required String subtitle,
    this.songs = const Value.absent(),
    this.position = const Value.absent(),
    required String createdAt,
    required String updatedAt,
  })  : objectId = Value(objectId),
        title = Value(title),
        subtitle = Value(subtitle),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<DbBook> custom({
    Expression<int>? id,
    Expression<String>? objectId,
    Expression<int?>? bookid,
    Expression<int?>? enabled,
    Expression<String>? title,
    Expression<String>? subtitle,
    Expression<int?>? songs,
    Expression<int?>? position,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (objectId != null) 'object_id': objectId,
      if (bookid != null) 'bookid': bookid,
      if (enabled != null) 'enabled': enabled,
      if (title != null) 'title': title,
      if (subtitle != null) 'subtitle': subtitle,
      if (songs != null) 'songs': songs,
      if (position != null) 'position': position,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  DbBookTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? objectId,
      Value<int?>? bookid,
      Value<int?>? enabled,
      Value<String>? title,
      Value<String>? subtitle,
      Value<int?>? songs,
      Value<int?>? position,
      Value<String>? createdAt,
      Value<String>? updatedAt}) {
    return DbBookTableCompanion(
      id: id ?? this.id,
      objectId: objectId ?? this.objectId,
      bookid: bookid ?? this.bookid,
      enabled: enabled ?? this.enabled,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
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
    if (bookid.present) {
      map['bookid'] = Variable<int?>(bookid.value);
    }
    if (enabled.present) {
      map['enabled'] = Variable<int?>(enabled.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (subtitle.present) {
      map['subtitle'] = Variable<String>(subtitle.value);
    }
    if (songs.present) {
      map['songs'] = Variable<int?>(songs.value);
    }
    if (position.present) {
      map['position'] = Variable<int?>(position.value);
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
    return (StringBuffer('DbBookTableCompanion(')
          ..write('id: $id, ')
          ..write('objectId: $objectId, ')
          ..write('bookid: $bookid, ')
          ..write('enabled: $enabled, ')
          ..write('title: $title, ')
          ..write('subtitle: $subtitle, ')
          ..write('songs: $songs, ')
          ..write('position: $position, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $DbBookTableTable extends DbBookTable
    with TableInfo<$DbBookTableTable, DbBook> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbBookTableTable(this.attachedDatabase, [this._alias]);
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
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 3, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _bookidMeta = const VerificationMeta('bookid');
  @override
  late final GeneratedColumn<int?> bookid = GeneratedColumn<int?>(
      'bookid', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _enabledMeta = const VerificationMeta('enabled');
  @override
  late final GeneratedColumn<int?> enabled = GeneratedColumn<int?>(
      'enabled', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 3, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _subtitleMeta = const VerificationMeta('subtitle');
  @override
  late final GeneratedColumn<String?> subtitle = GeneratedColumn<String?>(
      'subtitle', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 3, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _songsMeta = const VerificationMeta('songs');
  @override
  late final GeneratedColumn<int?> songs = GeneratedColumn<int?>(
      'songs', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _positionMeta = const VerificationMeta('position');
  @override
  late final GeneratedColumn<int?> position = GeneratedColumn<int?>(
      'position', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String?> createdAt = GeneratedColumn<String?>(
      'created_at', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 3, maxTextLength: 30),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String?> updatedAt = GeneratedColumn<String?>(
      'updated_at', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 3, maxTextLength: 30),
      type: const StringType(),
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        objectId,
        bookid,
        enabled,
        title,
        subtitle,
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
  VerificationContext validateIntegrity(Insertable<DbBook> instance,
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
    if (data.containsKey('bookid')) {
      context.handle(_bookidMeta,
          bookid.isAcceptableOrUnknown(data['bookid']!, _bookidMeta));
    }
    if (data.containsKey('enabled')) {
      context.handle(_enabledMeta,
          enabled.isAcceptableOrUnknown(data['enabled']!, _enabledMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('subtitle')) {
      context.handle(_subtitleMeta,
          subtitle.isAcceptableOrUnknown(data['subtitle']!, _subtitleMeta));
    } else if (isInserting) {
      context.missing(_subtitleMeta);
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
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbBook map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DbBook.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DbBookTableTable createAlias(String alias) {
    return $DbBookTableTable(attachedDatabase, alias);
  }
}

class DbSong extends DataClass implements Insertable<DbSong> {
  final int id;
  final String objectId;
  final int? book;
  final int? songno;
  final String title;
  final String alias;
  final String content;
  final String key;
  final String author;
  final int? views;
  final String createdAt;
  final String updatedAt;
  DbSong(
      {required this.id,
      required this.objectId,
      this.book,
      this.songno,
      required this.title,
      required this.alias,
      required this.content,
      required this.key,
      required this.author,
      this.views,
      required this.createdAt,
      required this.updatedAt});
  factory DbSong.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DbSong(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      objectId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}object_id'])!,
      book: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}book']),
      songno: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}songno']),
      title: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}title'])!,
      alias: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}alias'])!,
      content: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}body'])!,
      key: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}key'])!,
      author: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}author'])!,
      views: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}views']),
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
    if (!nullToAbsent || book != null) {
      map['book'] = Variable<int?>(book);
    }
    if (!nullToAbsent || songno != null) {
      map['songno'] = Variable<int?>(songno);
    }
    map['title'] = Variable<String>(title);
    map['alias'] = Variable<String>(alias);
    map['body'] = Variable<String>(content);
    map['key'] = Variable<String>(key);
    map['author'] = Variable<String>(author);
    if (!nullToAbsent || views != null) {
      map['views'] = Variable<int?>(views);
    }
    map['created_at'] = Variable<String>(createdAt);
    map['updated_at'] = Variable<String>(updatedAt);
    return map;
  }

  DbSongTableCompanion toCompanion(bool nullToAbsent) {
    return DbSongTableCompanion(
      id: Value(id),
      objectId: Value(objectId),
      book: book == null && nullToAbsent ? const Value.absent() : Value(book),
      songno:
          songno == null && nullToAbsent ? const Value.absent() : Value(songno),
      title: Value(title),
      alias: Value(alias),
      content: Value(content),
      key: Value(key),
      author: Value(author),
      views:
          views == null && nullToAbsent ? const Value.absent() : Value(views),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory DbSong.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbSong(
      id: serializer.fromJson<int>(json['id']),
      objectId: serializer.fromJson<String>(json['objectId']),
      book: serializer.fromJson<int?>(json['book']),
      songno: serializer.fromJson<int?>(json['songno']),
      title: serializer.fromJson<String>(json['title']),
      alias: serializer.fromJson<String>(json['alias']),
      content: serializer.fromJson<String>(json['content']),
      key: serializer.fromJson<String>(json['key']),
      author: serializer.fromJson<String>(json['author']),
      views: serializer.fromJson<int?>(json['views']),
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
      'book': serializer.toJson<int?>(book),
      'songno': serializer.toJson<int?>(songno),
      'title': serializer.toJson<String>(title),
      'alias': serializer.toJson<String>(alias),
      'content': serializer.toJson<String>(content),
      'key': serializer.toJson<String>(key),
      'author': serializer.toJson<String>(author),
      'views': serializer.toJson<int?>(views),
      'createdAt': serializer.toJson<String>(createdAt),
      'updatedAt': serializer.toJson<String>(updatedAt),
    };
  }

  DbSong copyWith(
          {int? id,
          String? objectId,
          int? book,
          int? songno,
          String? title,
          String? alias,
          String? content,
          String? key,
          String? author,
          int? views,
          String? createdAt,
          String? updatedAt}) =>
      DbSong(
        id: id ?? this.id,
        objectId: objectId ?? this.objectId,
        book: book ?? this.book,
        songno: songno ?? this.songno,
        title: title ?? this.title,
        alias: alias ?? this.alias,
        content: content ?? this.content,
        key: key ?? this.key,
        author: author ?? this.author,
        views: views ?? this.views,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('DbSong(')
          ..write('id: $id, ')
          ..write('objectId: $objectId, ')
          ..write('book: $book, ')
          ..write('songno: $songno, ')
          ..write('title: $title, ')
          ..write('alias: $alias, ')
          ..write('content: $content, ')
          ..write('key: $key, ')
          ..write('author: $author, ')
          ..write('views: $views, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, objectId, book, songno, title, alias,
      content, key, author, views, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbSong &&
          other.id == this.id &&
          other.objectId == this.objectId &&
          other.book == this.book &&
          other.songno == this.songno &&
          other.title == this.title &&
          other.alias == this.alias &&
          other.content == this.content &&
          other.key == this.key &&
          other.author == this.author &&
          other.views == this.views &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class DbSongTableCompanion extends UpdateCompanion<DbSong> {
  final Value<int> id;
  final Value<String> objectId;
  final Value<int?> book;
  final Value<int?> songno;
  final Value<String> title;
  final Value<String> alias;
  final Value<String> content;
  final Value<String> key;
  final Value<String> author;
  final Value<int?> views;
  final Value<String> createdAt;
  final Value<String> updatedAt;
  const DbSongTableCompanion({
    this.id = const Value.absent(),
    this.objectId = const Value.absent(),
    this.book = const Value.absent(),
    this.songno = const Value.absent(),
    this.title = const Value.absent(),
    this.alias = const Value.absent(),
    this.content = const Value.absent(),
    this.key = const Value.absent(),
    this.author = const Value.absent(),
    this.views = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  DbSongTableCompanion.insert({
    this.id = const Value.absent(),
    required String objectId,
    this.book = const Value.absent(),
    this.songno = const Value.absent(),
    required String title,
    required String alias,
    required String content,
    required String key,
    required String author,
    this.views = const Value.absent(),
    required String createdAt,
    required String updatedAt,
  })  : objectId = Value(objectId),
        title = Value(title),
        alias = Value(alias),
        content = Value(content),
        key = Value(key),
        author = Value(author),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<DbSong> custom({
    Expression<int>? id,
    Expression<String>? objectId,
    Expression<int?>? book,
    Expression<int?>? songno,
    Expression<String>? title,
    Expression<String>? alias,
    Expression<String>? content,
    Expression<String>? key,
    Expression<String>? author,
    Expression<int?>? views,
    Expression<String>? createdAt,
    Expression<String>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (objectId != null) 'object_id': objectId,
      if (book != null) 'book': book,
      if (songno != null) 'songno': songno,
      if (title != null) 'title': title,
      if (alias != null) 'alias': alias,
      if (content != null) 'body': content,
      if (key != null) 'key': key,
      if (author != null) 'author': author,
      if (views != null) 'views': views,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  DbSongTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? objectId,
      Value<int?>? book,
      Value<int?>? songno,
      Value<String>? title,
      Value<String>? alias,
      Value<String>? content,
      Value<String>? key,
      Value<String>? author,
      Value<int?>? views,
      Value<String>? createdAt,
      Value<String>? updatedAt}) {
    return DbSongTableCompanion(
      id: id ?? this.id,
      objectId: objectId ?? this.objectId,
      book: book ?? this.book,
      songno: songno ?? this.songno,
      title: title ?? this.title,
      alias: alias ?? this.alias,
      content: content ?? this.content,
      key: key ?? this.key,
      author: author ?? this.author,
      views: views ?? this.views,
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
    if (book.present) {
      map['book'] = Variable<int?>(book.value);
    }
    if (songno.present) {
      map['songno'] = Variable<int?>(songno.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (alias.present) {
      map['alias'] = Variable<String>(alias.value);
    }
    if (content.present) {
      map['body'] = Variable<String>(content.value);
    }
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (author.present) {
      map['author'] = Variable<String>(author.value);
    }
    if (views.present) {
      map['views'] = Variable<int?>(views.value);
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
    return (StringBuffer('DbSongTableCompanion(')
          ..write('id: $id, ')
          ..write('objectId: $objectId, ')
          ..write('book: $book, ')
          ..write('songno: $songno, ')
          ..write('title: $title, ')
          ..write('alias: $alias, ')
          ..write('content: $content, ')
          ..write('key: $key, ')
          ..write('author: $author, ')
          ..write('views: $views, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $DbSongTableTable extends DbSongTable
    with TableInfo<$DbSongTableTable, DbSong> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DbSongTableTable(this.attachedDatabase, [this._alias]);
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
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 3, maxTextLength: 20),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _bookMeta = const VerificationMeta('book');
  @override
  late final GeneratedColumn<int?> book = GeneratedColumn<int?>(
      'book', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _songnoMeta = const VerificationMeta('songno');
  @override
  late final GeneratedColumn<int?> songno = GeneratedColumn<int?>(
      'songno', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String?> title = GeneratedColumn<String?>(
      'title', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 3, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _aliasMeta = const VerificationMeta('alias');
  @override
  late final GeneratedColumn<String?> alias = GeneratedColumn<String?>(
      'alias', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _contentMeta = const VerificationMeta('content');
  @override
  late final GeneratedColumn<String?> content = GeneratedColumn<String?>(
      'body', aliasedName, false,
      type: const StringType(), requiredDuringInsert: true);
  final VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String?> key = GeneratedColumn<String?>(
      'key', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 20),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _authorMeta = const VerificationMeta('author');
  @override
  late final GeneratedColumn<String?> author = GeneratedColumn<String?>(
      'author', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 0, maxTextLength: 100),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _viewsMeta = const VerificationMeta('views');
  @override
  late final GeneratedColumn<int?> views = GeneratedColumn<int?>(
      'views', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _createdAtMeta = const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<String?> createdAt = GeneratedColumn<String?>(
      'created_at', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 3, maxTextLength: 30),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String?> updatedAt = GeneratedColumn<String?>(
      'updated_at', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 3, maxTextLength: 30),
      type: const StringType(),
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        objectId,
        book,
        songno,
        title,
        alias,
        content,
        key,
        author,
        views,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? 'db_song_table';
  @override
  String get actualTableName => 'db_song_table';
  @override
  VerificationContext validateIntegrity(Insertable<DbSong> instance,
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
    if (data.containsKey('songno')) {
      context.handle(_songnoMeta,
          songno.isAcceptableOrUnknown(data['songno']!, _songnoMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('alias')) {
      context.handle(
          _aliasMeta, alias.isAcceptableOrUnknown(data['alias']!, _aliasMeta));
    } else if (isInserting) {
      context.missing(_aliasMeta);
    }
    if (data.containsKey('body')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['body']!, _contentMeta));
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('key')) {
      context.handle(
          _keyMeta, key.isAcceptableOrUnknown(data['key']!, _keyMeta));
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('author')) {
      context.handle(_authorMeta,
          author.isAcceptableOrUnknown(data['author']!, _authorMeta));
    } else if (isInserting) {
      context.missing(_authorMeta);
    }
    if (data.containsKey('views')) {
      context.handle(
          _viewsMeta, views.isAcceptableOrUnknown(data['views']!, _viewsMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DbSong map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DbSong.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DbSongTableTable createAlias(String alias) {
    return $DbSongTableTable(attachedDatabase, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  _$MyDatabase.connect(DatabaseConnection c) : super.connect(c);
  late final $DbBookTableTable dbBookTable = $DbBookTableTable(this);
  late final $DbSongTableTable dbSongTable = $DbSongTableTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [dbBookTable, dbSongTable];
}
