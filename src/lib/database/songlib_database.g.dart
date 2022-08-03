// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'songlib_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class DbTourResults extends DataClass implements Insertable<DbTourResults> {
  final int number;
  final int time;
  final int points;
  final int rank;
  final int mountain;
  final double? value;
  final int? teamNumberStart;
  final bool? teamIsPlayer;
  DbTourResults(
      {required this.number,
      required this.time,
      required this.points,
      required this.rank,
      required this.mountain,
      this.value,
      this.teamNumberStart,
      this.teamIsPlayer});
  factory DbTourResults.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DbTourResults(
      number: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}number'])!,
      time: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}time'])!,
      points: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}points'])!,
      rank: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}rank'])!,
      mountain: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}mountain'])!,
      value: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}value']),
      teamNumberStart: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}team_number_start']),
      teamIsPlayer: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}team_is_player']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['number'] = Variable<int>(number);
    map['time'] = Variable<int>(time);
    map['points'] = Variable<int>(points);
    map['rank'] = Variable<int>(rank);
    map['mountain'] = Variable<int>(mountain);
    if (!nullToAbsent || value != null) {
      map['value'] = Variable<double?>(value);
    }
    if (!nullToAbsent || teamNumberStart != null) {
      map['team_number_start'] = Variable<int?>(teamNumberStart);
    }
    if (!nullToAbsent || teamIsPlayer != null) {
      map['team_is_player'] = Variable<bool?>(teamIsPlayer);
    }
    return map;
  }

  DbTourResultsTableCompanion toCompanion(bool nullToAbsent) {
    return DbTourResultsTableCompanion(
      number: Value(number),
      time: Value(time),
      points: Value(points),
      rank: Value(rank),
      mountain: Value(mountain),
      value:
          value == null && nullToAbsent ? const Value.absent() : Value(value),
      teamNumberStart: teamNumberStart == null && nullToAbsent
          ? const Value.absent()
          : Value(teamNumberStart),
      teamIsPlayer: teamIsPlayer == null && nullToAbsent
          ? const Value.absent()
          : Value(teamIsPlayer),
    );
  }

  factory DbTourResults.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbTourResults(
      number: serializer.fromJson<int>(json['number']),
      time: serializer.fromJson<int>(json['time']),
      points: serializer.fromJson<int>(json['points']),
      rank: serializer.fromJson<int>(json['rank']),
      mountain: serializer.fromJson<int>(json['mountain']),
      value: serializer.fromJson<double?>(json['value']),
      teamNumberStart: serializer.fromJson<int?>(json['teamNumberStart']),
      teamIsPlayer: serializer.fromJson<bool?>(json['teamIsPlayer']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'number': serializer.toJson<int>(number),
      'time': serializer.toJson<int>(time),
      'points': serializer.toJson<int>(points),
      'rank': serializer.toJson<int>(rank),
      'mountain': serializer.toJson<int>(mountain),
      'value': serializer.toJson<double?>(value),
      'teamNumberStart': serializer.toJson<int?>(teamNumberStart),
      'teamIsPlayer': serializer.toJson<bool?>(teamIsPlayer),
    };
  }

  DbTourResults copyWith(
          {int? number,
          int? time,
          int? points,
          int? rank,
          int? mountain,
          double? value,
          int? teamNumberStart,
          bool? teamIsPlayer}) =>
      DbTourResults(
        number: number ?? this.number,
        time: time ?? this.time,
        points: points ?? this.points,
        rank: rank ?? this.rank,
        mountain: mountain ?? this.mountain,
        value: value ?? this.value,
        teamNumberStart: teamNumberStart ?? this.teamNumberStart,
        teamIsPlayer: teamIsPlayer ?? this.teamIsPlayer,
      );
  @override
  String toString() {
    return (StringBuffer('DbTourResults(')
          ..write('number: $number, ')
          ..write('time: $time, ')
          ..write('points: $points, ')
          ..write('rank: $rank, ')
          ..write('mountain: $mountain, ')
          ..write('value: $value, ')
          ..write('teamNumberStart: $teamNumberStart, ')
          ..write('teamIsPlayer: $teamIsPlayer')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(number, time, points, rank, mountain, value,
      teamNumberStart, teamIsPlayer);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbTourResults &&
          other.number == this.number &&
          other.time == this.time &&
          other.points == this.points &&
          other.rank == this.rank &&
          other.mountain == this.mountain &&
          other.value == this.value &&
          other.teamNumberStart == this.teamNumberStart &&
          other.teamIsPlayer == this.teamIsPlayer);
}

