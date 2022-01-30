import 'package:flutter/material.dart';

class TaskCalenderScreen extends StatefulWidget {
  TaskCalenderScreen({Key? key}) : super(key: key);

  @override
  State<TaskCalenderScreen> createState() => _TaskCalenderScreenState();
}

class _TaskCalenderScreenState extends State<TaskCalenderScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'TaskCalenderScreen',
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }
}
