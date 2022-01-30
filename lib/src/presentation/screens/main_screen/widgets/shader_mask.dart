import 'package:flutter/material.dart';

shaderMask(icon, context) {
  return ShaderMask(
    shaderCallback: (Rect bounds) {
      return RadialGradient(
        center: Alignment.topLeft,
        radius: 0.5,
        colors: <Color>[
          Theme.of(context).primaryColorLight,
          Theme.of(context).primaryColorDark,
        ],
        tileMode: TileMode.repeated,
      ).createShader(bounds);
    },
    child: icon,
  );
}