class DbTourResultsTableCompanion extends UpdateCompanion<DbTourResults> {
  final Value<int> number;
  final Value<int> time;
  final Value<int> points;
  final Value<int> rank;
  final Value<int> mountain;
  final Value<double?> value;
  final Value<int?> teamNumberStart;
  final Value<bool?> teamIsPlayer;
  const DbTourResultsTableCompanion({
    this.number = const Value.absent(),
    this.time = const Value.absent(),
    this.points = const Value.absent(),
    this.rank = const Value.absent(),
    this.mountain = const Value.absent(),
    this.value = const Value.absent(),
    this.teamNumberStart = const Value.absent(),
    this.teamIsPlayer = const Value.absent(),
  });
  DbTourResultsTableCompanion.insert({
    this.number = const Value.absent(),
    required int time,
    required int points,
    required int rank,
    required int mountain,
    this.value = const Value.absent(),
    this.teamNumberStart = const Value.absent(),
    this.teamIsPlayer = const Value.absent(),
  })  : time = Value(time),
        points = Value(points),
        rank = Value(rank),
        mountain = Value(mountain);
  static Insertable<DbTourResults> custom({
    Expression<int>? number,
    Expression<int>? time,
    Expression<int>? points,
    Expression<int>? rank,
    Expression<int>? mountain,
    Expression<double?>? value,
    Expression<int?>? teamNumberStart,
    Expression<bool?>? teamIsPlayer,
  }) {
    return RawValuesInsertable({
      if (number != null) 'number': number,
      if (time != null) 'time': time,
      if (points != null) 'points': points,
      if (rank != null) 'rank': rank,
      if (mountain != null) 'mountain': mountain,
      if (value != null) 'value': value,
      if (teamNumberStart != null) 'team_number_start': teamNumberStart,
      if (teamIsPlayer != null) 'team_is_player': teamIsPlayer,
    });
  }

