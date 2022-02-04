import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomCalendar extends StatefulWidget {
  final locale;

  const CustomCalendar({Key? key, required this.locale}) : super(key: key);

  @override
  State<CustomCalendar> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends State<CustomCalendar> {
  var _calendarFormat = CalendarFormat.week;
  var focusedDay = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: Color(0xff05000000),
            offset: Offset(0, -7),
            blurRadius: 23,
          ),
          BoxShadow(
            color: Color(0xff26725CC1),
            offset: Offset(0, 4),
            blurRadius: 44,
          ),
        ],
      ),
      child: TableCalendar(
        // calendarBuilders: CalendarBuilders(
        //   selectedBuilder: (context, date, events) {
        //     print(date);
        //     setState(() {
        //       focusedDay = date;
        //     });
        //     return Container(
        //         margin: const EdgeInsets.all(4.0),
        //         alignment: Alignment.center,
        //         decoration: BoxDecoration(
        //             color: Theme.of(context).primaryColor,
        //             borderRadius: BorderRadius.circular(10.0)),
        //         child: Text(
        //           date.day.toString(),
        //           style: TextStyle(color: Colors.deepPurple),
        //         ));
        //   },
        //   todayBuilder: (context, date, events) => Container(
        //       margin: const EdgeInsets.all(4.0),
        //       alignment: Alignment.center,
        //       decoration: BoxDecoration(
        //           color: Colors.grey.shade300,
        //           borderRadius: BorderRadius.circular(10.0)),
        //       child: Text(
        //         date.day.toString(),
        //         style: TextStyle(color: Colors.deepPurple),
        //       )),
        // ),
        // headerVisible: false,
        headerStyle: const HeaderStyle(
          formatButtonVisible: false,
          titleTextStyle: TextStyle(fontSize: 28),
          // rightChevronVisible: false,
          // leftChevronVisible: false,
        ),
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: focusedDay,
        startingDayOfWeek: StartingDayOfWeek.monday,
        calendarFormat: _calendarFormat,
        formatAnimationCurve: Curves.easeInOut,
        formatAnimationDuration: const Duration(milliseconds: 300),
        pageAnimationCurve: Curves.easeInOut,
        pageAnimationDuration: const Duration(milliseconds: 500),
        pageAnimationEnabled: false,
        locale: widget.locale,
        onFormatChanged: (format) {
          setState(() {
            _calendarFormat = format;
          });
        },
        calendarStyle: CalendarStyle(
          todayTextStyle: const TextStyle(color: Colors.deepPurple),
          selectedTextStyle: const TextStyle(color: Colors.deepPurple),
          selectedDecoration: BoxDecoration(
            color: Colors.grey.shade300,
            shape: BoxShape.circle,
          ),
          todayDecoration: BoxDecoration(
            color: Colors.grey.shade300,
            shape: BoxShape.circle,
          ),

          /*canEventMarkersOverflow: true,
          todayColor: Colors.orange,
          selectedColor: Theme.of(context).primaryColor,
          todayStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
            color: Colors.white,
          ),*/
        ),
        onDaySelected: (time1, events) {
          // print('time1: $time1');
          // print('time2: $events');
          setState(() {
            focusedDay = events;
          });
        },
      ),
    );
  }
}
