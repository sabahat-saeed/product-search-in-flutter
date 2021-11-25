import 'package:flutter/material.dart';

Row basicHeading(String text, int temp, var screenWidth) {
  return Row(children: [
    Container(
      padding: new EdgeInsets.symmetric(horizontal: 30),
      width: screenWidth,
      child: Align(
        alignment: Alignment.topRight,
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 22,
            color: Color(0xFFC41A3B),
          ),
        ),
      ),
    ),
  ]);
}

Row homeHeading(String text, int temp, var screenWidth) {
  return Row(children: [
    Container(
      padding: new EdgeInsets.symmetric(horizontal: 30),
      width: screenWidth / 2.2,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 15,
            color: Color(0xFFC41A3B),
          ),
        ),
      ),
    ),
  ]);
}

Row homeFullHeading(String text, int temp, var screenWidth) {
  return Row(children: [
    Container(
      padding: new EdgeInsets.symmetric(horizontal: 30),
      width: screenWidth / 1.5,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 15,
            color: Color(0xFFC41A3B),
          ),
        ),
      ),
    ),
  ]);
}

Divider homeMainDivider(var screenWidth) {
  return Divider(
    height: 5,
    thickness: 2,
    color: Colors.black,
    indent: 100,
    endIndent: screenWidth - (screenWidth - 100),
  );
}

Divider basicDivider1(var screenWidth) {
  return Divider(
    height: 5,
    thickness: 2,
    color: Colors.black,
    indent: (screenWidth / 1.6),
    endIndent: 30,
  );
}

Divider basicDivider2(var screenWidth) {
  return Divider(
    height: 4,
    thickness: 2,
    color: Colors.black,
    indent: (screenWidth / 1.4),
    endIndent: 30,
  );
}

Divider homeDivider1(var screenWidth) {
  return Divider(
    height: 5,
    thickness: 2,
    color: Colors.black,
    indent: 30,
    endIndent: screenWidth - (screenWidth / 4),
  );
}

Divider homeDivider2(var screenWidth) {
  return Divider(
    height: 4,
    thickness: 2,
    color: Colors.black,
    indent: 30,
    endIndent: (screenWidth - (screenWidth / 4.5)),
  );
}

Padding paddingVerticle(var val) {
  return Padding(
    padding: new EdgeInsets.symmetric(vertical: val),
  );
}
