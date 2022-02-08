import 'package:flutter/material.dart';

class InputDescriptionWidget extends StatelessWidget {
  const InputDescriptionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              maxLines: null,
              expands: true,
            ),
          ),
        ],
      ),
    );
  }
}