  DbTourResultsTableCompanion copyWith(
      {Value<int>? number,
      Value<int>? time,
      Value<int>? points,
      Value<int>? rank,
      Value<int>? mountain,
      Value<double?>? value,
      Value<int?>? teamNumberStart,
      Value<bool?>? teamIsPlayer}) {
    return DbTourResultsTableCompanion(
      number: number ?? this.number,
      time: time ?? this.time,
      points: points ?? this.points,
      rank: rank ?? this.rank,
      mountain: mountain ?? this.mountain,
      value: value ?? this.value,
      teamNumberStart: teamNumberStart ?? this.teamNumberStart,
      teamIsPlayer: teamIsPlayer ?? this.teamIsPlayer,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (number.present) {
      map['number'] = Variable<int>(number.value);
    }
    if (time.present) {
      map['time'] = Variable<int>(time.value);
    }
    if (points.present) {
      map['points'] = Variable<int>(points.value);
    }
    if (rank.present) {
      map['rank'] = Variable<int>(rank.value);
    }
    if (mountain.present) {
      map['mountain'] = Variable<int>(mountain.value);
    }
    if (value.present) {
      map['value'] = Variable<double?>(value.value);
    }
    if (teamNumberStart.present) {
      map['team_number_start'] = Variable<int?>(teamNumberStart.value);
    }
    if (teamIsPlayer.present) {
      map['team_is_player'] = Variable<bool?>(teamIsPlayer.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbTourResultsTableCompanion(')
          ..write('number: $number, ')
          ..write('time: $time, ')
          ..write('points: $points, ')
          ..write('rank: $rank, ')
          ..write('mountain: $mountain, ')
          ..write('value: $value, ')
          ..write('teamNumberStart: $teamNumberStart, ')
          ..write('teamIsPlayer: $teamIsPlayer')
          ..write(')'))
        .toString();
  }
}

class $DbTourResultsTableTable extends DbTourResultsTable
    with TableInfo<$DbTourResultsTableTable, DbTourResults> {
  final GeneratedDatabase _db;
  final String? _alias;
  $DbTourResultsTableTable(this._db, [this._alias]);
  final VerificationMeta _numberMeta = const VerificationMeta('number');
  @override
  late final GeneratedColumn<int?> number = GeneratedColumn<int?>(
      'number', aliasedName, false,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _timeMeta = const VerificationMeta('time');
  @override
  late final GeneratedColumn<int?> time = GeneratedColumn<int?>(
      'time', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _pointsMeta = const VerificationMeta('points');
  @override
  late final GeneratedColumn<int?> points = GeneratedColumn<int?>(
      'points', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _rankMeta = const VerificationMeta('rank');
  @override
  late final GeneratedColumn<int?> rank = GeneratedColumn<int?>(
      'rank', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _mountainMeta = const VerificationMeta('mountain');
  @override
  late final GeneratedColumn<int?> mountain = GeneratedColumn<int?>(
      'mountain', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<double?> value = GeneratedColumn<double?>(
      'value', aliasedName, true,
      type: const RealType(), requiredDuringInsert: false);
  final VerificationMeta _teamNumberStartMeta =
      const VerificationMeta('teamNumberStart');
  @override
  late final GeneratedColumn<int?> teamNumberStart = GeneratedColumn<int?>(
      'team_number_start', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _teamIsPlayerMeta =
      const VerificationMeta('teamIsPlayer');
  @override
  late final GeneratedColumn<bool?> teamIsPlayer = GeneratedColumn<bool?>(
      'team_is_player', aliasedName, true,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (team_is_player IN (0, 1))');
  @override
  List<GeneratedColumn> get $columns => [
        number,
        time,
        points,
        rank,
        mountain,
        value,
        teamNumberStart,
        teamIsPlayer
      ];
  @override
  String get aliasedName => _alias ?? 'db_tour_results_table';
  @override
  String get actualTableName => 'db_tour_results_table';
  @override
  VerificationContext validateIntegrity(Insertable<DbTourResults> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('number')) {
      context.handle(_numberMeta,
          number.isAcceptableOrUnknown(data['number']!, _numberMeta));
    }
    if (data.containsKey('time')) {
      context.handle(
          _timeMeta, time.isAcceptableOrUnknown(data['time']!, _timeMeta));
    } else if (isInserting) {
      context.missing(_timeMeta);
    }
    if (data.containsKey('points')) {
      context.handle(_pointsMeta,
          points.isAcceptableOrUnknown(data['points']!, _pointsMeta));
    } else if (isInserting) {
      context.missing(_pointsMeta);
    }
    if (data.containsKey('rank')) {
      context.handle(
          _rankMeta, rank.isAcceptableOrUnknown(data['rank']!, _rankMeta));
    } else if (isInserting) {
      context.missing(_rankMeta);
    }
    if (data.containsKey('mountain')) {
      context.handle(_mountainMeta,
          mountain.isAcceptableOrUnknown(data['mountain']!, _mountainMeta));
    } else if (isInserting) {
      context.missing(_mountainMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    }
    if (data.containsKey('team_number_start')) {
      context.handle(
          _teamNumberStartMeta,
          teamNumberStart.isAcceptableOrUnknown(
              data['team_number_start']!, _teamNumberStartMeta));
    }
    if (data.containsKey('team_is_player')) {
      context.handle(
          _teamIsPlayerMeta,
          teamIsPlayer.isAcceptableOrUnknown(
              data['team_is_player']!, _teamIsPlayerMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {number};
  @override
  DbTourResults map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DbTourResults.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DbTourResultsTableTable createAlias(String alias) {
    return $DbTourResultsTableTable(_db, alias);
  }
}

class DbCareerCalendarEventWinners extends DataClass
    implements Insertable<DbCareerCalendarEventWinners> {
  final int resultId;
  final int number;
  DbCareerCalendarEventWinners({required this.resultId, required this.number});
  factory DbCareerCalendarEventWinners.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DbCareerCalendarEventWinners(
      resultId: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}result_id'])!,
      number: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}number'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['result_id'] = Variable<int>(resultId);
    map['number'] = Variable<int>(number);
    return map;
  }

  DbCareerCalendarEventWinnersTableCompanion toCompanion(bool nullToAbsent) {
    return DbCareerCalendarEventWinnersTableCompanion(
      resultId: Value(resultId),
      number: Value(number),
    );
  }

  factory DbCareerCalendarEventWinners.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbCareerCalendarEventWinners(
      resultId: serializer.fromJson<int>(json['resultId']),
      number: serializer.fromJson<int>(json['number']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'resultId': serializer.toJson<int>(resultId),
      'number': serializer.toJson<int>(number),
    };
  }

  DbCareerCalendarEventWinners copyWith({int? resultId, int? number}) =>
      DbCareerCalendarEventWinners(
        resultId: resultId ?? this.resultId,
        number: number ?? this.number,
      );
  @override
  String toString() {
    return (StringBuffer('DbCareerCalendarEventWinners(')
          ..write('resultId: $resultId, ')
          ..write('number: $number')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(resultId, number);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbCareerCalendarEventWinners &&
          other.resultId == this.resultId &&
          other.number == this.number);
}

class DbCareerCalendarEventWinnersTableCompanion
    extends UpdateCompanion<DbCareerCalendarEventWinners> {
  final Value<int> resultId;
  final Value<int> number;
  const DbCareerCalendarEventWinnersTableCompanion({
    this.resultId = const Value.absent(),
    this.number = const Value.absent(),
  });
  DbCareerCalendarEventWinnersTableCompanion.insert({
    required int resultId,
    required int number,
  })  : resultId = Value(resultId),
        number = Value(number);
  static Insertable<DbCareerCalendarEventWinners> custom({
    Expression<int>? resultId,
    Expression<int>? number,
  }) {
    return RawValuesInsertable({
      if (resultId != null) 'result_id': resultId,
      if (number != null) 'number': number,
    });
  }

  DbCareerCalendarEventWinnersTableCompanion copyWith(
      {Value<int>? resultId, Value<int>? number}) {
    return DbCareerCalendarEventWinnersTableCompanion(
      resultId: resultId ?? this.resultId,
      number: number ?? this.number,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (resultId.present) {
      map['result_id'] = Variable<int>(resultId.value);
    }
    if (number.present) {
      map['number'] = Variable<int>(number.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbCareerCalendarEventWinnersTableCompanion(')
          ..write('resultId: $resultId, ')
          ..write('number: $number')
          ..write(')'))
        .toString();
  }
}

class $DbCareerCalendarEventWinnersTableTable
    extends DbCareerCalendarEventWinnersTable
    with
        TableInfo<$DbCareerCalendarEventWinnersTableTable,
            DbCareerCalendarEventWinners> {
  final GeneratedDatabase _db;
  final String? _alias;
  $DbCareerCalendarEventWinnersTableTable(this._db, [this._alias]);
  final VerificationMeta _resultIdMeta = const VerificationMeta('resultId');
  @override
  late final GeneratedColumn<int?> resultId = GeneratedColumn<int?>(
      'result_id', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _numberMeta = const VerificationMeta('number');
  @override
  late final GeneratedColumn<int?> number = GeneratedColumn<int?>(
      'number', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [resultId, number];
  @override
  String get aliasedName => _alias ?? 'db_career_calendar_event_winners_table';
  @override
  String get actualTableName => 'db_career_calendar_event_winners_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<DbCareerCalendarEventWinners> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('result_id')) {
      context.handle(_resultIdMeta,
          resultId.isAcceptableOrUnknown(data['result_id']!, _resultIdMeta));
    } else if (isInserting) {
      context.missing(_resultIdMeta);
    }
    if (data.containsKey('number')) {
      context.handle(_numberMeta,
          number.isAcceptableOrUnknown(data['number']!, _numberMeta));
    } else if (isInserting) {
      context.missing(_numberMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {number, resultId};
  @override
  DbCareerCalendarEventWinners map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    return DbCareerCalendarEventWinners.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DbCareerCalendarEventWinnersTableTable createAlias(String alias) {
    return $DbCareerCalendarEventWinnersTableTable(_db, alias);
  }
}

class DbCareerResults extends DataClass implements Insertable<DbCareerResults> {
  final int number;
  final int time;
  final int points;
  final int rank;
  final int? teamNumberStart;
  final bool teamIsPlayer;
  DbCareerResults(
      {required this.number,
      required this.time,
      required this.points,
      required this.rank,
      this.teamNumberStart,
      required this.teamIsPlayer});
  factory DbCareerResults.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DbCareerResults(
      number: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}number'])!,
      time: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}time'])!,
      points: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}points'])!,
      rank: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}rank'])!,
      teamNumberStart: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}team_number_start']),
      teamIsPlayer: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}team_is_player'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['number'] = Variable<int>(number);
    map['time'] = Variable<int>(time);
    map['points'] = Variable<int>(points);
    map['rank'] = Variable<int>(rank);
    if (!nullToAbsent || teamNumberStart != null) {
      map['team_number_start'] = Variable<int?>(teamNumberStart);
    }
    map['team_is_player'] = Variable<bool>(teamIsPlayer);
    return map;
  }

  DbCareerResultsTableCompanion toCompanion(bool nullToAbsent) {
    return DbCareerResultsTableCompanion(
      number: Value(number),
      time: Value(time),
      points: Value(points),
      rank: Value(rank),
      teamNumberStart: teamNumberStart == null && nullToAbsent
          ? const Value.absent()
          : Value(teamNumberStart),
      teamIsPlayer: Value(teamIsPlayer),
    );
  }

  factory DbCareerResults.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbCareerResults(
      number: serializer.fromJson<int>(json['number']),
      time: serializer.fromJson<int>(json['time']),
      points: serializer.fromJson<int>(json['points']),
      rank: serializer.fromJson<int>(json['rank']),
      teamNumberStart: serializer.fromJson<int?>(json['teamNumberStart']),
      teamIsPlayer: serializer.fromJson<bool>(json['teamIsPlayer']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'number': serializer.toJson<int>(number),
      'time': serializer.toJson<int>(time),
      'points': serializer.toJson<int>(points),
      'rank': serializer.toJson<int>(rank),
      'teamNumberStart': serializer.toJson<int?>(teamNumberStart),
      'teamIsPlayer': serializer.toJson<bool>(teamIsPlayer),
    };
  }

  DbCareerResults copyWith(
          {int? number,
          int? time,
          int? points,
          int? rank,
          int? teamNumberStart,
          bool? teamIsPlayer}) =>
      DbCareerResults(
        number: number ?? this.number,
        time: time ?? this.time,
        points: points ?? this.points,
        rank: rank ?? this.rank,
        teamNumberStart: teamNumberStart ?? this.teamNumberStart,
        teamIsPlayer: teamIsPlayer ?? this.teamIsPlayer,
      );
  @override
  String toString() {
    return (StringBuffer('DbCareerResults(')
          ..write('number: $number, ')
          ..write('time: $time, ')
          ..write('points: $points, ')
          ..write('rank: $rank, ')
          ..write('teamNumberStart: $teamNumberStart, ')
          ..write('teamIsPlayer: $teamIsPlayer')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(number, time, points, rank, teamNumberStart, teamIsPlayer);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbCareerResults &&
          other.number == this.number &&
          other.time == this.time &&
          other.points == this.points &&
          other.rank == this.rank &&
          other.teamNumberStart == this.teamNumberStart &&
          other.teamIsPlayer == this.teamIsPlayer);
}

class DbCareerResultsTableCompanion extends UpdateCompanion<DbCareerResults> {
  final Value<int> number;
  final Value<int> time;
  final Value<int> points;
  final Value<int> rank;
  final Value<int?> teamNumberStart;
  final Value<bool> teamIsPlayer;
  const DbCareerResultsTableCompanion({
    this.number = const Value.absent(),
    this.time = const Value.absent(),
    this.points = const Value.absent(),
    this.rank = const Value.absent(),
    this.teamNumberStart = const Value.absent(),
    this.teamIsPlayer = const Value.absent(),
  });
  DbCareerResultsTableCompanion.insert({
    this.number = const Value.absent(),
    required int time,
    required int points,
    required int rank,
    this.teamNumberStart = const Value.absent(),
    required bool teamIsPlayer,
  })  : time = Value(time),
        points = Value(points),
        rank = Value(rank),
        teamIsPlayer = Value(teamIsPlayer);
  static Insertable<DbCareerResults> custom({
    Expression<int>? number,
    Expression<int>? time,
    Expression<int>? points,
    Expression<int>? rank,
    Expression<int?>? teamNumberStart,
    Expression<bool>? teamIsPlayer,
  }) {
    return RawValuesInsertable({
      if (number != null) 'number': number,
      if (time != null) 'time': time,
      if (points != null) 'points': points,
      if (rank != null) 'rank': rank,
      if (teamNumberStart != null) 'team_number_start': teamNumberStart,
      if (teamIsPlayer != null) 'team_is_player': teamIsPlayer,
    });
  }

  DbCareerResultsTableCompanion copyWith(
      {Value<int>? number,
      Value<int>? time,
      Value<int>? points,
      Value<int>? rank,
      Value<int?>? teamNumberStart,
      Value<bool>? teamIsPlayer}) {
    return DbCareerResultsTableCompanion(
      number: number ?? this.number,
      time: time ?? this.time,
      points: points ?? this.points,
      rank: rank ?? this.rank,
      teamNumberStart: teamNumberStart ?? this.teamNumberStart,
      teamIsPlayer: teamIsPlayer ?? this.teamIsPlayer,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (number.present) {
      map['number'] = Variable<int>(number.value);
    }
    if (time.present) {
      map['time'] = Variable<int>(time.value);
    }
    if (points.present) {
      map['points'] = Variable<int>(points.value);
    }
    if (rank.present) {
      map['rank'] = Variable<int>(rank.value);
    }
    if (teamNumberStart.present) {
      map['team_number_start'] = Variable<int?>(teamNumberStart.value);
    }
    if (teamIsPlayer.present) {
      map['team_is_player'] = Variable<bool>(teamIsPlayer.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DbCareerResultsTableCompanion(')
          ..write('number: $number, ')
          ..write('time: $time, ')
          ..write('points: $points, ')
          ..write('rank: $rank, ')
          ..write('teamNumberStart: $teamNumberStart, ')
          ..write('teamIsPlayer: $teamIsPlayer')
          ..write(')'))
        .toString();
  }
}

class $DbCareerResultsTableTable extends DbCareerResultsTable
    with TableInfo<$DbCareerResultsTableTable, DbCareerResults> {
  final GeneratedDatabase _db;
  final String? _alias;
  $DbCareerResultsTableTable(this._db, [this._alias]);
  final VerificationMeta _numberMeta = const VerificationMeta('number');
  @override
  late final GeneratedColumn<int?> number = GeneratedColumn<int?>(
      'number', aliasedName, false,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _timeMeta = const VerificationMeta('time');
  @override
  late final GeneratedColumn<int?> time = GeneratedColumn<int?>(
      'time', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _pointsMeta = const VerificationMeta('points');
  @override
  late final GeneratedColumn<int?> points = GeneratedColumn<int?>(
      'points', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _rankMeta = const VerificationMeta('rank');
  @override
  late final GeneratedColumn<int?> rank = GeneratedColumn<int?>(
      'rank', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _teamNumberStartMeta =
      const VerificationMeta('teamNumberStart');
  @override
  late final GeneratedColumn<int?> teamNumberStart = GeneratedColumn<int?>(
      'team_number_start', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _teamIsPlayerMeta =
      const VerificationMeta('teamIsPlayer');
  @override
  late final GeneratedColumn<bool?> teamIsPlayer = GeneratedColumn<bool?>(
      'team_is_player', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (team_is_player IN (0, 1))');
  @override
  List<GeneratedColumn> get $columns =>
      [number, time, points, rank, teamNumberStart, teamIsPlayer];
  @override
  String get aliasedName => _alias ?? 'db_career_results_table';
  @override
  String get actualTableName => 'db_career_results_table';
  @override
  VerificationContext validateIntegrity(Insertable<DbCareerResults> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('number')) {
      context.handle(_numberMeta,
          number.isAcceptableOrUnknown(data['number']!, _numberMeta));
    }
    if (data.containsKey('time')) {
      context.handle(
          _timeMeta, time.isAcceptableOrUnknown(data['time']!, _timeMeta));
    } else if (isInserting) {
      context.missing(_timeMeta);
    }
    if (data.containsKey('points')) {
      context.handle(_pointsMeta,
          points.isAcceptableOrUnknown(data['points']!, _pointsMeta));
    } else if (isInserting) {
      context.missing(_pointsMeta);
    }
    if (data.containsKey('rank')) {
      context.handle(
          _rankMeta, rank.isAcceptableOrUnknown(data['rank']!, _rankMeta));
    } else if (isInserting) {
      context.missing(_rankMeta);
    }
    if (data.containsKey('team_number_start')) {
      context.handle(
          _teamNumberStartMeta,
          teamNumberStart.isAcceptableOrUnknown(
              data['team_number_start']!, _teamNumberStartMeta));
    }
    if (data.containsKey('team_is_player')) {
      context.handle(
          _teamIsPlayerMeta,
          teamIsPlayer.isAcceptableOrUnknown(
              data['team_is_player']!, _teamIsPlayerMeta));
    } else if (isInserting) {
      context.missing(_teamIsPlayerMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {number};
  @override
  DbCareerResults map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DbCareerResults.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DbCareerResultsTableTable createAlias(String alias) {
    return $DbCareerResultsTableTable(_db, alias);
  }
}

class DbBook extends DataClass implements Insertable<DbBook> {
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
  DbBook(
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
  factory DbBook.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DbBook(
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

  DbBookTableCompanion toCompanion(bool nullToAbsent) {
    return DbBookTableCompanion(
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

  factory DbBook.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbBook(
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

  DbBook copyWith(
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
      DbBook(
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
    return (StringBuffer('DbBook(')
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
      (other is DbBook &&
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

class DbBookTableCompanion extends UpdateCompanion<DbBook> {
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
  const DbBookTableCompanion({
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
  DbBookTableCompanion.insert({
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
  static Insertable<DbBook> custom({
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

  DbBookTableCompanion copyWith(
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
    return DbBookTableCompanion(
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
    return (StringBuffer('DbBookTableCompanion(')
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

class $DbBookTableTable extends DbBookTable
    with TableInfo<$DbBookTableTable, DbBook> {
  final GeneratedDatabase _db;
  final String? _alias;
  $DbBookTableTable(this._db, [this._alias]);
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
      defaultValue: Constant(dateNow()));
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String?> updatedAt = GeneratedColumn<String?>(
      'updated_at', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: Constant(dateNow()));
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
  DbBook map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DbBook.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DbBookTableTable createAlias(String alias) {
    return $DbBookTableTable(_db, alias);
  }
}

class DbDraft extends DataClass implements Insertable<DbDraft> {
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
  DbDraft(
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
  factory DbDraft.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DbDraft(
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

  DbDraftTableCompanion toCompanion(bool nullToAbsent) {
    return DbDraftTableCompanion(
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

  factory DbDraft.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbDraft(
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

  DbDraft copyWith(
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
      DbDraft(
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
    return (StringBuffer('DbDraft(')
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
      (other is DbDraft &&
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

class DbDraftTableCompanion extends UpdateCompanion<DbDraft> {
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
  const DbDraftTableCompanion({
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
  DbDraftTableCompanion.insert({
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
  static Insertable<DbDraft> custom({
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

  DbDraftTableCompanion copyWith(
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
    return DbDraftTableCompanion(
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
    return (StringBuffer('DbDraftTableCompanion(')
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

class $DbDraftTableTable extends DbDraftTable
    with TableInfo<$DbDraftTableTable, DbDraft> {
  final GeneratedDatabase _db;
  final String? _alias;
  $DbDraftTableTable(this._db, [this._alias]);
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
      defaultValue: Constant(dateNow()));
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String?> updatedAt = GeneratedColumn<String?>(
      'updated_at', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: Constant(dateNow()));
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
  VerificationContext validateIntegrity(Insertable<DbDraft> instance,
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
  DbDraft map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DbDraft.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DbDraftTableTable createAlias(String alias) {
    return $DbDraftTableTable(_db, alias);
  }
}

class DbHistory extends DataClass implements Insertable<DbHistory> {
  final int id;
  final String objectId;
  final int song;
  final String createdAt;
  DbHistory(
      {required this.id,
      required this.objectId,
      required this.song,
      required this.createdAt});
  factory DbHistory.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DbHistory(
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

  DbHistoryTableCompanion toCompanion(bool nullToAbsent) {
    return DbHistoryTableCompanion(
      id: Value(id),
      objectId: Value(objectId),
      song: Value(song),
      createdAt: Value(createdAt),
    );
  }

  factory DbHistory.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbHistory(
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

  DbHistory copyWith(
          {int? id, String? objectId, int? song, String? createdAt}) =>
      DbHistory(
        id: id ?? this.id,
        objectId: objectId ?? this.objectId,
        song: song ?? this.song,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('DbHistory(')
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
      (other is DbHistory &&
          other.id == this.id &&
          other.objectId == this.objectId &&
          other.song == this.song &&
          other.createdAt == this.createdAt);
}

class DbHistoryTableCompanion extends UpdateCompanion<DbHistory> {
  final Value<int> id;
  final Value<String> objectId;
  final Value<int> song;
  final Value<String> createdAt;
  const DbHistoryTableCompanion({
    this.id = const Value.absent(),
    this.objectId = const Value.absent(),
    this.song = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  DbHistoryTableCompanion.insert({
    this.id = const Value.absent(),
    this.objectId = const Value.absent(),
    this.song = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  static Insertable<DbHistory> custom({
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

  DbHistoryTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? objectId,
      Value<int>? song,
      Value<String>? createdAt}) {
    return DbHistoryTableCompanion(
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
    return (StringBuffer('DbHistoryTableCompanion(')
          ..write('id: $id, ')
          ..write('objectId: $objectId, ')
          ..write('song: $song, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $DbHistoryTableTable extends DbHistoryTable
    with TableInfo<$DbHistoryTableTable, DbHistory> {
  final GeneratedDatabase _db;
  final String? _alias;
  $DbHistoryTableTable(this._db, [this._alias]);
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
      defaultValue: Constant(dateNow()));
  @override
  List<GeneratedColumn> get $columns => [id, objectId, song, createdAt];
  @override
  String get aliasedName => _alias ?? 'db_history_table';
  @override
  String get actualTableName => 'db_history_table';
  @override
  VerificationContext validateIntegrity(Insertable<DbHistory> instance,
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
  DbHistory map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DbHistory.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DbHistoryTableTable createAlias(String alias) {
    return $DbHistoryTableTable(_db, alias);
  }
}

class DbListed extends DataClass implements Insertable<DbListed> {
  final int id;
  final String objectId;
  final int parentid;
  final String title;
  final String description;
  final int position;
  final String createdAt;
  final String updatedAt;
  DbListed(
      {required this.id,
      required this.objectId,
      required this.parentid,
      required this.title,
      required this.description,
      required this.position,
      required this.createdAt,
      required this.updatedAt});
  factory DbListed.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DbListed(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      objectId: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}object_id'])!,
      parentid: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}parentid'])!,
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
    map['title'] = Variable<String>(title);
    map['description'] = Variable<String>(description);
    map['position'] = Variable<int>(position);
    map['created_at'] = Variable<String>(createdAt);
    map['updated_at'] = Variable<String>(updatedAt);
    return map;
  }

  DbListedTableCompanion toCompanion(bool nullToAbsent) {
    return DbListedTableCompanion(
      id: Value(id),
      objectId: Value(objectId),
      parentid: Value(parentid),
      title: Value(title),
      description: Value(description),
      position: Value(position),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory DbListed.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbListed(
      id: serializer.fromJson<int>(json['id']),
      objectId: serializer.fromJson<String>(json['objectId']),
      parentid: serializer.fromJson<int>(json['parentid']),
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
      'title': serializer.toJson<String>(title),
      'description': serializer.toJson<String>(description),
      'position': serializer.toJson<int>(position),
      'createdAt': serializer.toJson<String>(createdAt),
      'updatedAt': serializer.toJson<String>(updatedAt),
    };
  }

  DbListed copyWith(
          {int? id,
          String? objectId,
          int? parentid,
          String? title,
          String? description,
          int? position,
          String? createdAt,
          String? updatedAt}) =>
      DbListed(
        id: id ?? this.id,
        objectId: objectId ?? this.objectId,
        parentid: parentid ?? this.parentid,
        title: title ?? this.title,
        description: description ?? this.description,
        position: position ?? this.position,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  @override
  String toString() {
    return (StringBuffer('DbListed(')
          ..write('id: $id, ')
          ..write('objectId: $objectId, ')
          ..write('parentid: $parentid, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('position: $position, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, objectId, parentid, title, description,
      position, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DbListed &&
          other.id == this.id &&
          other.objectId == this.objectId &&
          other.parentid == this.parentid &&
          other.title == this.title &&
          other.description == this.description &&
          other.position == this.position &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class DbListedTableCompanion extends UpdateCompanion<DbListed> {
  final Value<int> id;
  final Value<String> objectId;
  final Value<int> parentid;
  final Value<String> title;
  final Value<String> description;
  final Value<int> position;
  final Value<String> createdAt;
  final Value<String> updatedAt;
  const DbListedTableCompanion({
    this.id = const Value.absent(),
    this.objectId = const Value.absent(),
    this.parentid = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.position = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  DbListedTableCompanion.insert({
    this.id = const Value.absent(),
    this.objectId = const Value.absent(),
    this.parentid = const Value.absent(),
    this.title = const Value.absent(),
    this.description = const Value.absent(),
    this.position = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  static Insertable<DbListed> custom({
    Expression<int>? id,
    Expression<String>? objectId,
    Expression<int>? parentid,
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
      if (title != null) 'title': title,
      if (description != null) 'description': description,
      if (position != null) 'position': position,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  DbListedTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? objectId,
      Value<int>? parentid,
      Value<String>? title,
      Value<String>? description,
      Value<int>? position,
      Value<String>? createdAt,
      Value<String>? updatedAt}) {
    return DbListedTableCompanion(
      id: id ?? this.id,
      objectId: objectId ?? this.objectId,
      parentid: parentid ?? this.parentid,
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
    return (StringBuffer('DbListedTableCompanion(')
          ..write('id: $id, ')
          ..write('objectId: $objectId, ')
          ..write('parentid: $parentid, ')
          ..write('title: $title, ')
          ..write('description: $description, ')
          ..write('position: $position, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $DbListedTableTable extends DbListedTable
    with TableInfo<$DbListedTableTable, DbListed> {
  final GeneratedDatabase _db;
  final String? _alias;
  $DbListedTableTable(this._db, [this._alias]);
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
      defaultValue: Constant(dateNow()));
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String?> updatedAt = GeneratedColumn<String?>(
      'updated_at', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: Constant(dateNow()));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        objectId,
        parentid,
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
  VerificationContext validateIntegrity(Insertable<DbListed> instance,
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
  DbListed map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DbListed.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DbListedTableTable createAlias(String alias) {
    return $DbListedTableTable(_db, alias);
  }
}

class DbSearch extends DataClass implements Insertable<DbSearch> {
  final int id;
  final String objectId;
  final String title;
  final String createdAt;
  DbSearch(
      {required this.id,
      required this.objectId,
      required this.title,
      required this.createdAt});
  factory DbSearch.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DbSearch(
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

  DbSearchTableCompanion toCompanion(bool nullToAbsent) {
    return DbSearchTableCompanion(
      id: Value(id),
      objectId: Value(objectId),
      title: Value(title),
      createdAt: Value(createdAt),
    );
  }

  factory DbSearch.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbSearch(
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

  DbSearch copyWith(
          {int? id, String? objectId, String? title, String? createdAt}) =>
      DbSearch(
        id: id ?? this.id,
        objectId: objectId ?? this.objectId,
        title: title ?? this.title,
        createdAt: createdAt ?? this.createdAt,
      );
  @override
  String toString() {
    return (StringBuffer('DbSearch(')
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
      (other is DbSearch &&
          other.id == this.id &&
          other.objectId == this.objectId &&
          other.title == this.title &&
          other.createdAt == this.createdAt);
}

class DbSearchTableCompanion extends UpdateCompanion<DbSearch> {
  final Value<int> id;
  final Value<String> objectId;
  final Value<String> title;
  final Value<String> createdAt;
  const DbSearchTableCompanion({
    this.id = const Value.absent(),
    this.objectId = const Value.absent(),
    this.title = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  DbSearchTableCompanion.insert({
    this.id = const Value.absent(),
    this.objectId = const Value.absent(),
    this.title = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  static Insertable<DbSearch> custom({
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

  DbSearchTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? objectId,
      Value<String>? title,
      Value<String>? createdAt}) {
    return DbSearchTableCompanion(
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
    return (StringBuffer('DbSearchTableCompanion(')
          ..write('id: $id, ')
          ..write('objectId: $objectId, ')
          ..write('title: $title, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $DbSearchTableTable extends DbSearchTable
    with TableInfo<$DbSearchTableTable, DbSearch> {
  final GeneratedDatabase _db;
  final String? _alias;
  $DbSearchTableTable(this._db, [this._alias]);
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
      defaultValue: Constant(dateNow()));
  @override
  List<GeneratedColumn> get $columns => [id, objectId, title, createdAt];
  @override
  String get aliasedName => _alias ?? 'db_search_table';
  @override
  String get actualTableName => 'db_search_table';
  @override
  VerificationContext validateIntegrity(Insertable<DbSearch> instance,
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
  DbSearch map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DbSearch.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DbSearchTableTable createAlias(String alias) {
    return $DbSearchTableTable(_db, alias);
  }
}

class DbSong extends DataClass implements Insertable<DbSong> {
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
  DbSong(
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
  factory DbSong.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return DbSong(
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

  DbSongTableCompanion toCompanion(bool nullToAbsent) {
    return DbSongTableCompanion(
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

  factory DbSong.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DbSong(
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

  DbSong copyWith(
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
      DbSong(
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
    return (StringBuffer('DbSong(')
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
      (other is DbSong &&
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

class DbSongTableCompanion extends UpdateCompanion<DbSong> {
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
  const DbSongTableCompanion({
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
  DbSongTableCompanion.insert({
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
  static Insertable<DbSong> custom({
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

  DbSongTableCompanion copyWith(
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
    return DbSongTableCompanion(
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
    return (StringBuffer('DbSongTableCompanion(')
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

class $DbSongTableTable extends DbSongTable
    with TableInfo<$DbSongTableTable, DbSong> {
  final GeneratedDatabase _db;
  final String? _alias;
  $DbSongTableTable(this._db, [this._alias]);
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
      defaultValue: Constant(dateNow()));
  final VerificationMeta _updatedAtMeta = const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<String?> updatedAt = GeneratedColumn<String?>(
      'updated_at', aliasedName, false,
      type: const StringType(),
      requiredDuringInsert: false,
      defaultValue: Constant(dateNow()));
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
  DbSong map(Map<String, dynamic> data, {String? tablePrefix}) {
    return DbSong.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $DbSongTableTable createAlias(String alias) {
    return $DbSongTableTable(_db, alias);
  }
}

abstract class _$SongLibDatabase extends GeneratedDatabase {
  _$SongLibDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  _$SongLibDatabase.connect(DatabaseConnection c) : super.connect(c);
  late final $DbTourResultsTableTable dbTourResultsTable =
      $DbTourResultsTableTable(this);
  late final $DbCareerCalendarEventWinnersTableTable
      dbCareerCalendarEventWinnersTable =
      $DbCareerCalendarEventWinnersTableTable(this);
  late final $DbCareerResultsTableTable dbCareerResultsTable =
      $DbCareerResultsTableTable(this);
  late final $DbBookTableTable dbBookTable = $DbBookTableTable(this);
  late final $DbDraftTableTable dbDraftTable = $DbDraftTableTable(this);
  late final $DbHistoryTableTable dbHistoryTable = $DbHistoryTableTable(this);
  late final $DbListedTableTable dbListedTable = $DbListedTableTable(this);
  late final $DbSearchTableTable dbSearchTable = $DbSearchTableTable(this);
  late final $DbSongTableTable dbSongTable = $DbSongTableTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        dbTourResultsTable,
        dbCareerCalendarEventWinnersTable,
        dbCareerResultsTable,
        dbBookTable,
        dbDraftTable,
        dbHistoryTable,
        dbListedTable,
        dbSearchTable,
        dbSongTable
      ];
}
