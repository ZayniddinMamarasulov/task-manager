import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_calendar.dart';
import 'my_tasks_widget.dart';

class TaskCalendarPage extends StatefulWidget {
  const TaskCalendarPage({Key? key}) : super(key: key);

  @override
  _TaskCalendarPageState createState() => _TaskCalendarPageState();
}

class _TaskCalendarPageState extends State<TaskCalendarPage> {
  late var locale;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    locale = Localizations.localeOf(context).toLanguageTag();
    print(locale);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          ColoredBox(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(width: 8),
              ],
            ),
          ),
          CustomCalendar(locale: locale),
          const MyTasksWidget(),
        ],
      ),
    );
  }
}
