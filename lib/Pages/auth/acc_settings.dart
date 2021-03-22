import 'package:flutter/material.dart';
import 'package:takas/Pages/auth/reset_password.dart';
import 'package:takas/const.dart';
import 'package:takas/models/user.dart';

class ProfileSettings extends StatelessWidget {
  final UserDetail profile;

  const ProfileSettings({Key key, this.profile}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: allBgColor,
        body: Center(
          child: ListView(
            children: [
              buildHeader(context),
              buildUserPhotoAndInfo(context),
              buildButtons(context),
            ],
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
            IconButton(
              icon: Icon(Icons.arrow_back_ios),
              color: lightColor,
              onPressed: () => Navigator.pop(context),
            ),
            Text(
              "Profile Settings",
              style: Theme.of(context).textTheme.headline3,
            ),
          ],
        ),
      ),
    );
  }

  buildUserPhotoAndInfo(BuildContext context) {
    return Container(
      height: 250,
      width: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Container(
              decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                BoxShadow(color: Colors.grey.shade900, blurRadius: 5)
              ]),
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 50.0,
                    backgroundImage: NetworkImage(profile.photoUrl),
                  ),
                  Container(
                    height: 35,
                    width: 35,
                    child: Icon(
                      Icons.add_a_photo_sharp,
                      size: 20,
                      color: lightColor,
                    ),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: lightColor2),
                  )
                ],
              ),
            ),
          ),
          Text(
            profile.nameLastName,
            style: Theme.of(context)
                .textTheme
                .headline1
                .copyWith(fontSize: 22, color: lightColor),
          ),
          Text(
            profile.userName,
            style: Theme.of(context)
                .textTheme
                .headline1
                .copyWith(fontSize: 22, color: lightColor),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on_outlined,
                color: darkHeaderColor,
                size: 30,
              ),
              Text("${profile.country}, ${profile.city}",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(fontSize: 17))
            ],
          )
        ],
      ),
    );
  }

  Widget buildBottomNavBar(context) {
    Size size = MediaQuery.of(context).size;
    return Positioned(
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.shade800,
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 3),
          )
        ], borderRadius: BorderRadius.circular(20), color: lightColor2),
        height: size.height * 0.1,
        width: size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.home,
              size: 25,
              color: lightColor,
            ),
            Icon(
              Icons.menu_outlined,
              size: 25,
              color: lightColor,
            ),
            Icon(
              Icons.add,
              size: 50,
              color: lightColor,
            ),
            Icon(
              Icons.messenger_sharp,
              size: 20,
              color: lightColor,
            ),
            Icon(
              Icons.person,
              size: 25,
              color: lightColor,
            )
          ],
        ),
      ),
      left: 15,
      bottom: 10,
      right: 15,
    );
  }

  buildButtons(BuildContext context) {
    return Container(
      height: 200,
      width: 350,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => ResetPassword())),
            child: Container(
              height: 50,
              width: 350,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade900,
                    blurRadius: 3,
                    spreadRadius: 0.5)
              ], color: buttonColor, borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: Text(
                "Change Password",
                style: Theme.of(context).textTheme.bodyText1,
              )),
            ),
          ),
          GestureDetector(
            onTap: () => showEmailDialog(context),
            child: Container(
              height: 50,
              width: 350,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade900,
                    blurRadius: 3,
                    spreadRadius: 0.5)
              ], color: buttonColor, borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: Text(
                "Change E-mail",
                style: Theme.of(context).textTheme.bodyText1,
              )),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> showEmailDialog(context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return Theme(
          data: ThemeData(primaryColor: darkColor),
          child: AlertDialog(
            title: Text(
              'Change Account E-Mail',
              style: Theme.of(context).textTheme.headline6,
            ),
            content: SingleChildScrollView(
              child: Form(
                child: ListBody(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(prefixIcon: Icon(Icons.mail)),
                    )
                  ],
                ),
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: (null),
                child: Text(
                  'Save',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              TextButton(
                child: Text(
                  'Cancel',
                  style: Theme.of(context).textTheme.headline6,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
