import 'package:flutter/material.dart';
import 'package:task_manager/ui/add_task_page/widgets/category_tasks.dart';
import 'package:task_manager/ui/add_task_page/widgets/input_description_widget.dart';
import 'widgets/input_start_and_end_time_widget.dart';

class InputSomeInfoTaskWidget extends StatelessWidget {
  const InputSomeInfoTaskWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 280),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(22),
          topRight: Radius.circular(22),
        ),
      ),
      child: ListView(
        children: const [
          InputStartAndEndTimeWidget(),
          InputDescriptionWidget(),
          CategoryTasksWidget(),
        ],
      ),
    );
  }
}
