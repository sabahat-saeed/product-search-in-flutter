import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class TextFieldStyles {
  static TextStyle body() {
    return GoogleFonts.roboto(
        textStyle: TextStyle(
      color: Colors.black,
      fontSize: 18.0,
    ));
  }

  static TextStyle suggestion() {
    return GoogleFonts.roboto(
        textStyle: TextStyle(
      color: Colors.black87,
      fontSize: 18.0,
    ));
  }
}
