import 'package:flutter/material.dart';
import 'package:takas/const.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: allBgColor,
        body: Center(
          child: Stack(
            fit: StackFit.expand,
            children: [
              Column(
                children: [
                  buildHeader(context),
                  buildUserPhotoAndInfo(context),
                  buildButtons(context)
                ],
              ),
              buildBottomNavBar(context),
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
            Icon(
              Icons.arrow_back_ios,
              color: lightColor,
            ),
            Text(
              "Profile",
              style: Theme.of(context).textTheme.headline3,
            ),
          ],
        ),
      ),
    );
  }

  buildUserPhotoAndInfo(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Container(
              decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                BoxShadow(color: Colors.grey.shade900, blurRadius: 5)
              ]),
              child: CircleAvatar(
                radius: 50.0,
                backgroundImage: NetworkImage(
                    "https://i.pinimg.com/564x/51/98/18/519818ac43ff0f69a0a968da5d5465e4.jpg"),
              ),
            ),
          ),
          Text(
            "Tuğba Yılmaz",
            style: Theme.of(context)
                .textTheme
                .headline1
                .copyWith(fontSize: 22, color: lightColor),
          ),
          SizedBox(
            height: 3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on_outlined,
                color: darkHeaderColor,
                size: 30,
              ),
              Text("Gebze",
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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            height: 50,
            width: 350,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade900, blurRadius: 3, spreadRadius: 0.5)
            ], color: buttonColor, borderRadius: BorderRadius.circular(10)),
            child: Center(child: Text("Show my Swapies")),
          ),
          Container(
            height: 50,
            width: 350,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade900, blurRadius: 3, spreadRadius: 0.5)
            ], color: buttonColor, borderRadius: BorderRadius.circular(10)),
            child: Center(child: Text("Last Swapies")),
          ),
          Container(
            height: 50,
            width: 350,
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade900, blurRadius: 3, spreadRadius: 0.5)
            ], color: buttonColor, borderRadius: BorderRadius.circular(10)),
            child: Center(child: Text("Account Settings")),
          ),
        ],
      ),
    );
  }
}
