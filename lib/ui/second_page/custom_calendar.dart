import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomCalendar extends StatefulWidget {
  final String locale;

  const CustomCalendar({Key? key, required this.locale}) : super(key: key);

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  var _calendarFormat = CalendarFormat.week;
  late List<DateTime> _selectedEvents;

  var today = DateTime.now();
  var currentDay = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedEvents = [];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0),
      elevation: 6,
      shadowColor: const Color(0xff26725cc1),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(16),
          bottomLeft: Radius.circular(16),
        ),
      ),
      child: TableCalendar(
        headerStyle: const HeaderStyle(
          formatButtonVisible: false,
          titleTextStyle: TextStyle(fontSize: 28),
        ),
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: currentDay,
        startingDayOfWeek: StartingDayOfWeek.monday,
        calendarFormat: _calendarFormat,
        formatAnimationCurve: Curves.easeInOut,
        formatAnimationDuration: const Duration(milliseconds: 300),
        pageAnimationCurve: Curves.easeInOut,
        pageAnimationDuration: const Duration(milliseconds: 500),
        pageAnimationEnabled: false,
        pageJumpingEnabled: true,
        locale: widget.locale,
        onFormatChanged: (format) {
          setState(() {
            _calendarFormat = format;
          });
        },
        calendarStyle: CalendarStyle(
          todayTextStyle: const TextStyle(color: Colors.deepPurple),
          selectedTextStyle: const TextStyle(color: Colors.grey),
          selectedDecoration: const BoxDecoration(
            color: Colors.deepPurple,
            shape: BoxShape.rectangle,
          ),
          todayDecoration: BoxDecoration(
            color: Colors.grey.shade300,
            shape: BoxShape.circle,
          ),
        ),
        currentDay: currentDay,
        onDaySelected: (time1, events) {
          // print('time1: $time1');
          setState(() {
            currentDay = events;
            print(currentDay);

            _selectedEvents.add(events);
          });
        },
      ),
    );
  }
}
