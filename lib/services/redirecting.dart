import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:takas/Pages/auth/login.dart';
import 'package:takas/Pages/home.dart';
import 'package:takas/const.dart';
import 'package:takas/models/user.dart';
import 'package:takas/services/authorization.dart';

class Redirecting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _authService = Provider.of<Authorization>(context, listen: false);
    return StreamBuilder(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
              body: Center(
                  child: CircularProgressIndicator(
            backgroundColor: darkHeaderColor,
          )));
        }
        else if ( snapshot.hasData) {
          
          UserDetail activeUser = snapshot.data;
          return Home();
        } else {
          return LoginPage();
        }
      },
      stream: _authService.stateFollower,
    );
  }
}

