import 'package:collection/collection.dart';
import 'package:songlib/database/songlib_database.dart';
import 'package:songlib/model/data/calendar_event.dart';
import 'package:drift/drift.dart';

@DataClassName('DbCareerCalendarEventWinners')
class DbCareerCalendarEventWinnersTable extends Table {
  @override
  Set<Column>? get primaryKey => {number, resultId};

  IntColumn get resultId => integer()();

  IntColumn get number => integer()();
}

extension DbCareerCalendarEventWinnersExtension on DbCareerCalendarEventWinners {
  void setWinners(List<CalendarEvent> events) {
    final event = events.firstWhereOrNull((event) => event.id == resultId);
    event?.winner = number;
  }
}

extension CalendarEventExtension on CalendarEvent {
  DbCareerCalendarEventWinners get winnerDbModel => DbCareerCalendarEventWinners(
        resultId: id,
        number: winner ?? 0,
      );
}
