import 'package:flutter/material.dart';
import 'package:task_manager/models/task.dart';
import 'package:task_manager/services/database_helper.dart';
import 'package:task_manager/ui/components/task_item.dart';
import 'package:task_manager/ui/home_page/widgets/card_project_list.dart';
import 'package:task_manager/ui/home_page/widgets/column_text.dart';
import 'package:task_manager/ui/home_page/widgets/custom_app_bar.dart';
import 'package:task_manager/ui/home_page/widgets/task_type_list.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Column(
          children: [
            const CustomAppBar(),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  columnText(context, "Hello Rohan!", "Have a nice day."),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  TaskTypeList(),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  const CardProjectList(),
                  const ProgressTasks(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProgressTasks extends StatefulWidget {
  const ProgressTasks({Key? key}) : super(key: key);

  @override
  State<ProgressTasks> createState() => _ProgressTasksState();
}

class _ProgressTasksState extends State<ProgressTasks> {
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 48),
            child: Text(
              'Progress',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
          ),
          FutureBuilder(
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
        ],
      ),
    );
  }
}
