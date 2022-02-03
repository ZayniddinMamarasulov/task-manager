import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_manager/src/presentation/screens/create_task_screen/components/select_topics.dart';
import 'package:task_manager/src/presentation/theme/app_colors.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({Key? key}) : super(key: key);

  @override
  _CreateTaskScreenState createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  final TextEditingController _descController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.deepPurple,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(24.0),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image:  AssetImage("assets/images/bg_image.png"),
                fit: BoxFit.cover,
              )),
              height: MediaQuery.of(context).size.height / 3.2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          )),
                      const Text(
                        "Create a Task",
                        style: TextStyle(fontSize: 18.0, color: Colors.black),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.search, color: Colors.white))
                    ],
                  ),
                  const SizedBox(
                    height: 18.0,
                  ),
                  const Text("Name"),
                  TextFormField(
                    decoration: InputDecoration(),
                  ),
                  const SizedBox(height: 18.0),
                  const Text("Data"),
                  TextFormField(
                    decoration: InputDecoration(fillColor: Colors.white),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(24.0),
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(14.0),
                      topLeft: Radius.circular(14.0))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 18.0,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("startTime"),
                          SizedBox(
                            height: 56,
                            width: 150,
                            child: TextFormField(
                              style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.bold),
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("endTime"),
                          SizedBox(
                            height: 56,
                            width: 150,
                            child: TextFormField(
                              style: TextStyle(fontSize: 22.0,fontWeight: FontWeight.bold),
                              decoration:
                                  InputDecoration(border: InputBorder.none),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 1,
                  ),
                  SizedBox(height: 16.0),
                  Text("Description"),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _descController,
                    maxLines: 7,
                    decoration: InputDecoration(
                        isCollapsed: true,
                        filled: true,
                        fillColor: Colors.grey.shade100),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text("Category"),
                  ),
                  SelectedTopics(),
                  SizedBox(height: 18.0),
                  createButton()
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
Widget createButton() {
  return InkWell(
    onTap: () {},
    child: Container(
      height: 66,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        gradient: const LinearGradient(colors: [
          Color(0xFF9C2CF3),
          Color(0xFF3A49F9),
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
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
  );
}
