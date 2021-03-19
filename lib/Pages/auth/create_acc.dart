import 'package:flutter/material.dart';

import '../../const.dart';

class CreateAcc extends StatefulWidget {
  @override
  _CreateAccState createState() => _CreateAccState();
}

class _CreateAccState extends State<CreateAcc> {
  List<DropdownMenuItem<String>> menuItems = List();
  var checked = false;
  String value1 = "Country";
  bool disableddropDown = true;

  final turkey = {
    "1": "İzmir",
    "2": "Ankara",
    "3": "İstanbul",
  };
  final america = {
    "1": "Georgia",
    "2": "Hawaii",
    "3": "Minnesota",
  };
  final england = {
    "1": "Bristol",
    "2": "London",
    "3": "Oxford",
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: bgGarident),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                buildHeader(context),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                buildTextFormFields(context),
                buildSignUpButton(context),
                buildGoogle(context),
              ],
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DropdownButton<String>(
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(color: darkColor),
                hint: Text(value1),
                items: [
                  DropdownMenuItem<String>(
                    value: "Turkey",
                    child: Text(
                      "Turkey",
                    ),
                  ),
                  DropdownMenuItem<String>(
                    value: "America",
                    child: Text("America"),
                  ),
                  DropdownMenuItem<String>(
                    value: "England",
                    child: Text("England"),
                  ),
                ],
                onChanged: (_value) {
                  selected(_value);
                },
              ),
              DropdownButton<String>(
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(color: darkColor),
                hint: Text("City"),
                items: menuItems,
                onChanged: disableddropDown
                    ? null
                    : (_value) {
                        setState(() {
                          value1 = _value;
                        });
                      },
                disabledHint: Text("Choose a country"),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: CheckboxListTile(
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
                "I have read all the terms and accept",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(fontSize: 15),
              ),
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

  buildGoogle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Google", style: Theme.of(context).textTheme.bodyText2)
        ],
      ),
    );
  }

  void populateTurkey() {
    for (String key in turkey.keys) {
      menuItems.add(DropdownMenuItem<String>(
        child: Center(
          child: Text(turkey[key]),
        ),
        value: turkey[key],
      ));
    }
  }

  void populateAmerica() {
    for (String key in america.keys) {
      menuItems.add(DropdownMenuItem<String>(
        child: Center(
          child: Text(america[key]),
        ),
        value: america[key],
      ));
    }
  }

  void populateEngland() {
    for (String key in england.keys) {
      menuItems.add(DropdownMenuItem<String>(
        child: Center(
          child: Text(england[key]),
        ),
        value: england[key],
      ));
    }
  }

  void selected(String _value) {
    if (_value == "Turkey") {
      menuItems = [];
      populateTurkey();
    } else if (_value == "America") {
      menuItems = [];
      populateAmerica();
    } else if (_value == "England") {
      menuItems = [];
      populateEngland();
    }
    setState(() {
      value1 = _value;
      disableddropDown = false;
    });
  }
}
