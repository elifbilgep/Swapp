import 'package:flutter/material.dart';
import 'package:takas/const.dart';

class ResetPassword2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: darkHeaderColor,
          image: DecorationImage(image: AssetImage("assets/images/aa.png"))),
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              children: [buildHeader(context), buildText(context)],
            ),
          ),
        ),
      ),
    );
  }

  buildHeader(BuildContext context) {
    return Container(
      height: 100,
      color: darkHeaderColor,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: Row(
          children: [
            Icon(
              Icons.arrow_back_ios,
              color: lightColor,
            ),
            SizedBox(width: 10),
            Text(
              "Forgot Password",
              style: Theme.of(context).textTheme.headline2,
            ),
          ],
        ),
      ),
    );
  }

  buildText(context) {
    return Container(
        height: MediaQuery.of(context).size.height - 200,
        width: MediaQuery.of(context).size.width - 50,
        child: Center(
          child: Text(
            "Please check your mail box.",
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(letterSpacing: 0.5),
            textAlign: TextAlign.center,
          ),
        ));
  }
}
