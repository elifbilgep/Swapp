import 'package:flutter/material.dart';
import 'package:takas/Pages/message/messages.dart';
import 'package:takas/const.dart';

import 'Pages/auth/acc_settings.dart';
import 'Pages/swapies/add_swapie.dart';
import 'Pages/categories.dart';
import 'Pages/auth/create_acc.dart';
import 'Pages/message/details.dart';
import 'Pages/auth/forgot_pass.dart';
import 'Pages/auth/forgot_pass2.dart';
import 'Pages/home.dart';
import 'Pages/auth/login.dart';
import 'Pages/message/mesage_detail.dart';
import 'Pages/swapies/mySwapies.dart';
import 'Pages/auth/profile.dart';
import 'Pages/swapies/swap_it.dart';
import 'Pages/swapies/swapped_swapies.dart';

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
          headline6: TextStyle(
              fontSize: 16, fontFamily: "Comfortaa", color: darkHeaderColor),
          bodyText1: TextStyle(
              fontSize: 16, fontFamily: "Comfortaa", color: lightTextColor),
          bodyText2: TextStyle(
              fontSize: 20, fontFamily: "Comfortaa", color: lightTextColor),
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Projem',
      home: AccountSettings(),
    );
  }
}
