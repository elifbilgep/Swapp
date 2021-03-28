import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../const.dart';
import '../../models/user.dart';
import '../../services/authorization.dart';
import '../../services/firestore_service.dart';

class CreateAcc extends StatefulWidget {
  @override
  _CreateAccState createState() => _CreateAccState();
}

class _CreateAccState extends State<CreateAcc> {
  String givenNameAndSurname,
      givenUserName,
      givenEmail,
      givenPassword,
      givenCountry = "",
      givenCity = "";
  String hintCountry = "Country";
  List<DropdownMenuItem<String>> menuItems = List();
  var checked = false;
  String value1 = "";
  String value2 = "City";
  bool disableddropDown = true;
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool loading = false;

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
          key: _scaffoldKey,
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.065,
                    ),
                    buildHeader(context),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    buildTextFormFields(context),
                    buildSignUpButton(context),
                  ],
                ),
                _loadingAnimation()
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
          style: Theme.of(context)
              .textTheme
              .headline1
              .copyWith(fontWeight: FontWeight.w400, fontSize: 35),
        )
      ],
    );
  }

  buildTextFormFields(BuildContext context) {
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
                  padding: const EdgeInsets.only(left: 10.0, bottom: 5),
                  child: Text(
                    "Name Surname",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                TextFormField(
                  style: Theme.of(context).textTheme.bodyText2,
                  validator: validatorNameSurname,
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
                  onSaved: (inputValue) {
                    givenNameAndSurname = inputValue;
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 360,
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
                  style: Theme.of(context).textTheme.bodyText2,
                  validator: validatorUserName,
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
                  onSaved: (inputValue) {
                    givenUserName = inputValue;
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 360,
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
                  style: Theme.of(context).textTheme.bodyText2,
                  keyboardType: TextInputType.emailAddress,
                  validator: validatorEmail,
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
                  onSaved: (inputValue) {
                    givenEmail = inputValue;
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            width: 360,
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
                  style: Theme.of(context).textTheme.bodyText2,
                  validator: validatorPassword,
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
                  onSaved: (inputValue) {
                    givenPassword = inputValue;
                  },
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DropdownButton<String>(
                dropdownColor: lightColor,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(color: bgDarkOne),
                hint: Text(
                  hintCountry,
                  style: TextStyle(color: lightColor, fontSize: 20),
                ),
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
                    .copyWith(color: bgDarkOne),
                hint: Text(
                  value2,
                  style: TextStyle(color: bgDarkOne, fontSize: 20),
                ),
                items: menuItems,
                onChanged: disableddropDown
                    ? null
                    : (_value) {
                        setState(() {
                          value2 = _value;
                        });
                      },
                disabledHint: Text(
                  "City",
                  style: TextStyle(color: lightColor, fontSize: 20),
                ),
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
      child: GestureDetector(
        onTap: _createUserFunction,
        child: Container(
          height: 50,
          width: 300,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), color: darkColor2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Sign Up",
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
      hintCountry = _value;
      value1 = _value;
      disableddropDown = false;
    });
  }

  void _createUserFunction() async {
    givenCountry = value1;
    givenCity = value2;

    final _authService = Provider.of<Authorization>(context, listen: false);
    var _formState = _formKey.currentState;
    if (_formState.validate()) {
      _formState.save();

      print(givenEmail);
      setState(() {
        loading = true;
      });
      try {
        UserDetail user = await _authService.createUserWithMail(
            givenEmail.trim(), givenPassword);
        if (user != null) {
          await FirestoreService().createUser(
              id: user.id,
              email: user.email,
              userName: givenUserName,
              city: givenCity,
              country: givenCountry,
              nameAndLastName: givenNameAndSurname);
        }
        Navigator.pop(context);
      } catch (error) {
        print("Hata:" + error.toString());
      }
    }
  }

  String validatorUserName(String inputValue) {
    if (inputValue.isEmpty) {
      return "Can not be empty";
    } else if (inputValue.length < 6) {
      return "Password must be lnger than 6 characters";
    }
    return null;
  }

  String validatorEmail(String inputValue) {
    if (inputValue.isEmpty) {
      return "E-mail must be given";
    } else if (!inputValue.contains("@")) {
      return "Give a validate email";
    }
    return null;
  }

  String validatorNameSurname(String inputValue) {
    if (inputValue.isEmpty) {
      return "Can not be empty";
    } else if (inputValue.length < 4) {
      return "Name and surname must be longer than 4";
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
