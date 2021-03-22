import 'package:flutter/material.dart';
import 'package:takas/const.dart';
import 'package:takas/lists.dart';

class MessageDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: allBgColor,
        body: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              children: [
                buildHeader(context),
                Container(
                  height: 400,
                  child: ListView(
                    children: [
                      buildMessage(context),
                    ],
                  ),
                )
              ],
            ),
            buildMessageBox(context),
          ],
        ),
      ),
    );
  }

  buildHeader(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: darkHeaderColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          )),
      height: 250,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(right: 30.0, top: 20, left: 10),
        child: Column(
          children: [
            Padding(
              padding:
                  EdgeInsets.only(right: MediaQuery.of(context).size.width / 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back_ios),
                    color: lightColor,
                  ),
                  Text(
                    "elifbilge.p",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        "https://firebasestorage.googleapis.com/v0/b/swapp-77137.appspot.com/o/pictures%2Fswappies%2Fswappie_525fad8c-4f47-49d2-8398-6b5ced2949bf.jpg?alt=media&token=c0908133-cba4-4082-bc41-1b3c4489f14c",
                        fit: BoxFit.cover,
                        height: 200,
                        width: 120,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.swap_horiz,
                    color: lightColor,
                    size: 40,
                  ),
                  Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        "https://images.gardrops.com/uploads/134640/user_items/134640400-s1-iphone-product-595b89361554c.png",
                        fit: BoxFit.cover,
                        height: 200,
                        width: 120,
                      ),
                    ),
                  )
                ],
              ),
              height: 150,
              width: 300,
            ),
          ],
        ),
      ),
    );
  }

  buildMessageBox(BuildContext context) {
    return Positioned(
      left: 0,
      bottom: 0,
      right: 0,
      child: Container(
        height: 80,
        width: MediaQuery.of(context).size.width,
        color: darkColor,
        child: Row(
          children: [
            SizedBox(
              width: 5,
            ),
            Icon(
              Icons.camera_alt,
              color: darkHeaderColor,
              size: 35,
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              height: 50,
              width: 290,
              child: TextFormField(
                cursorColor: darkHeaderColor,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20)),
                    filled: true,
                    fillColor: lightColor),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Icon(
              Icons.send,
              size: 35,
              color: darkHeaderColor,
            )
          ],
        ),
      ),
    );
  }

  buildMessage(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, top: 10),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.6),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  )
                ]),
                child: CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(
                    "https://lh3.googleusercontent.com/a-/AOh14GhpbgwD1KDwKIt0LpmxYi96KlEob210iFw7RO2JjCg=s96-c",
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: lightColor),
                alignment: Alignment.topLeft,
                height: 45,
                width: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Center(
                      child: Text(
                        "I will meet you there",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: lightColor),
                alignment: Alignment.topLeft,
                height: 45,
                width: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Center(
                      child: Text(
                        "I will meet you there",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.6),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  )
                ]),
                child: CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(
                    "https://lh3.googleusercontent.com/a-/AOh14GhpbgwD1KDwKIt0LpmxYi96KlEob210iFw7RO2JjCg=s96-c",
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              )
            ],
          ),
        ],
      ),
    );
  }
}
