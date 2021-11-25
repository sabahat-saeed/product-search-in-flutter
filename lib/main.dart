import 'package:flutter/material.dart';
import 'providers/searchProviders.dart';
import 'pages/search/search.dart';
import 'pages/search/speach.dart';

import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProductsSearchProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.pink,
          primarySwatch: Colors.pink,
        ),
        initialRoute: Search.routname,
        routes: <String, WidgetBuilder>{
          Search.routname: (contaxt) => Search(title: ""),
          Speach.routname: (contaxt) => Speach(),
        },
      ),
    );
  }
}
