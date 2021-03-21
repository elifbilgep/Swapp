import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:takas/Pages/auth/profile.dart';
import 'package:takas/Pages/categories.dart';
import 'package:takas/Pages/message/messages.dart';
import 'package:takas/Pages/swapies/add_swapie.dart';
import 'package:takas/const.dart';
import 'package:takas/lists.dart';
import 'package:takas/services/authorization.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Size size;
  int _activePageNo = 0;
  PageController pageController;

  @override
  void initState() {
    // TODO: implement initState
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
                profileUserId: activeUserIdFromProvider,
              )
            ],
          )),
    );
  }

  SingleChildScrollView buildHomePage(Size size) {
    return SingleChildScrollView(
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
                  .copyWith(fontSize: 26, color: lightColor)),
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
            itemCount: categories.length,
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
                        categories[index],
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
      child: Expanded(
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
              buildheader3(),
              buildMostRecent2()
            ],
          ),
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
      child: GridView.builder(
          scrollDirection: Axis.vertical,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            childAspectRatio: 0.75,
            crossAxisSpacing: 0,
            mainAxisSpacing: 20,
          ),
          itemCount: mostRecentPhotos.length,
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
                        mostRecentPhotos[index],
                        height: 250,
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
                                "${clothingPrices[index]}",
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
          }),
    );
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
