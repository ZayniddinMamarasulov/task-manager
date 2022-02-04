import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'custom_text.dart';

Widget columnText(context, text1, text2) {
  return Padding(
    padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 4),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // customText(
        Text(
          text1,
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w600,
          ),
        ),
        // customText(context, text2, Theme.of(context).textTheme.bodyText2),
        Text(text2, style: Theme.of(context).textTheme.bodyText2),
      ],
    ),
  );
}
