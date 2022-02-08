import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:task_manager/models/task.dart';
import 'package:task_manager/services/database_helper.dart';
import 'package:task_manager/ui/add_task_page/create_task_page.dart';
import 'package:task_manager/ui/task_detail/task_details_page.dart';
import 'package:task_manager/ui/theme/app_colors.dart';

class TaskItem extends StatefulWidget {
  final Task task;

  const TaskItem({Key? key, required this.task}) : super(key: key);

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: 100,
        width: double.infinity,
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.only(left: 16, right: 4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => TaskDetailsPage(task: widget.task)));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 48,
                    width: 48,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomRight,
                        colors: [
                          AppColors.lightbottomGradient,
                          AppColors.lightTopGradient,
                        ],
                      ),
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/ic_calendar.svg',
                      height: 25,
                      width: 30,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.task.title!,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        DateFormat('dd-MM-yyyy').format(widget.task.date!),
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              PopupMenuButton(
                enabled: true,
                icon: const Icon(Icons.more_vert),
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      enabled: true,
                      value: 'edit',
                      child: Text('Edit'),
                    ),
                    PopupMenuItem(
                      enabled: true,
                      value: 'delete',
                      child: Text('Delete'),
                    )
                  ];
                },
                onSelected: (String value) {
                  setState(() {
                    if (value == 'edit') {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              CreateTaskPage(task: widget.task)));
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text("Deleting task !"),
                              content: Text("Are you sure to delete this task"),
                              actions: [
                                TextButton(
                                    child: const Text(("No")),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    }),
                                TextButton(
                                    child: const Text(("Yes")),
                                    onPressed: () {
                                      DatabaseHelper.instance
                                          .delete(widget.task.id!);
                                      Navigator.pop(context);
                                    }),
                              ],
                            );
                          });
                    }
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
