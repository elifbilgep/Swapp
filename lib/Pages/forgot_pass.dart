import 'package:flutter/material.dart';
import 'package:takas/const.dart';

class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: darkHeaderColor,
        body: Column(
          children: [buildHeader(context)],
        ));
  }

  buildHeader(BuildContext context) {
    return Container( 
      height: 200,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: lightColor,
              ),
              onPressed: null),
          Text(
            "Forgot My Password",
            style: Theme.of(context).textTheme.headline2,
          ),
        ],
      ),
    );
  }
}
