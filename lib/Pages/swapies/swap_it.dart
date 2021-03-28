import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../const.dart';
import '../../models/swapie.dart';
import '../../models/user.dart';
import '../../services/authorization.dart';
import '../../services/firestore_service.dart';
import '../message/mesage_detail.dart';

class SwapPage extends StatefulWidget {
  @override
  _SwapPageState createState() => _SwapPageState();
}

class _SwapPageState extends State<SwapPage> {
  String activeUserId;
  List<Swapie> swapies;
  String choosenUrl;
  var clicked = "";
  int selectedItemIndex;
  UserDetail owner;
  @override
  Widget build(BuildContext context) {
    activeUserId = Provider.of<Authorization>(context).activeUserId;
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(color: midColor),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: FutureBuilder(
            future: FirestoreService().bringUserSwapies(activeUserId),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              }
              swapies = snapshot.data;
              return buildStack(context);
            },
          ),
        ),
      ),
    );
  }

  Stack buildStack(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            buildHeader(context),
            buildCard1(context),
            SizedBox(
              height: 25,
            ),
            buildCard2(context),
          ],
        ),
        buildSwapButton(context),
      ],
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
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: lightColor,
              ),
            ),
            SizedBox(width: 10),
            Text(
              "Swap it!",
              style: Theme.of(context).textTheme.headline3,
            ),
          ],
        ),
      ),
    );
  }

  buildCard1(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, left: 10, right: 10),
      child: Container(
        height: 280,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: lightColor,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/swapp-77137.appspot.com/o/pictures%2Fswappies%2Fswappie_525fad8c-4f47-49d2-8398-6b5ced2949bf.jpg?alt=media&token=c0908133-cba4-4082-bc41-1b3c4489f14c",
                      height: 160,
                      width: 130,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Column(
                    children: [
                      Container(
                        height: 150,
                        width: 170,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Tshirt",
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                                Icon(Icons.more_vert)
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.checkroom,
                                  color: darkHeaderColor,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Clothing",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(color: darkHeaderColor),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.attach_money,
                                  color: darkHeaderColor,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "50",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(color: darkHeaderColor),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  color: darkHeaderColor,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Muğla",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(color: darkHeaderColor),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  height: 70,
                  width: 270,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "About:",
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      Text("I have wear it only 2 times",
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                              color: bgDarkOne,
                              fontSize: 16,
                              fontWeight: FontWeight.w400))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  buildCard2(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, left: 10, right: 10),
      child: Container(
        height: 280,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: lightColor,
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: GestureDetector(
                      onTap: () {
                        return buildShowDialog();
                      },
                      child: Image.network(
                        clicked == ""
                            ? "https://i.pinimg.com/564x/61/62/5b/61625b91c47e4a58d0b1d338a8fd0596.jpg"
                            : clicked,
                        fit: BoxFit.cover,
                        height: 160,
                        width: 130,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Column(
                    children: [
                      Container(
                        height: 150,
                        width: 200,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  selectedItemIndex == null
                                      ? "..."
                                      : swapies[selectedItemIndex].name,
                                  style: Theme.of(context).textTheme.headline4,
                                ),
                                Icon(Icons.more_vert)
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.checkroom,
                                  color: darkHeaderColor,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  selectedItemIndex == null
                                      ? "..."
                                      : swapies[selectedItemIndex].category,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(color: darkHeaderColor),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.attach_money,
                                  color: darkHeaderColor,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  selectedItemIndex == null
                                      ? "..."
                                      : swapies[selectedItemIndex]
                                          .price
                                          .toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(color: darkHeaderColor),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on_outlined,
                                  color: darkHeaderColor,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                selectedItemIndex == null
                                    ? Text("...")
                                    : FutureBuilder(
                                        future: FirestoreService()
                                            .bringUser(activeUserId),
                                        builder: (context, snapshot) {
                                          owner = snapshot.data;
                                          return Text(
                                            owner.city,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1
                                                .copyWith(
                                                    color: darkHeaderColor),
                                          );
                                        })
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  height: 70,
                  width: 270,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "About:",
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      selectedItemIndex == null
                          ? Text("...")
                          : Text(swapies[selectedItemIndex].about,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .copyWith(
                                      color: bgDarkOne,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  buildSwapButton(context) {
    return Positioned(
      top: MediaQuery.of(context).size.height / 2.15,
      left: MediaQuery.of(context).size.height / 4.5,
      child: GestureDetector(
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => MessageDetail())),
        child: Container(
          height: 85,
          width: 85,
          decoration: BoxDecoration(color: darkColor, shape: BoxShape.circle),
          child: Center(
            child: Icon(
              Icons.swap_vert,
              size: 50,
              color: lightColor,
            ),
          ),
        ),
      ),
    );
  }

  buildShowDialog() {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Pick to Swap',
            style: Theme.of(context).textTheme.headline4,
          ),
          content: Container(
              height: 200,
              width: 250,
              child: ListView.builder(
                itemCount: swapies.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedItemIndex = index;
                            clicked = swapies[index].swapiePhotoUrl;
                          });
                          Navigator.pop(context);
                        },
                        child: Image.network(
                          swapies[index].swapiePhotoUrl,
                          height: 200,
                          width: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              )),
          actions: <Widget>[
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
        );
      },
    );
  }
}
