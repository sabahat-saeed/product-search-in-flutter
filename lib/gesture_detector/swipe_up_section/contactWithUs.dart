import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';
import 'package:maps_launcher/maps_launcher.dart';
import '../../styles/styles.dart';

AnimatedPositioned contactWithUs(showBottomAddress, height) {
  return AnimatedPositioned(
    curve: Curves.easeInOut,
    duration: Duration(milliseconds: 200),
    left: 10,
    bottom: (showBottomAddress) ? -40 : -(height / 2.6),
    child: ContactWithUsWidget(),
  );
}

class ContactWithUsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    Container address() {
      return new Container(
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(10.0),
        //decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: Row(
          children: [
            Container(
              width: width / 4.5,
              child: Text(
                "Address:",
                style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 2.0,
                  color: Colors.pink[700],
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Container(
              width: ((width / 6) * 5) - 100,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: TextButton(
                  //color: Colors.transparent,
                  onPressed: () {
                    customLaunchMap(
                        '9931 Franklin Ave Suite 1-A Franklin Park, IL 60131, USA');
                  },
                  child: Text(
                    "9931 Franklin Ave Suite 1-A Franklin Park, IL 60131, USA",
                    style: TextStyle(
                      fontSize: 15,
                      letterSpacing: 2.2,
                      color: Colors.pink[700],
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Container email() {
      return new Container(
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(10.0),
        //decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: Row(
          children: [
            Container(
              width: width / 4.5,
              child: Text(
                "Email:",
                style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 2.5,
                  color: Colors.pink[700],
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              width: ((width / 6) * 5) - 100,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: TextButton(
                  //color: Colors.transparent,
                  onPressed: () {
                    customLaunch(
                        'mailto: info@printingcircle.com?subject=&body=');
                  },
                  child: Text(
                    "info@printingcircle.com",
                    style: TextStyle(
                      fontSize: 15,
                      letterSpacing: 2.2,
                      color: Colors.pink[700],
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Container phone() {
      return new Container(
        margin: const EdgeInsets.all(10.0),
        padding: const EdgeInsets.all(10.0),
        //decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: Row(
          children: [
            Container(
              width: width / 5.5,
              //color: Colors.purple,
              child: Text(
                "Phone:",
                style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 2.5,
                  color: Colors.pink[700],
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              width: ((width / 6) * 5) - 95,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                child: TextButton(
                  //color: Colors.transparent,
                  onPressed: () {
                    customLaunch('tel: +1 847-737-1777');
                  },
                  child: Text(
                    "+1 847-737-1777",
                    style: TextStyle(
                      fontSize: 15,
                      letterSpacing: 2.2,
                      color: Colors.pink[700],
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    Center officeTime() {
      return Center(
        child: new Container(
          margin: const EdgeInsets.all(10.0),
          padding: const EdgeInsets.all(10.0),
          decoration:
              BoxDecoration(border: Border.all(color: Colors.pink[700])),
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                child: Text(
                  "Printing Circle Operating Hours",
                  style: TextStyle(
                    fontSize: 16,
                    letterSpacing: 2.5,
                    color: Colors.pink[700],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Divider(
                height: 30,
                thickness: 0.7,
                color: Colors.pink[700],
                indent: 100,
                endIndent: 100,
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text(
                    "Monday - Friday",
                    style: TextStyle(
                      fontSize: 15,
                      letterSpacing: 2.2,
                      color: Colors.pink[700],
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                  child: Text(
                    "8:00AM - 7:00PM CST",
                    style: TextStyle(
                      fontSize: 15,
                      letterSpacing: 2.2,
                      color: Colors.pink[700],
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

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
        height: height / 2 + 58,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
          child: Column(
            children: <Widget>[
              Icon(
                Icons.keyboard_arrow_up,
                size: 25,
                color: Colors.pink[700],
              ),
              Text(
                "Get in Touch",
                style: TextStyle(
                  fontSize: 18,
                  letterSpacing: 3.0,
                  color: Colors.pink[700],
                  fontWeight: FontWeight.normal,
                ),
              ),
              Divider(
                height: 30,
                thickness: 2,
                color: Colors.pink[700],
                indent: 150,
                endIndent: 150,
              ),
              Container(
                height: height / 2.5,
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      address(),
                      Divider(
                        height: 10,
                        thickness: 1,
                        color: Colors.pink[700],
                        indent: 30,
                        endIndent: 30,
                      ),
                      email(),
                      Divider(
                        height: 10,
                        thickness: 1,
                        color: Colors.pink[700],
                        indent: 30,
                        endIndent: 30,
                      ),
                      phone(),
                      officeTime(),
                      paddingVerticle(35.0),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void customLaunch(command) async {
  if (await canLaunch(command)) {
    await launch(command);
  }
}

void customLaunchMap(command) async {
  if (await MapsLauncher.launchQuery(command)) {
    await MapsLauncher.launchQuery(command);
  }
}
