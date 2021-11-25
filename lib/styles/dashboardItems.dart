import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

ClipRRect dashboardItems(var leftMargin, var icon, var title, var screenWidth,
    var link, var context) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(10),
    child: Center(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed(link);
        },
        child: Container(
          margin: new EdgeInsets.fromLTRB(leftMargin, 0, 0, 0),
          height: 95,
          width: (screenWidth - 85) / 3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.grey.withOpacity(0.9),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              //SvgPicture.asset(icon_shopping),
              icon == Icons.delivery_dining
                  ? ImageIcon(
                      AssetImage("assets/order_icon.png"),
                      size: 60,
                    )
                  : Icon(
                      icon,
                      size: 40.0,
                    ),

              icon == Icons.delivery_dining
                  ? SizedBox(
                      height: 0,
                    )
                  : SizedBox(
                      height: 18,
                    ),
              Text(
                title,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFFC41A3B)),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
