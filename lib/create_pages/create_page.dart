import 'package:flutter/material.dart';

class CreatePage extends StatefulWidget {
  static const String id="create_page";
  const CreatePage({Key? key}) : super(key: key);

  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        elevation: 0,
      ),
      body: Container(),
    );
  }
}
