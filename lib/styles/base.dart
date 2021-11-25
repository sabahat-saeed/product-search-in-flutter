import 'textfieldstyles.dart';
import 'package:flutter/material.dart';

abstract class BaseStyles {
  static double borderRadius() {
    return 5.0;
  }

  static double borderWidth() {
    return 2.0;
  }

  static TextStyle text() {
    return TextFieldStyles.body();
  }

  static TextStyle placeholder() {
    return TextFieldStyles.suggestion();
  }

  static Color cursorColor() {
    return Colors.blueAccent;
  }

  static Widget iconPrefix(IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Icon(
        icon,
        size: 26.0,
        color: Colors.blue[400],
      ),
    );
  }
}
