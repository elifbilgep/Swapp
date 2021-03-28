import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Pages/auth/login.dart';
import '../Pages/home.dart';
import '../const.dart';
import '../models/user.dart';
import 'authorization.dart';

class Redirecting extends StatefulWidget {
  @override
  _RedirectingState createState() => _RedirectingState();
}

class _RedirectingState extends State<Redirecting> {
  String _activeUserId;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _activeUserId = Provider.of<Authorization>(context).activeUserId;
    final _authService = Provider.of<Authorization>(context, listen: false);
    return StreamBuilder(
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
              body: Center(
                  child: CircularProgressIndicator(
            backgroundColor: darkHeaderColor,
          )));
        } else if (snapshot.hasData) {
          UserDetail activeUser = snapshot.data;
          _authService.activeUserId = activeUser.id;
          return Home();
        } else {
          return LoginPage();
        }
      },
      stream: _authService.stateFollower,
    );
  }
}
