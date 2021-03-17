import 'package:flutter/material.dart';
import 'package:takas/const.dart';

import 'Pages/categories.dart';
import 'Pages/create_acc.dart';
import 'Pages/details.dart';
import 'Pages/forgot_pass.dart';
import 'Pages/forgot_pass2.dart';
import 'Pages/home.dart';
import 'Pages/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        accentColor: Colors.grey,
        accentColorBrightness: Brightness.light,
        textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 30,
              fontFamily: "Comfortaa",
              color: Color(0xFFFEFEFE),
              fontWeight: FontWeight.bold),
          headline2: TextStyle(
              fontSize: 26, fontFamily: "Comfortaa", color: lightTextColor),
          headline3: TextStyle(
              fontSize: 35, fontFamily: "Comfortaa", color: lightTextColor),
          headline4: TextStyle(
              fontSize: 22, fontFamily: "Comfortaa", color: darkHeaderColor),
          headline5: TextStyle(
              fontSize: 20, fontFamily: "Comfortaa", color: lightTextColor),
          bodyText1: TextStyle(
              fontSize: 16, fontFamily: "Comfortaa", color: lightTextColor),
          bodyText2: TextStyle(
              fontSize: 20, fontFamily: "Comfortaa", color: lightTextColor),
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Projem',
      home: Home(),
    );
  }
}
