import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:task_manager/models/category_task.dart';
import 'package:task_manager/models/task.dart';
import 'package:task_manager/services/database_helper.dart';
import 'package:task_manager/ui/add_task_page/widgets/default_app_bar.dart';
import 'package:task_manager/ui/theme/app_colors.dart';

import 'custom_input_widget.dart';
import 'input_some_info_task_widget.dart';

class CreateTaskPage extends StatefulWidget {
  const CreateTaskPage({Key? key}) : super(key: key);

  @override
  State<CreateTaskPage> createState() => _CreateTaskPageState();
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  DateTime _date = DateTime.now();
  final taskController = TextEditingController();
  final dateController = TextEditingController();
  final startTimeController = TextEditingController();
  final endTimeController = TextEditingController();
  final descriptionController = TextEditingController();

  _saveTask() {
    Task currentTask = Task(
        title: taskController.text,
        description: descriptionController.text,
        date: _date,
        startTime: startTimeController.text,
        endTime: endTimeController.text);

    DatabaseHelper.instance
        .insert(currentTask)
        .whenComplete(() => Navigator.pop(context));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            _pageAppBar(),
            _secondPart(),
          ],
        ),
      ),
    );
  }

  _pageAppBar() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/bg_image.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          const DefaultAppBar(),
          _taskAndDateWidget(),
        ],
      ),
    );
  }

  _taskAndDateWidget() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _inputWidgets(task: 'Title', controller: taskController, func: () {}),
          _inputWidgets(
              task: 'Date',
              controller: dateController,
              func: () {
                _showDatePick(context);
              })
        ],
      ),
    );
  }

  _inputWidgets(
      {required String task,
      required TextEditingController controller,
      required void Function() func}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          task,
          style: const TextStyle(color: Colors.white),
        ),
        TextField(
          onTap: func,
          controller: controller,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
          decoration: const InputDecoration(
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  _secondPart() {
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
        children: [
          _startEndTimes(),
          _descriptionContainer(),
          _taskCategoriesContainer()
        ],
      ),
    );
  }

  _startEndTimes() {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Start time',
                  style: TextStyle(
                    color: Colors.grey.shade400,
                  ),
                ),
                TextField(
                  controller: startTimeController,
                  onTap: () {
                    _showTimePick(startTimeController);
                  },
                ),
              ],
            ),
          ),
          const SizedBox(width: 30),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'End time',
                  style: TextStyle(
                    color: Colors.grey.shade400,
                  ),
                ),
                TextField(
                  controller: endTimeController,
                  onTap: () {
                    _showTimePick(endTimeController);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _descriptionContainer() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Description',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey.shade400,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 150,
            child: TextField(
              controller: descriptionController,
              maxLines: null,
              expands: true,
            ),
          ),
        ],
      ),
    );
  }

  _taskCategoriesContainer() {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Category',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade400,
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 12,
            runSpacing: 8,
            children: List.generate(
              CategoryTask.topics.length,
              (index) {
                var category = CategoryTask.topics[index];
                return ChoiceChip(
                  padding: const EdgeInsets.all(20),
                  selectedColor: AppColors.lightbottomGradient,
                  disabledColor: AppColors.lightNoSelectColor,
                  backgroundColor: AppColors.lightNoSelectColor,
                  labelStyle: TextStyle(
                    color: category.isSelected ? Colors.white : Colors.black,
                  ),
                  label: Text(category.title),
                  selected: category.isSelected,
                  onSelected: (value) {
                    setState(() {
                      category.isSelected = value;
                    });
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 48),
          _createTaskBtn()
        ],
      ),
    );
  }

  _showDatePick(BuildContext context) async {
    final date = await showDatePicker(
        context: context,
        initialDate: _date,
        firstDate: DateTime(2022),
        lastDate: DateTime(2100));

    if (date != _date) {
      setState(() {
        _date = date!;
      });

      dateController.text = DateFormat('dd-MM-yyyy').format(_date);
    }
  }

  _showTimePick(TextEditingController controller) async {
    final startTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay(
        hour: DateTime.now().hour,
        minute: DateTime.now().minute,
      ),
    );

    controller.text = DateFormat('hh:mm').format(DateTime(
        _date.year, _date.month, _date.day, startTime!.hour, startTime.minute));
  }

  _createTaskBtn() {
    return InkWell(
      onTap: () {
        _saveTask();
      },
      child: Container(
          height: 56,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
              colors: [
                AppColors.lightTopGradient,
                AppColors.lightbottomGradient,
              ],
            ),
          ),
          child: const Text(
            'Create Task',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          )),
    );
  }
}
