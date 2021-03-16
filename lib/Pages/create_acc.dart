import 'package:flutter/material.dart';

import '../const.dart';

class CreateAcc extends StatefulWidget {
  @override
  _CreateAccState createState() => _CreateAccState();
}

class _CreateAccState extends State<CreateAcc> {
  var checked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: bgGarident),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  buildHeader(context),
                  SizedBox(
                    height: 30,
                  ),
                  buildTextFormFields(context),
                  buildSignUpButton(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildHeader(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Welcome to Swap",
          style: Theme.of(context).textTheme.headline1,
        )
      ],
    );
  }

  buildTextFormFields(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Container(
            width: 380,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, bottom: 5),
                  child: Text(
                    "Name Surname",
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
          SizedBox(
            height: 20,
          ),
          Container(
            width: 380,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, bottom: 5),
                  child: Text(
                    "User Name",
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
          SizedBox(
            height: 20,
          ),
          Container(
            width: 380,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, bottom: 5),
                  child: Text(
                    "E-Mail",
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
          SizedBox(
            height: 20,
          ),
          Container(
            width: 380,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, bottom: 5),
                  child: Text(
                    "Password",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                TextFormField(
                  obscureText: true,
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
          SizedBox(
            height: 25,
          ),
          CheckboxListTile(
            contentPadding: EdgeInsets.all(0),
            controlAffinity: ListTileControlAffinity.leading,
            checkColor: darkHeaderColor,
            activeColor: lightColor,
            value: checked,
            onChanged: (newValue) {
              setState(() {
                checked = newValue;
              });
            },
            title: Text(
              "I have readed all the terms and accept",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          )
        ],
      ),
    );
  }

  buildSignUpButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
        height: 50,
        width: 300,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: signAndCreateButtonColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Sign Up", style: Theme.of(context).textTheme.bodyText2)
          ],
        ),
      ),
    );
  }
}
