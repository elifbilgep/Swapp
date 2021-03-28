import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../const.dart';
import '../../models/user.dart';
import '../../services/authorization.dart';
import 'create_acc.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool loading = false;
  String email, password;
  var errorMessage = "";
  List<UserDetail> allUsers;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: bgGarident),
      child: SafeArea(
        child: Container(
          decoration: BoxDecoration(gradient: bgGarident),
          child: Scaffold(
            key: _scaffoldKey,
            backgroundColor: Colors.transparent,
            body: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: SingleChildScrollView(
                child: Stack(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        buildHeader(context),
                        buildInputs(context),
                        buildSignInButton(context),
                        buildCreateAccButton(context),
                      ],
                    ),
                    _loadingAnimation(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 200,
        width: double.infinity,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome To Swapp",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline1.copyWith(
                    fontSize: 50,
                    color: lightColor,
                    fontWeight: FontWeight.normal),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildInputs(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Container(
            width: 360,
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
                  style: Theme.of(context).textTheme.bodyText2,
                  validator: validatorEmail,
                  keyboardType: TextInputType.emailAddress,
                  autofocus: false,
                  cursorColor: Colors.grey.shade800,
                  decoration: InputDecoration(
                      errorStyle: TextStyle(fontSize: 15, color: Colors.red),
                      contentPadding: EdgeInsets.only(left: 20),
                      filled: true,
                      fillColor: lightColor,
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20),
                      )),
                  onSaved: (inputValue) => email = inputValue,
                ),
              ],
            ),
          ),
          Container(
            width: 360,
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
                  style: Theme.of(context).textTheme.bodyText2, 
                  validator: (inputValue) {
                    return validatorPassword(inputValue);
                  },
                  obscureText: true,
                  autofocus: false,
                  cursorColor: Colors.grey.shade800,
                  decoration: InputDecoration(
                    errorStyle: TextStyle(fontSize: 15, color: Colors.red),
                    contentPadding: EdgeInsets.only(left: 20),
                    filled: true,
                    fillColor: lightColor,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onSaved: (inputValue) => password = inputValue,
                ),
                SizedBox(
                  height: 15,
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

  String validatorEmail(String inputValue) {
    if (inputValue.isEmpty) {
      return "E-mail must be given";
    } else if (!inputValue.contains("@")) {
      return "Give a validate email";
    }
    return null;
  }

  String validatorPassword(String inputValue) {
    if (inputValue.isEmpty) {
      return "Password can not be empty";
    } else if (inputValue.length < 6) {
      return "Password must be longer then 6 characters";
    }
    return null;
  }

  Widget buildSignInButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: GestureDetector(
        onTap: login,
        child: Container(
          height: 50,
          width: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: darkColor2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Sign In",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(color: lightColor))
            ],
          ),
        ),
      ),
    );
  }

  void login() async {
    final _authService = Provider.of<Authorization>(context, listen: false);
    var _formState = _formKey.currentState;
    if (_formState.validate()) {
      _formState.save();
      setState(() {
        loading = true;
      });

      await _authService.signInWithMail(email, password);
    }
  }

  Widget buildCreateAccButton(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.03),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CreateAcc()));
            },
            child: Text(
              "Create Account",
              style: Theme.of(context).textTheme.bodyText2.copyWith(
                  color: lightColor, decoration: TextDecoration.underline),
            ),
          )
        ],
      ),
    );
  }

  Widget _loadingAnimation() {
    if (loading) {
      return Positioned.fill(
          child: Align(
        alignment: Alignment.center,
        child: CircularProgressIndicator(
          backgroundColor: darkHeaderColor,
        ),
      ));
    } else {
      return Center();
    }
  }
}
