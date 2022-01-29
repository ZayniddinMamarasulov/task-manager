import 'package:flutter/material.dart';
import 'package:task_manager/screens/home_page.dart';

void main(){
  runApp(
    Material()
  );
}

class Material extends StatefulWidget {
  const Material({Key? key}) : super(key: key);

  @override
  _MaterialState createState() => _MaterialState();
}

class _MaterialState extends State<Material> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
