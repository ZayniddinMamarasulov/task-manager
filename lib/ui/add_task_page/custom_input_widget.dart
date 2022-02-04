import 'package:flutter/material.dart';
import 'package:task_manager/ui/add_task_page/widgets/custom_text_field.dart';
import 'package:task_manager/ui/add_task_page/widgets/default_app_bar.dart';

class CustomInputWidget extends StatelessWidget {
  const CustomInputWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          CustomTextFields(),
        ],
      ),
    );
  }
}
