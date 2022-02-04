import 'package:flutter/material.dart';

import 'custom_input_widget.dart';
import 'input_some_info_task_widget.dart';

class CreateTaskPage extends StatelessWidget {
  const CreateTaskPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: const [
            CustomInputWidget(),
            InputSomeInfoTaskWidget(),
          ],
        ),
      ),
    );
  }
}
