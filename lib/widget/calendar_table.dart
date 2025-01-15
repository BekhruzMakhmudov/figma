import 'package:flutter/cupertino.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarTable extends StatefulWidget {
  const CalendarTable({super.key});
  @override
  State<CalendarTable> createState() => _CalendarTableState();
}

class _CalendarTableState extends State<CalendarTable> {
  final focusedDay=DateTime.now();
  DateTime? startDate;
  DateTime? endDate;

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.utc(2021, 1, 1),
      lastDay: DateTime.utc(2025, 12, 31),
      focusedDay: focusedDay,
      rangeSelectionMode: RangeSelectionMode.enforced,
      rangeStartDay: startDate,
      rangeEndDay: endDate,
      startingDayOfWeek: StartingDayOfWeek.monday,
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
      ),
      onRangeSelected: (start, end, _) {
        setState(() {
          if (start?.isAfter(focusedDay) ?? true) {
            startDate = start;
          }
          if (end?.isAfter(focusedDay) ?? true) {
            endDate = end;
          }
        });
      },
    );
  }
}
