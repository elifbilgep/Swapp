import 'package:flutter/material.dart';
import 'package:takas/const.dart';
import 'package:takas/lists.dart';

class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: allBgColor,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children: [buildHeader(context), buildCards(context)],
          ),
          buildBottomNavBar(context),
        ],
      ),
    );
  }

  buildHeader(BuildContext context) {
    return Container(
      color: darkHeaderColor,
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              "Clothing",
              style: Theme.of(context).textTheme.headline3,
            ),
          )
        ],
      ),
    );
  }

  buildCards(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: Container(
          child: ListView.builder(
            itemCount: clothing.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Container(
                  height: 200,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: lightColor),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 160,
                        width: 130,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            clothing[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("T-shirt",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline1
                                    .copyWith(
                                        color: darkHeaderColor, fontSize: 23)),
                            Row(
                              children: [
                                Icon(Icons.checkroom),
                                Text(
                                  "Clothing",
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
                                  Icons.attach_money,
                                  color: Colors.green,
                                ),
                                Text(
                                  clothingPrices[index],
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(color: darkHeaderColor),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.location_on),
                                Text(
                                  clothingCities[index],
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(color: darkHeaderColor),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  buildBottomNavBar(context) {
    var size = MediaQuery.of(context).size;
    return Positioned(
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.shade900,
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
}
