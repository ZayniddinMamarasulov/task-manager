import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_manager/models/task.dart';
import 'package:task_manager/ui/home_page/widgets/card_project_list.dart';
import 'package:task_manager/ui/home_page/widgets/column_text.dart';
import 'package:task_manager/ui/home_page/widgets/custom_app_bar.dart';
import 'package:task_manager/ui/home_page/widgets/task_type_list.dart';
import 'package:task_manager/ui/theme/app_colors.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
    );
  }
}

class ProgressTasks extends StatelessWidget {
  const ProgressTasks({Key? key}) : super(key: key);

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
          ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: Task.tasks.length,
              itemBuilder: (context, index) {
                final task = Task.tasks[index];
                return Container(
                  height: 100,
                  width: double.infinity,
                  margin: const EdgeInsets.only(top: 20),
                  padding: const EdgeInsets.only(left: 16, right: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
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
                                task.title,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                task.date,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.more_vert,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }
}
