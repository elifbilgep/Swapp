import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../const.dart';
import '../../models/swapie.dart';
import '../../services/authorization.dart';

class MessageDetail extends StatefulWidget {
  @override
  _MessageDetailState createState() => _MessageDetailState();
}

class _MessageDetailState extends State<MessageDetail> {
  List<Swapie> userSwapie;
  String clickedId;
  List<Swapie> userSwapie2;
  var clicked = "";
  var selectedItem;
  @override
  Widget build(BuildContext context) {
    String activeUserId = Provider.of<Authorization>(context).activeUserId;
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(color: midColor),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: buildStack(context, userSwapie, activeUserId),
        ),
      ),
    );
  }

  Stack buildStack(BuildContext context, userSwapie, activeUserId) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Column(
          children: [
            buildHeader(context, userSwapie, activeUserId),
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
    );
  }

  buildHeader(BuildContext context, userSwapie, activeUserId) {
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
              color: lightColor,
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
              color: lightColor,
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
                    color: Colors.grey.withOpacity(0.6),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  )
                ]),
                child: CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(
                    "https://ath2.unileverservices.com/wp-content/uploads/sites/4/2020/02/IG-annvmariv-1024x1016.jpg",
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
                width: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Center(
                      child: Text(
                        "So will yo be at the mall at 9 am?",
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
                width: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Center(
                      child: Text(
                        "Yes",
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
                    color: Colors.grey.withOpacity(0.6),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  )
                ]),
                child: CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(
                    "https://st.depositphotos.com/1008939/1880/i/600/depositphotos_18807295-stock-photo-portrait-of-handsome-man.jpg",
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Container(
                decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.6),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: Offset(0, 3),
                  )
                ]),
                child: CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(
                    "https://ath2.unileverservices.com/wp-content/uploads/sites/4/2020/02/IG-annvmariv-1024x1016.jpg",
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
                width: 210,
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
        ],
      ),
    );
  }

  showDialogg(activeUserId, List<Swapie> userSwapie) {
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
                itemCount: userSwapie.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                          setState(() {
                            clicked = userSwapie[index].swapiePhotoUrl;
                          });
                        },
                        child: Image.network(
                          userSwapie[index].swapiePhotoUrl,
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
