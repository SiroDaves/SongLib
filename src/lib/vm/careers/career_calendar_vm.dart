import 'package:songlib/model/data/calendar_event.dart';
import 'package:songlib/navigator/mixin/back_navigator.dart';
import 'package:songlib/repository/calendar_repository.dart';
import 'package:songlib/repository/name_repository.dart';
import 'package:icapps_architecture/icapps_architecture.dart';
import 'package:injectable/injectable.dart';

@injectable
class CareerCalendarVm with ChangeNotifierEx {
  late final CareerCalendarNavigator _navigator;
  final CalendarRepository _calendarRepository;
  final NameRepository _nameRepository;
  final List<CalendarEvent> _calendarEvents = [];

  List<CalendarEvent> get calendarEvents => _calendarEvents;

  String numberToName(int? number) => (number == null ? null : _nameRepository.names[number]) ?? '-';

  CareerCalendarVm(
    this._calendarRepository,
    this._nameRepository,
  );

  Future<void> init(CareerCalendarNavigator navigator) async {
    _navigator = navigator;
    _calendarEvents.addAll(await _calendarRepository.calendarEvents);
    notifyListeners();
  }

  void onClosePressed() => _navigator.goBack<void>();
}

mixin CareerCalendarNavigator implements BackNavigator {}
