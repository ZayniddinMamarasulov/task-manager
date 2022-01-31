import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget customText(context, text, theme) {
  return Text(
    text, //"Hello Rohan!",
    style: GoogleFonts.poppins(textStyle: theme),
  );
}
