import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../pages/search/search.dart';

PreferredSize headerNav(BuildContext context, title, screenWidth) {
  return PreferredSize(
    preferredSize: Size.fromHeight(40.0),
    child: AppBar(
      automaticallyImplyLeading: false, // Don't show the leading button
      title: Row(
        //mainAxisAlignment: MainAxisAlignment.start,
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(CupertinoIcons.left_chevron, color: Colors.white),
          ),
          Container(
            //color: Colors.black,
            width: screenWidth / 1.6,
            alignment: Alignment.center,
            padding: new EdgeInsets.only(left: 10),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 20,
                letterSpacing: 2.0,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          // Your widgets here
        ],
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            CupertinoIcons.search,
            color: Colors.white,
            size: 26,
          ),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Search(title: ""),
              ),
            );
          },
        ),
      ],
      backgroundColor: Colors.pink[700],
      centerTitle: true,
    ),
  );
}
