import 'package:flutter/cupertino.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarTable extends StatefulWidget {
  final DateTime today;
  final DateTime? start;
  final DateTime? end;
  final OnRangeSelected onRangeSelected;
  const CalendarTable({
    super.key,
    required this.today,
    this.start,
    this.end,
    required this.onRangeSelected,
  });
  @override
  State<CalendarTable> createState() => _CalendarTableState();
}

class _CalendarTableState extends State<CalendarTable> {
  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.utc(2021, 1, 1),
      lastDay: DateTime.utc(2025, 12, 31),
      focusedDay: widget.today,
      rangeSelectionMode: RangeSelectionMode.enforced,
      rangeStartDay: widget.start,
      rangeEndDay: widget.end,
      startingDayOfWeek: StartingDayOfWeek.monday,
      headerStyle: HeaderStyle(
        formatButtonVisible: false,
        titleCentered: true,
      ),
      onRangeSelected:widget.onRangeSelected,
    );
  }
}
