import 'package:flutter/material.dart';
import 'package:task_manager/models/task.dart';

class TaskTypeList extends StatefulWidget {
  TaskTypeList({Key? key}) : super(key: key);

  @override
  State<TaskTypeList> createState() => _TaskTypeListState();
}

class _TaskTypeListState extends State<TaskTypeList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 60,
          child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.only(
                      left: 10, right: 10, top: 5, bottom: 5),
                  height: 50,
                  width: (MediaQuery.of(context).size.width /
                      TaskTypeItems.values.length),
                  child: TextButton(
                    style: ButtonStyle(
                        elevation: MaterialStateProperty.all(2),
                        backgroundColor: MaterialStateProperty.all(
                          Theme.of(context).cardColor,
                        ),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ))),
                    onPressed: () {},
                    child: Text(
                      index == 0
                          ? "My Task"
                          : index == 1
                              ? "In-progress"
                              : "Completed",
                    ),
                  ),
                );
              },
              itemCount: TaskTypeItems.values.length)),
    );
  }
}
