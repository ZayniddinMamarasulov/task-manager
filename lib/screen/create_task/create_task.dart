import 'package:flutter/material.dart';
import 'package:task_manager/theme/app_colors.dart';

import 'chip_model/my_chips.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({Key? key}) : super(key: key);

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _descController = TextEditingController();

  List<MyTopic> topics = MyTopic.topics;

  List<MyTopic> selectTopics = [];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.bottomCenter,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "assets/images/bg_image.png",
                  ),
                  fit: BoxFit.cover),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.arrow_back_outlined,
                                  size: 25, color: Colors.white)),
                          const Text(
                            "Create a Task",
                            style: TextStyle(
                              fontSize: 20,
                              letterSpacing: 1.2,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.search,
                                  size: 25, color: Colors.white))
                        ],
                      ),
                      const Text(
                        "Name",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "Date",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                      TextFormField(
                        controller: _dateController,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  height: size.height * 0.715,
                  width: size.width,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: const [
                              Text(
                                "Start Time",
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Color(AppColors.greyColor),
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "01:22 pm",
                                style: TextStyle(
                                  fontSize: 32,
                                  color: Color(AppColors.darkColor),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: const [
                              Text(
                                "End Time",
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Color(AppColors.greyColor),
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                "03:20 pm",
                                style: TextStyle(
                                  fontSize: 32,
                                  color: Color(AppColors.darkColor),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 46)
                        ],
                      ),
                      const Divider(
                        color: Colors.black45,
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "Description",
                        style: TextStyle(
                          fontSize: 22,
                          color: Color(AppColors.greyColor),
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: _descController,
                        maxLines: 5,
                        decoration: InputDecoration(
                            filled: true, fillColor: Colors.grey.shade300),
                      ),
                      const SizedBox(height: 16),
                      const Text(
                        "Category",
                        style: TextStyle(
                          fontSize: 22,
                          color: Color(AppColors.greyColor),
                        ),
                      ),
                      const SizedBox(height: 27),
                      Wrap(
                        runSpacing: 12,
                        spacing: 16,
                        children: List.generate(topics.length, (index) {
                          var topic = topics[index];
                          return ChoiceChip(
                            label: SizedBox(
                              height: 30,
                              width: 80,
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
                            selectedColor:
                                const Color(AppColors.bottomGradient),
                            disabledColor: const Color(AppColors.whiteColor),
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
                                // tanlanganlar
                                debugPrint(selectTopics.toString() +
                                    "selected Category");
                              });
                            },
                          );
                        }),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          height: 80,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            gradient: const LinearGradient(
                                colors: [
                                  Color(AppColors.topGradient),
                                  Color(AppColors.bottomGradient)
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter),
                          ),
                          child: const Center(
                            child: Text(
                              "Create Task",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
