import 'package:flutter/material.dart';

import '../../const.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: bgGarident),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  buildHeader(context),
                  buildPicture(),
                  buildInputs(context),
                  buildSignInButton(context),
                  buildGoogleButton(context),
                  buildCreateAccButton(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Welcome To Swapp",
              style: Theme.of(context).textTheme.headline2,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Login to start swapping your items",
              style: Theme.of(context).textTheme.headline5,
            )
          ],
        ),
      ),
    );
  }

  Widget buildPicture() {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Container(
        width: 230,
        child: Placeholder(
          fallbackHeight: 150,
          color: lightColor,
        ),
      ),
    );
  }

  Widget buildInputs(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Container(
            width: 380,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, bottom: 5, top: 20),
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
          Container(
            width: 380,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, bottom: 5, top: 20),
                  child: Text(
                    "Password",
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
                    ),
                  ),
                ),
                SizedBox(
                  height: 3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Forgot my password",
                        style: Theme.of(context).textTheme.bodyText1.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline)),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSignInButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: Container(
        height: 50,
        width: 300,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: signAndCreateButtonColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Sign In", style: Theme.of(context).textTheme.bodyText2)
          ],
        ),
      ),
    );
  }

  Widget buildCreateAccButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Create Account",
            style: Theme.of(context)
                .textTheme
                .bodyText2
                .copyWith(decoration: TextDecoration.underline),
          )
        ],
      ),
    );
  }

  buildGoogleButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Goog  le", style: Theme.of(context).textTheme.bodyText2)
        ],
      ),
    );
  }
}
