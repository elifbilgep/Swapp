import 'package:flutter/material.dart';
import 'package:takas/const.dart';
import 'package:takas/lists.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Size size;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: allBgColor,
        body: Stack(
          fit: StackFit.expand,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  buildHeader(),
                  buildSearchBar(size),
                  SizedBox(
                    height: 25,
                  ),
                  buildCategories(size),
                  SizedBox(
                    height: 20,
                  ),
                  buildWhiteSpace(size),
                ],
              ),
            ),
            buildBottomNavBar(size),
          ],
        ),
      ),
    );
  }

  Widget buildBottomNavBar(Size size) {
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

  buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, top: 20),
      child: Row(
        children: [
          Text("Lets Swap!",
              style: Theme.of(context)
                  .textTheme
                  .headline2
                  .copyWith(fontSize: 26, color: lightColor))
        ],
      ),
    );
  }

  buildSearchBar(Size size) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, left: 15, right: 15),
      child: Container(
        height: 50,
        width: size.width,
        child: Form(
          child: TextFormField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(0),
              prefixIcon: Icon(
                Icons.search,
                size: 30,
                color: Color(0xFF53536b),
              ),
              filled: true,
              fillColor: lightColor2,
              hintText: "Start",
              hintStyle: TextStyle(color: lightColor, fontSize: 20),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  buildCategories(Size size) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: Container(
        height: 100,
        width: size.width,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: cateogires.length,
            itemBuilder: (BuildContext context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                      gradient: categoriesGradient,
                      borderRadius: BorderRadius.circular(30)),
                  width: 110,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        icons[index],
                        size: 35,
                        color: allBgColor,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        cateogires[index],
                        style: Theme.of(context)
                            .textTheme
                            .headline4
                            .copyWith(fontSize: 16),
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }

  buildHeader2() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 20),
      child: Row(
        children: [
          Text(
            "Most Seen",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  buildWhiteSpace(Size size) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Container(
        height: 3000,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            buildLine(),
            buildHeader2(),
            buildMostSeenCategories(),
            buildheader3(),
            buildMostRecentCategories()
          ],
        ),
      ),
    );
  }

  buildLine() {
    return Divider(
      color: darkColor,
      height: 5,
      thickness: 4,
      indent: 150,
      endIndent: 150,
    );
  }

  buildMostSeenCategories() {
    return Container(
      height: 180,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: mostSeenPhotos.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 15),
              child: Stack(
                overflow: Overflow.visible,
                children: [
                  Container(
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(30)),
                    height: 150,
                    width: 250,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.network(
                        mostSeenPhotos[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 120,
                    left: 160,
                    child: Container(
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: darkColor2),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.remove_red_eye,
                            color: darkHeaderColor,
                          ),
                          Text(
                            mostSeenWatches[index].toString(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                .copyWith(color: darkHeaderColor),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }

  buildMostRecentCategories() {
    return Container(
      height: 1000,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: mostRecentPhotos.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 15.0, top: 15, right: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    overflow: Overflow.visible,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30)),
                        height: 300,
                        width: 400,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Image.network(
                            mostRecentPhotos[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: 270,
                        left: 280,
                        child: Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: darkColor2),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.remove_red_eye,
                                color: darkHeaderColor,
                              ),
                              Text(
                                mostRecentWatches[index].toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    .copyWith(color: darkHeaderColor),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }

  buildheader3() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 20),
      child: Row(
        children: [
          Text(
            "Most Recent",
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
