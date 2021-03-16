import 'package:flutter/material.dart';
import 'package:takas/const.dart';

class ResetPassword2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: darkHeaderColor,
          image: DecorationImage(
              image: AssetImage("assets/images/resetPassword.png"))),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            buildHeader(context),
          ],
        ),
      ),
    );
  }

  buildHeader(BuildContext context) {
    return Container(
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Forgot My Password",
            style: Theme.of(context).textTheme.headline2,
          ),
        ],
      ),
    );
  }
}
