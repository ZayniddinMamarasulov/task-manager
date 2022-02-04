import 'package:flutter/material.dart';
import 'package:task_manager/models/category_task.dart';
import 'package:task_manager/ui/theme/app_colors.dart';

class CategoryTasksWidget extends StatefulWidget {
  const CategoryTasksWidget({Key? key}) : super(key: key);

  @override
  State<CategoryTasksWidget> createState() => _CategoryTasksWidgetState();
}

class _CategoryTasksWidgetState extends State<CategoryTasksWidget> {
  @override
  Widget build(BuildContext context) {
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
          InkWell(
            onTap: () {},
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
          ),
        ],
      ),
    );
  }
}
