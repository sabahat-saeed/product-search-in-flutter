import 'dart:ui';
import 'package:pinch_zoom_image_last/pinch_zoom_image_last.dart';
import 'package:flutter/material.dart';

String _title;
String _image;
AnimatedPositioned category(showBottom, screenHeight, title, image) {
  _title = title;
  _image = image;
  return AnimatedPositioned(
    curve: Curves.easeInOut,
    duration: Duration(milliseconds: 200),
    left: 10,
    bottom: (showBottom) ? -40 : -(screenHeight / 3.2),
    child: ContactWithUsWidget(),
  );
}

class ContactWithUsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(20)),
      child: Container(
        //color: Colors.black,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          image: DecorationImage(
            image: AssetImage("assets/pattern5.png"),
            colorFilter: new ColorFilter.mode(
                Colors.grey[200].withOpacity(0.04), BlendMode.dstATop),
            repeat: ImageRepeat.repeat,
            fit: BoxFit.none,
          ),
        ),
        width: width - 10,
        height: height / 3 + 78,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
          child: Column(
            children: <Widget>[
              Icon(
                Icons.keyboard_arrow_up,
                size: 30,
                color: Colors.black,
              ),
              categoryslide(context, width, height, _title, _image),
            ],
          ),
        ),
      ),
    );
  }
}

Column categoryslide(context, screenWidth, screenHeight, title, image) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: <Widget>[
      Container(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        width: screenWidth - 10,
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.black,
              letterSpacing: 1.5,
              fontWeight: FontWeight.w500,
              fontSize: 18),
        ),
      ),
      PinchZoomImage(
        image: Image.network(
          image,
          filterQuality: FilterQuality.none,
        ),
        zoomedBackgroundColor: Color.fromRGBO(240, 240, 240, 1.0),
      ),
    ],
  );
}
