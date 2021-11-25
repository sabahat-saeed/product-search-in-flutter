import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../pages/home/home.dart';
import '../pages/news/news.dart';
import '../pages/contact/quote.dart';

Align bottombarNav(BuildContext context, int bottomBarIndex) {
  return Align(
    alignment: Alignment.bottomCenter,
    child: Container(
      color: Colors.transparent,
      padding: EdgeInsets.fromLTRB(60.0, 0.0, 50.0, 25.0),
      height: 70,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(30.0),
          ),
          color: Colors.white,
          border: Border.all(color: Colors.black),
          boxShadow: [
            BoxShadow(
              color: Colors.black26.withOpacity(0.1),
              spreadRadius: 4,
              blurRadius: 2,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: new Theme(
          data: Theme.of(context).copyWith(
              canvasColor: Colors.transparent,
              backgroundColor: Colors.transparent,
              primaryColor: Colors.red,
              textTheme: Theme.of(context)
                  .textTheme
                  .copyWith(caption: new TextStyle(color: Colors.yellow))),
          child: new BottomNavigationBar(
            elevation: 0.0,
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 1,
            unselectedFontSize: 1,
            unselectedItemColor: Colors.black,
            selectedItemColor: Colors.pink[700],
            currentIndex:
                bottomBarIndex >= 0 && bottomBarIndex <= 3 ? bottomBarIndex : 0,
            onTap: (currentIndex) {
              if (currentIndex == 0) {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    Home.routname, (Route<dynamic> route) => false);
              } else if (currentIndex == 1) {
                Navigator.of(context).pushNamed(News.routname);
              } else if (currentIndex == 2) {
                Navigator.of(context).pushNamed(Quote.routname);
              }
            },
            items: [
              new BottomNavigationBarItem(
                icon: Container(
                  child: Icon(CupertinoIcons.home,
                      size: 24.0,
                      color: bottomBarIndex == 0
                          ? Colors.pink[700]
                          : Colors.black),
                ),
                label: "",
              ),
              new BottomNavigationBarItem(
                icon: Container(
                  child: Icon(CupertinoIcons.bell,
                      size: 24.0,
                      color: bottomBarIndex == 1
                          ? Colors.pink[700]
                          : Colors.black),
                ),
                label: "",
              ),
              new BottomNavigationBarItem(
                icon: Container(
                  child: Icon(CupertinoIcons.quote_bubble,
                      size: 24.0,
                      color: bottomBarIndex == 2
                          ? Colors.pink[700]
                          : Colors.black),
                ),
                label: "",
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
