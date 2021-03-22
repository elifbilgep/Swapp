import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:takas/Pages/auth/profile.dart';
import 'package:takas/Pages/categories.dart';
import 'package:takas/Pages/message/messages.dart';
import 'package:takas/Pages/swapies/add_swapie.dart';
import 'package:takas/Pages/swapies/details.dart';
import 'package:takas/Pages/swapies/search.dart';
import 'package:takas/const.dart';
import 'package:takas/lists.dart';
import 'package:takas/models/swapie.dart';
import 'package:takas/services/authorization.dart';
import 'package:takas/services/firestore_service.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Size size;
  int _activePageNo = 0;
  PageController pageController;

  int indexNum;
  List<Swapie> swapieData;

  @override
  void initState() {
    pageController = PageController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String activeUserIdFromProvider =
        Provider.of<Authorization>(context, listen: false).activeUserId;
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          bottomNavigationBar: bottomNavBar(context),
          resizeToAvoidBottomInset: false,
          backgroundColor: allBgColor,
          body: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: pageController,
            children: [
              buildHomePage(size),
              Categories(),
              AddSwapie(),
              Messages(),
              Profile(
                comingIdFromSearch: activeUserIdFromProvider,
              )
            ],
          )),
    );
  }

  SingleChildScrollView buildHomePage(
    Size size,
  ) {
    String activeUserIdFromProvider =
        Provider.of<Authorization>(context, listen: false).activeUserId;
    return SingleChildScrollView(
      child: Column(
        children: [
          buildHeader(),
          buildSearchBar(size),
          SizedBox(
            height: 25,
          ),
          buildCategories(size, activeUserIdFromProvider),
          SizedBox(
            height: 20,
          ),
          buildWhiteSpace(size),
        ],
      ),
    );
  }

  buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0, top: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Lets Swap!",
              style: Theme.of(context)
                  .textTheme
                  .headline2
                  .copyWith(fontSize: 29, color: lightColor)),
          IconButton(
              icon: Icon(Icons.logout),
              color: lightColor,
              onPressed: () => Authorization().signOut())
        ],
      ),
    );
  }

  buildSearchBar(Size size) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, left: 15, right: 15),
      child: GestureDetector(
        onTap: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => Search())),
        child: Container(
          height: 50,
          width: size.width,
          decoration: BoxDecoration(
              color: lightColor2, borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Row(
              children: [
                Icon(
                  Icons.search,
                  color: lightColor,
                ),
                SizedBox(
                  width: 10,
                ),
                Text("Search")
              ],
            ),
          ),
        ),
      ),
    );
  }

  buildCategories(Size size, activeUserIdFromProvider) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: Container(
        height: 100,
        width: size.width,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            itemBuilder: (BuildContext context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Details(
                                  categoryName: categories[index],
                                  categoryIndex: index,
                                  activeUserId: activeUserIdFromProvider,
                                )));
                  },
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
                          categories[index],
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              .copyWith(fontSize: 16),
                        )
                      ],
                    ),
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
            SizedBox(
              height: 10,
            ),
            buildheader3(),
            SizedBox(
              height: 10,
            ),
            buildMostRecent2()
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
      height: 210,
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
                    height: 200,
                    width: 150,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(30)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.network(
                        mostSeenPhotos[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 155,
                    left: 60,
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

  buildMostRecent2() {
    return Container(
      height: mostRecentPhotos.length / 2 * 500,
      child: FutureBuilder(
        future: FirestoreService().bringAllSwapies(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          swapieData = snapshot.data;

          return buildGridView(swapieData);
        },
      ),
    );
  }

  GridView buildGridView(swapieData) {
    return GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 0.8,
          crossAxisSpacing: 0,
          mainAxisSpacing: 20,
        ),
        itemCount: swapieData.length,
        itemBuilder: (context, index) {
          return Center(
            child: Container(
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(30)),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.network(
                      swapieData[index].swapiePhotoUrl,
                      height: 260,
                      width: 170,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        decoration: BoxDecoration(
                            color: darkColor2,
                            borderRadius: BorderRadius.circular(20)),
                        height: 50,
                        width: 130,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${swapieData[index].price}",
                              style: Theme.of(context).textTheme.headline4,
                            ),
                            Icon(Icons.attach_money)
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  buildheader3() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 20, bottom: 10),
      child: Row(
        children: [
          Text(
            "Most Recent",
            style: TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  bottomNavBar(BuildContext context) {
    return SizedBox(
      height: 70,
      child: Theme(
        data: Theme.of(context).copyWith(canvasColor: lightColor2),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.menu), label: "Categories"),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: "Add Swapie"),
            BottomNavigationBarItem(
                icon: Icon(Icons.message_rounded), label: "Messages"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
          onTap: (choosenPageNo) {
            setState(() {
              _activePageNo = choosenPageNo;
              pageController.jumpToPage(choosenPageNo);
            });
          },
          currentIndex: _activePageNo,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey.shade400,
        ),
      ),
    );
  }
}
