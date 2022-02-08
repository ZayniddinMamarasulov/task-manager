import 'package:flutter/material.dart';

import 'incon_buttons.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(left: 20.0, right: 20.0, top: 20, bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          buttonIcon(context, () {}, "assets/icons/ic_burger.svg"),
          buttonIcon(context, () {}, "assets/icons/ic_account_avatar.svg"),
        ],
      ),
    );
  }
}
