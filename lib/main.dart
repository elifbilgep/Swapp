import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'const.dart';
import 'services/authorization.dart';
import 'services/redirecting.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<Authorization>(
      create: (_) => Authorization(),
      child: MaterialApp(
        theme: ThemeData(
          accentColor: Colors.grey,
          primarySwatch: Colors.grey,
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
                fontSize: 35, fontFamily: "Comfortaa", color: lightColor),
            headline4: TextStyle(
                fontSize: 22, fontFamily: "Comfortaa", color: darkHeaderColor),
            headline5: TextStyle(
                fontSize: 20, fontFamily: "Comfortaa", color: lightTextColor),
            headline6: TextStyle(
                fontSize: 16, fontFamily: "Comfortaa", color: darkHeaderColor),
            bodyText1: TextStyle(
                fontSize: 16, fontFamily: "Comfortaa", color: lightColor),
            bodyText2: TextStyle(
                fontSize: 20, fontFamily: "Comfortaa", color: bgDarkOne),
          ),
        ),
        debugShowCheckedModeBanner: false,
        title: 'Projem',
        home: Redirecting(),
      ),
    );
  }
}
