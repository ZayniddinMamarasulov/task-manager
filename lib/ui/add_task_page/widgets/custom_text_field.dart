import 'package:flutter/material.dart';

class CustomTextFields extends StatelessWidget {
  CustomTextFields({Key? key}) : super(key: key);

  final taskController = TextEditingController();
  final dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _CustomField(task: 'Task', controller: taskController),
          _CustomField(task: 'Date', controller: dateController),
        ],
      ),
    );
  }
}

class _CustomField extends StatelessWidget {
  final String task;
  final TextEditingController controller;
  const _CustomField({
    Key? key,
    required this.task,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          task,
          style: const TextStyle(color: Colors.white),
        ),
        TextField(
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
}
