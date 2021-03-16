import 'package:flutter/material.dart';
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
        backgroundColor: Color(0xFF1f1f29),
        body: Stack(
          fit: StackFit.expand,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  buildHeader(),
                  buildSearchBar(size),
                  buildCategories(size),
                  buildWhiteSpace(size),
                  buildHeader2(),
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
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade400,
                spreadRadius: 1,
                blurRadius: 10,
                offset: Offset(0, 3),
              )
            ],
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey.shade300),
        height: size.height * 0.1,
        width: size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.home),
            Icon(Icons.menu_outlined),
            Icon(Icons.publish),
            Icon(Icons.message),
            Icon(Icons.person)
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
          Text(
            "Start to Swap!",
            style: TextStyle(
                fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  buildSearchBar(Size size) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, left: 15, right: 15),
      child: Container(
        height: 80,
        width: size.width,
        child: Form(
          child: TextFormField(
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                size: 30,
                color: Color(0xFF53536b),
              ),
              filled: true,
              fillColor: Color(0xff33334f),
              hintText: "Search",
              hintStyle: TextStyle(color: Color(0xFF53536b), fontSize: 20),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff33334f)),
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
        height: 80,
        width: size.width,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: cateogires.length,
            itemBuilder: (BuildContext context, index) {
              return Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                      gradient: gradient,
                      borderRadius: BorderRadius.circular(20)),
                  width: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(icons[index], size: 35),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        cateogires[index],
                        style: TextStyle(color: Colors.grey.shade300),
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
            "Best Swapers",
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
        height: size.height * 3,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: Column(
          children: [
            buildHeader2(),
            buildBestSwapers(),
          ],
        ),
      ),
    );
  }

  buildBestSwapers() {
    return Column();
  }
}
