import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

Widget buttonIcon(context, onTap, asstes) {
  return InkWell(
    onTap: onTap,
    child: SvgPicture.asset(
      asstes,
      color: Theme.of(context).indicatorColor,
      width: 28,
      height: 28,
    ),
  );
}
