import 'package:flutter/material.dart';
import 'package:takas/Pages/message/messages.dart';
import 'package:takas/Pages/swapies/swap_it.dart';
import 'package:takas/const.dart';
import 'package:takas/lists.dart';
import 'package:takas/models/swapie.dart';
import 'package:takas/services/firestore_service.dart';

class Details extends StatefulWidget {
  final String categoryName;
  final int categoryIndex;

  final String activeUserId;
  const Details(
      {Key key, this.categoryName, this.categoryIndex, this.activeUserId})
      : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  List numbers = [0, 1, 2, 3, 4, 5];
  List<Swapie> allSwapies = [];
  List<Swapie> onlyThatCategory = [];

  @override
  void initState() {
    super.initState();

    bringAllSwapies();
    bringOnlyCategoryItems();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(color: midColor),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: FutureBuilder(
            future: FirestoreService().bringUser(widget.activeUserId),
            builder: (context, snapshot) {
              if (onlyThatCategory.isEmpty) {
                return Center(
                  child: Column(
                    children: [
                      buildHeader(context),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.35,
                      ),
                      Text("No Swappie avaiable"),
                    ],
                  ),
                );
              }

              return buildColumn(context, snapshot.data, widget.activeUserId);
            },
          ),
        ),
      ),
    );
  }

  Widget buildColumn(BuildContext context, _profileOwner, activeUserId) {
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(
              height: 100,
            ),
            buildCards(context, _profileOwner, activeUserId)
          ],
        ),
        buildHeader(context),
      ],
    );
  }

  bringAllSwapies() async {
    List<Swapie> swapies = await FirestoreService().bringAllSwapies();

    setState(() {
      allSwapies = swapies;
      bringOnlyCategoryItems();
    });
  }

  bringOnlyCategoryItems() {
    for (var i in allSwapies) {
      if (i.category == widget.categoryName) {
        onlyThatCategory.add(i);
      } else {
        print("Allah");
      }
    }
  }

  buildHeader(BuildContext context) {
    return Positioned(
      left: 0,
      top: 0,
      child: Container(
        color: darkHeaderColor,
        height: 100,
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                widget.categoryName,
                style: Theme.of(context).textTheme.headline3,
              ),
            )
          ],
        ),
      ),
    );
  }

  buildCards(BuildContext context, _profileOwner, profileUserId) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: Container(
          child: ListView.builder(
            itemCount: onlyThatCategory.length,
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
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SwapPage())),
                        child: Container(
                          height: 160,
                          width: 130,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              onlyThatCategory[index].swapiePhotoUrl,
                              fit: BoxFit.cover,
                            ),
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
                                  onlyThatCategory[index].price.toString(),
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
