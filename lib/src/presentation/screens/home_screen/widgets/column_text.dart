import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'custom_text.dart';

Widget columnText(context, text1, text2) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      customText(context, text1, Theme.of(context).textTheme.bodyText1),
      customText(context, text2, Theme.of(context).textTheme.bodyText2),
    ],
  );
}
