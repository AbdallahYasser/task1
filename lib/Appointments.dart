import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarOne extends StatefulWidget {
  @override
  _CalendarOneState createState() => _CalendarOneState();
}

class _CalendarOneState extends State<CalendarOne> {
  CalendarController _calendarController;
  @override
  void initState() {
    _calendarController = CalendarController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: TableCalendar(
        startingDayOfWeek: StartingDayOfWeek.saturday,
        // initialCalendarFormat: CalendarFormat.month,
        // availableCalendarFormats: ,
        calendarController: _calendarController,
      ),
    );
  }
}
