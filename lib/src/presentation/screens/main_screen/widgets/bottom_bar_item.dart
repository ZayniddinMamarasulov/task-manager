import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'shader_mask.dart';

BottomNavigationBarItem bottomBarIcon(context, String text, String text1) {
  return BottomNavigationBarItem(
    backgroundColor: Theme.of(context).backgroundColor,
    activeIcon: shaderMask(
      SvgPicture.asset(
        text,
        color: Theme.of(context).unselectedWidgetColor,
        width: 40,
      ),
      context,
    ),
    icon: SvgPicture.asset(
      text,
      color: Theme.of(context).unselectedWidgetColor,
      width: 40,
    ),
    label: text1,
  );
}
