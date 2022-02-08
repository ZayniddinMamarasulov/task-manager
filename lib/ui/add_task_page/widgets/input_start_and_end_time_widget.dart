import 'package:flutter/material.dart';

class InputStartAndEndTimeWidget extends StatelessWidget {
  const InputStartAndEndTimeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Start time',
                  style: TextStyle(
                    color: Colors.grey.shade400,
                  ),
                ),
                TextField(),
              ],
            ),
          ),
          const SizedBox(width: 30),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'End time',
                  style: TextStyle(
                    color: Colors.grey.shade400,
                  ),
                ),
                TextField(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
