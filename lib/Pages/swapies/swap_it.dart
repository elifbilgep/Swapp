import 'package:flutter/material.dart';
import 'package:takas/const.dart';

class SwapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: allBgColor,
        body: Stack(
          children: [
            Column(
              children: [
                buildHeader(context),
                buildCard(context),
                buildCard(context),
              ],
            ),
            buildBottomNavBar(context),
            buildSwapButton(context),
          ],
        ),
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
              "Swap it!",
              style: Theme.of(context).textTheme.headline3,
            ),
          ],
        ),
      ),
    );
  }

  buildCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, left: 15, right: 15),
      child: Container(
        height: 250,
        width: 450,
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
                      "https://images.gardrops.com/uploads/2351209/user_items/23512097-s4-file-6031053d52ea3.jpeg",
                      fit: BoxFit.cover,
                      height: 150,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Column(
                    children: [
                      Container(
                        height: 150,
                        width: 240,
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
                                  "Books",
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
                                  "200-300",
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
                              color: darkHeaderColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w100))
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
      top: MediaQuery.of(context).size.height / 2.1,
      left: MediaQuery.of(context).size.height / 4,
      child: Container(
        height: 60,
        width: 60,
        decoration: BoxDecoration(color: lightColor2, shape: BoxShape.circle),
        child: Center(
          child: Icon(
            Icons.swap_vert,
            size: 35,
            color: lightColor,
          ),
        ),
      ),
    );
  }
}
