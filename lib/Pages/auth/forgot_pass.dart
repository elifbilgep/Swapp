import 'package:flutter/material.dart';
import 'package:takas/const.dart';

class ForgotPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: darkHeaderColor,
        body: Column(
          children: [
            buildHeader(context),
            buildTextField(context),
            SizedBox(
              height: 25,
            ),
            buildSendMailButton(context)
          ],
        ));
  }

  buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Container(
        height: 180,
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
      ),
    );
  }

  buildTextField(BuildContext context) {
    return Form(
      child: Container(
        width: 380,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0, bottom: 5, top: 20),
              child: Text(
                "E-mail",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            TextFormField(
              autofocus: false,
              cursorColor: Colors.grey.shade800,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 20),
                  filled: true,
                  fillColor: lightColor,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(20),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  buildSendMailButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: Container(
        height: 50,
        width: 300,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 3,
                  blurRadius: 1,
                  offset: Offset(0, 6)
                  // changes position of shadow
                  ),
            ],
            borderRadius: BorderRadius.circular(20),
            color: signAndCreateButtonColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Send Reovery Mail",
                style: Theme.of(context).textTheme.bodyText2)
          ],
        ),
      ),
    );
  }
}
