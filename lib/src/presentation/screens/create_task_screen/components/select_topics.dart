import 'package:flutter/material.dart';
import 'package:task_manager/screen/create_task/chip_model/my_chips.dart';
import 'package:task_manager/src/presentation/theme/app_colors.dart';

class SelectedTopics extends StatefulWidget {
  const SelectedTopics({Key? key}) : super(key: key);

  @override
  _SelectedTopicsState createState() => _SelectedTopicsState();
}

class _SelectedTopicsState extends State<SelectedTopics> {
  List<MyTopic> topics = MyTopic.topics;

  List<MyTopic> selectTopics = [];
  @override
  Widget build(BuildContext context) {
    return Wrap(
      runSpacing: 12,
      spacing: 16,
      children: List.generate(topics.length, (index) {
        var topic = topics[index];
        return ChoiceChip(
          label: SizedBox(
            height: 30,
            width: 82,
            child: Center(
              child: Text(
                topic.title,
                style: TextStyle(
                  color: topic.isSelected
                      ? Colors.white
                      : Colors.black,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          selectedColor: AppColors.lightTopGradient,
          selected: topic.isSelected,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          padding: const EdgeInsets.symmetric(
              horizontal: 8, vertical: 12),
          pressElevation: 0,
          onSelected: (bool newValue) {
            setState(() {
              topic.isSelected = !topic.isSelected;
              if (topic.isSelected) {
                selectTopics.add(topic);
              } else {
                selectTopics.remove(topic);
              }
              debugPrint(selectTopics.toString() +
                  "selected Category");
            });
          },
        );
      }),
    );
  }
}
