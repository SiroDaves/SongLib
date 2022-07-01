// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class Books extends DataClass implements Insertable<Books> {
  final int id;
  final int? bookid;
  final int? enabled;
  final String title;
  final String subtitle;
  final int? songs;
  final int? position;
  final String created;
  final String updated;
  Books(
      {required this.id,
      this.bookid,
      this.enabled,
      required this.title,
      required this.subtitle,
      this.songs,
      this.position,
      required this.created,
      required this.updated});
  factory Books.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Books(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
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
      created: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created'])!,
      updated: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}updated'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
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
    map['created'] = Variable<String>(created);
    map['updated'] = Variable<String>(updated);
    return map;
  }

  TableBookCompanion toCompanion(bool nullToAbsent) {
    return TableBookCompanion(
      id: Value(id),
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
      created: Value(created),
      updated: Value(updated),
    );
  }

  factory Books.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Books(
      id: serializer.fromJson<int>(json['id']),
      bookid: serializer.fromJson<int?>(json['bookid']),
      enabled: serializer.fromJson<int?>(json['enabled']),
      title: serializer.fromJson<String>(json['title']),
      subtitle: serializer.fromJson<String>(json['subtitle']),
      songs: serializer.fromJson<int?>(json['songs']),
      position: serializer.fromJson<int?>(json['position']),
      created: serializer.fromJson<String>(json['created']),
      updated: serializer.fromJson<String>(json['updated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'bookid': serializer.toJson<int?>(bookid),
      'enabled': serializer.toJson<int?>(enabled),
      'title': serializer.toJson<String>(title),
      'subtitle': serializer.toJson<String>(subtitle),
      'songs': serializer.toJson<int?>(songs),
      'position': serializer.toJson<int?>(position),
      'created': serializer.toJson<String>(created),
      'updated': serializer.toJson<String>(updated),
    };
  }

  Books copyWith(
          {int? id,
          int? bookid,
          int? enabled,
          String? title,
          String? subtitle,
          int? songs,
          int? position,
          String? created,
          String? updated}) =>
      Books(
        id: id ?? this.id,
        bookid: bookid ?? this.bookid,
        enabled: enabled ?? this.enabled,
        title: title ?? this.title,
        subtitle: subtitle ?? this.subtitle,
        songs: songs ?? this.songs,
        position: position ?? this.position,
        created: created ?? this.created,
        updated: updated ?? this.updated,
      );
  @override
  String toString() {
    return (StringBuffer('Books(')
          ..write('id: $id, ')
          ..write('bookid: $bookid, ')
          ..write('enabled: $enabled, ')
          ..write('title: $title, ')
          ..write('subtitle: $subtitle, ')
          ..write('songs: $songs, ')
          ..write('position: $position, ')
          ..write('created: $created, ')
          ..write('updated: $updated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, bookid, enabled, title, subtitle, songs, position, created, updated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Books &&
          other.id == this.id &&
          other.bookid == this.bookid &&
          other.enabled == this.enabled &&
          other.title == this.title &&
          other.subtitle == this.subtitle &&
          other.songs == this.songs &&
          other.position == this.position &&
          other.created == this.created &&
          other.updated == this.updated);
}

class TableBookCompanion extends UpdateCompanion<Books> {
  final Value<int> id;
  final Value<int?> bookid;
  final Value<int?> enabled;
  final Value<String> title;
  final Value<String> subtitle;
  final Value<int?> songs;
  final Value<int?> position;
  final Value<String> created;
  final Value<String> updated;
  const TableBookCompanion({
    this.id = const Value.absent(),
    this.bookid = const Value.absent(),
    this.enabled = const Value.absent(),
    this.title = const Value.absent(),
    this.subtitle = const Value.absent(),
    this.songs = const Value.absent(),
    this.position = const Value.absent(),
    this.created = const Value.absent(),
    this.updated = const Value.absent(),
  });
  TableBookCompanion.insert({
    this.id = const Value.absent(),
    this.bookid = const Value.absent(),
    this.enabled = const Value.absent(),
    required String title,
    required String subtitle,
    this.songs = const Value.absent(),
    this.position = const Value.absent(),
    required String created,
    required String updated,
  })  : title = Value(title),
        subtitle = Value(subtitle),
        created = Value(created),
        updated = Value(updated);
  static Insertable<Books> custom({
    Expression<int>? id,
    Expression<int?>? bookid,
    Expression<int?>? enabled,
    Expression<String>? title,
    Expression<String>? subtitle,
    Expression<int?>? songs,
    Expression<int?>? position,
    Expression<String>? created,
    Expression<String>? updated,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (bookid != null) 'bookid': bookid,
      if (enabled != null) 'enabled': enabled,
      if (title != null) 'title': title,
      if (subtitle != null) 'subtitle': subtitle,
      if (songs != null) 'songs': songs,
      if (position != null) 'position': position,
      if (created != null) 'created': created,
      if (updated != null) 'updated': updated,
    });
  }

  TableBookCompanion copyWith(
      {Value<int>? id,
      Value<int?>? bookid,
      Value<int?>? enabled,
      Value<String>? title,
      Value<String>? subtitle,
      Value<int?>? songs,
      Value<int?>? position,
      Value<String>? created,
      Value<String>? updated}) {
    return TableBookCompanion(
      id: id ?? this.id,
      bookid: bookid ?? this.bookid,
      enabled: enabled ?? this.enabled,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      songs: songs ?? this.songs,
      position: position ?? this.position,
      created: created ?? this.created,
      updated: updated ?? this.updated,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
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
    if (created.present) {
      map['created'] = Variable<String>(created.value);
    }
    if (updated.present) {
      map['updated'] = Variable<String>(updated.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TableBookCompanion(')
          ..write('id: $id, ')
          ..write('bookid: $bookid, ')
          ..write('enabled: $enabled, ')
          ..write('title: $title, ')
          ..write('subtitle: $subtitle, ')
          ..write('songs: $songs, ')
          ..write('position: $position, ')
          ..write('created: $created, ')
          ..write('updated: $updated')
          ..write(')'))
        .toString();
  }
}

class $TableBookTable extends TableBook with TableInfo<$TableBookTable, Books> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TableBookTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
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
          GeneratedColumn.checkTextLength(minTextLength: 10, maxTextLength: 50),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _subtitleMeta = const VerificationMeta('subtitle');
  @override
  late final GeneratedColumn<String?> subtitle = GeneratedColumn<String?>(
      'subtitle', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 10, maxTextLength: 50),
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
  final VerificationMeta _createdMeta = const VerificationMeta('created');
  @override
  late final GeneratedColumn<String?> created = GeneratedColumn<String?>(
      'created', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 10, maxTextLength: 50),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _updatedMeta = const VerificationMeta('updated');
  @override
  late final GeneratedColumn<String?> updated = GeneratedColumn<String?>(
      'updated', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 10, maxTextLength: 50),
      type: const StringType(),
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, bookid, enabled, title, subtitle, songs, position, created, updated];
  @override
  String get aliasedName => _alias ?? 'table_book';
  @override
  String get actualTableName => 'table_book';
  @override
  VerificationContext validateIntegrity(Insertable<Books> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
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
    if (data.containsKey('created')) {
      context.handle(_createdMeta,
          created.isAcceptableOrUnknown(data['created']!, _createdMeta));
    } else if (isInserting) {
      context.missing(_createdMeta);
    }
    if (data.containsKey('updated')) {
      context.handle(_updatedMeta,
          updated.isAcceptableOrUnknown(data['updated']!, _updatedMeta));
    } else if (isInserting) {
      context.missing(_updatedMeta);
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
  $TableBookTable createAlias(String alias) {
    return $TableBookTable(attachedDatabase, alias);
  }
}

class Songs extends DataClass implements Insertable<Songs> {
  final int id;
  final int? book;
  final int? songno;
  final String title;
  final String alias;
  final String content;
  final String key;
  final String author;
  final int? views;
  final String created;
  final String updated;
  Songs(
      {required this.id,
      this.book,
      this.songno,
      required this.title,
      required this.alias,
      required this.content,
      required this.key,
      required this.author,
      this.views,
      required this.created,
      required this.updated});
  factory Songs.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return Songs(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
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
      created: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}created'])!,
      updated: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}updated'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
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
    map['created'] = Variable<String>(created);
    map['updated'] = Variable<String>(updated);
    return map;
  }

  TableSongCompanion toCompanion(bool nullToAbsent) {
    return TableSongCompanion(
      id: Value(id),
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
      created: Value(created),
      updated: Value(updated),
    );
  }

  factory Songs.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Songs(
      id: serializer.fromJson<int>(json['id']),
      book: serializer.fromJson<int?>(json['book']),
      songno: serializer.fromJson<int?>(json['songno']),
      title: serializer.fromJson<String>(json['title']),
      alias: serializer.fromJson<String>(json['alias']),
      content: serializer.fromJson<String>(json['content']),
      key: serializer.fromJson<String>(json['key']),
      author: serializer.fromJson<String>(json['author']),
      views: serializer.fromJson<int?>(json['views']),
      created: serializer.fromJson<String>(json['created']),
      updated: serializer.fromJson<String>(json['updated']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'book': serializer.toJson<int?>(book),
      'songno': serializer.toJson<int?>(songno),
      'title': serializer.toJson<String>(title),
      'alias': serializer.toJson<String>(alias),
      'content': serializer.toJson<String>(content),
      'key': serializer.toJson<String>(key),
      'author': serializer.toJson<String>(author),
      'views': serializer.toJson<int?>(views),
      'created': serializer.toJson<String>(created),
      'updated': serializer.toJson<String>(updated),
    };
  }

  Songs copyWith(
          {int? id,
          int? book,
          int? songno,
          String? title,
          String? alias,
          String? content,
          String? key,
          String? author,
          int? views,
          String? created,
          String? updated}) =>
      Songs(
        id: id ?? this.id,
        book: book ?? this.book,
        songno: songno ?? this.songno,
        title: title ?? this.title,
        alias: alias ?? this.alias,
        content: content ?? this.content,
        key: key ?? this.key,
        author: author ?? this.author,
        views: views ?? this.views,
        created: created ?? this.created,
        updated: updated ?? this.updated,
      );
  @override
  String toString() {
    return (StringBuffer('Songs(')
          ..write('id: $id, ')
          ..write('book: $book, ')
          ..write('songno: $songno, ')
          ..write('title: $title, ')
          ..write('alias: $alias, ')
          ..write('content: $content, ')
          ..write('key: $key, ')
          ..write('author: $author, ')
          ..write('views: $views, ')
          ..write('created: $created, ')
          ..write('updated: $updated')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, book, songno, title, alias, content, key,
      author, views, created, updated);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Songs &&
          other.id == this.id &&
          other.book == this.book &&
          other.songno == this.songno &&
          other.title == this.title &&
          other.alias == this.alias &&
          other.content == this.content &&
          other.key == this.key &&
          other.author == this.author &&
          other.views == this.views &&
          other.created == this.created &&
          other.updated == this.updated);
}

class TableSongCompanion extends UpdateCompanion<Songs> {
  final Value<int> id;
  final Value<int?> book;
  final Value<int?> songno;
  final Value<String> title;
  final Value<String> alias;
  final Value<String> content;
  final Value<String> key;
  final Value<String> author;
  final Value<int?> views;
  final Value<String> created;
  final Value<String> updated;
  const TableSongCompanion({
    this.id = const Value.absent(),
    this.book = const Value.absent(),
    this.songno = const Value.absent(),
    this.title = const Value.absent(),
    this.alias = const Value.absent(),
    this.content = const Value.absent(),
    this.key = const Value.absent(),
    this.author = const Value.absent(),
    this.views = const Value.absent(),
    this.created = const Value.absent(),
    this.updated = const Value.absent(),
  });
  TableSongCompanion.insert({
    this.id = const Value.absent(),
    this.book = const Value.absent(),
    this.songno = const Value.absent(),
    required String title,
    required String alias,
    required String content,
    required String key,
    required String author,
    this.views = const Value.absent(),
    required String created,
    required String updated,
  })  : title = Value(title),
        alias = Value(alias),
        content = Value(content),
        key = Value(key),
        author = Value(author),
        created = Value(created),
        updated = Value(updated);
  static Insertable<Songs> custom({
    Expression<int>? id,
    Expression<int?>? book,
    Expression<int?>? songno,
    Expression<String>? title,
    Expression<String>? alias,
    Expression<String>? content,
    Expression<String>? key,
    Expression<String>? author,
    Expression<int?>? views,
    Expression<String>? created,
    Expression<String>? updated,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (book != null) 'book': book,
      if (songno != null) 'songno': songno,
      if (title != null) 'title': title,
      if (alias != null) 'alias': alias,
      if (content != null) 'body': content,
      if (key != null) 'key': key,
      if (author != null) 'author': author,
      if (views != null) 'views': views,
      if (created != null) 'created': created,
      if (updated != null) 'updated': updated,
    });
  }

  TableSongCompanion copyWith(
      {Value<int>? id,
      Value<int?>? book,
      Value<int?>? songno,
      Value<String>? title,
      Value<String>? alias,
      Value<String>? content,
      Value<String>? key,
      Value<String>? author,
      Value<int?>? views,
      Value<String>? created,
      Value<String>? updated}) {
    return TableSongCompanion(
      id: id ?? this.id,
      book: book ?? this.book,
      songno: songno ?? this.songno,
      title: title ?? this.title,
      alias: alias ?? this.alias,
      content: content ?? this.content,
      key: key ?? this.key,
      author: author ?? this.author,
      views: views ?? this.views,
      created: created ?? this.created,
      updated: updated ?? this.updated,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
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
    if (created.present) {
      map['created'] = Variable<String>(created.value);
    }
    if (updated.present) {
      map['updated'] = Variable<String>(updated.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('TableSongCompanion(')
          ..write('id: $id, ')
          ..write('book: $book, ')
          ..write('songno: $songno, ')
          ..write('title: $title, ')
          ..write('alias: $alias, ')
          ..write('content: $content, ')
          ..write('key: $key, ')
          ..write('author: $author, ')
          ..write('views: $views, ')
          ..write('created: $created, ')
          ..write('updated: $updated')
          ..write(')'))
        .toString();
  }
}

class $TableSongTable extends TableSong with TableInfo<$TableSongTable, Songs> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $TableSongTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
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
          GeneratedColumn.checkTextLength(minTextLength: 10, maxTextLength: 50),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _aliasMeta = const VerificationMeta('alias');
  @override
  late final GeneratedColumn<String?> alias = GeneratedColumn<String?>(
      'alias', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 10, maxTextLength: 50),
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
          GeneratedColumn.checkTextLength(minTextLength: 10, maxTextLength: 50),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _authorMeta = const VerificationMeta('author');
  @override
  late final GeneratedColumn<String?> author = GeneratedColumn<String?>(
      'author', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 10, maxTextLength: 50),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _viewsMeta = const VerificationMeta('views');
  @override
  late final GeneratedColumn<int?> views = GeneratedColumn<int?>(
      'views', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _createdMeta = const VerificationMeta('created');
  @override
  late final GeneratedColumn<String?> created = GeneratedColumn<String?>(
      'created', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 10, maxTextLength: 50),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _updatedMeta = const VerificationMeta('updated');
  @override
  late final GeneratedColumn<String?> updated = GeneratedColumn<String?>(
      'updated', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 10, maxTextLength: 50),
      type: const StringType(),
      requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        book,
        songno,
        title,
        alias,
        content,
        key,
        author,
        views,
        created,
        updated
      ];
  @override
  String get aliasedName => _alias ?? 'table_song';
  @override
  String get actualTableName => 'table_song';
  @override
  VerificationContext validateIntegrity(Insertable<Songs> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
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
    if (data.containsKey('created')) {
      context.handle(_createdMeta,
          created.isAcceptableOrUnknown(data['created']!, _createdMeta));
    } else if (isInserting) {
      context.missing(_createdMeta);
    }
    if (data.containsKey('updated')) {
      context.handle(_updatedMeta,
          updated.isAcceptableOrUnknown(data['updated']!, _updatedMeta));
    } else if (isInserting) {
      context.missing(_updatedMeta);
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
  $TableSongTable createAlias(String alias) {
    return $TableSongTable(attachedDatabase, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $TableBookTable tableBook = $TableBookTable(this);
  late final $TableSongTable tableSong = $TableSongTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [tableBook, tableSong];
}
