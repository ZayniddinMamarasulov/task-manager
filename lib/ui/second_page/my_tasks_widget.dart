import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:task_manager/models/task.dart';
import 'package:task_manager/services/database_helper.dart';
import 'package:task_manager/ui/add_task_page/create_task_page.dart';
import 'package:task_manager/ui/components/task_item.dart';
import 'package:task_manager/ui/theme/app_colors.dart';

class MyTasksWidget extends StatefulWidget {
  const MyTasksWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<MyTasksWidget> createState() => _MyTasksWidgetState();
}

class _MyTasksWidgetState extends State<MyTasksWidget> {
  late Future<List<Task>> tasks;

  _updateTasks() {
    setState(() {
      tasks = DatabaseHelper.instance.getTaskList();
    });
  }

  @override
  void initState() {
    super.initState();
    _updateTasks();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 36),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Tasks',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600),
                  ),
                  InkWell(
                    onTap: () => Navigator.of(context)
                        .push(MaterialPageRoute(
                            builder: (context) => CreateTaskPage()))
                        .whenComplete(() => _updateTasks()),
                    child: Container(
                        height: 48,
                        width: 110,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32),
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomRight,
                            colors: [
                              AppColors.lightbottomGradient,
                              AppColors.lightTopGradient,
                            ],
                          ),
                        ),
                        child: const Text(
                          '+  Add Task',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        )),
                  ),
                ],
              ),
            ),
            Expanded(
              child: FutureBuilder(
                  future: tasks,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.data.length == 0) {
                      return const Center(child: Text("no data"));
                    }
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          final task = snapshot.data[index];
                          return TaskItem(task: task);
                        });
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
