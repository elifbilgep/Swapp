import 'package:flutter/material.dart';
import 'package:takas/Pages/message/mesage_detail.dart';
import 'package:takas/const.dart';
import 'package:takas/lists.dart';
import '../home.dart';

class Messages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      decoration: BoxDecoration(color: darkColor2),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(child: buildColumn(context)),
      ),
    ));
  }

  Column buildColumn(
    BuildContext context,
  ) {
    return Column(
      children: [
        buildHeader(context),
        buildPersonCard(context),
      ],
    );
  }

  buildHeader(BuildContext context) {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      color: darkHeaderColor,
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Row(
          children: [
            IconButton(
                icon: Icon(Icons.arrow_back_ios_outlined),
                color: lightColor2,
                onPressed: () => Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()))),
            SizedBox(
              width: 10,
            ),
            Text(
              "Messages",
              style: Theme.of(context).textTheme.headline3,
            ),
          ],
        ),
      ),
    );
  }

  buildPersonCard(
    BuildContext context,
  ) {
    return Container(
      child: Expanded(
        child: ListView.builder(
            itemCount: 5,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 10),
                child: Container(
                    height: 170,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.6),
                                    spreadRadius: 1,
                                    blurRadius: 2,
                                    offset: Offset(0, 3),
                                  )
                                ],
                              ),
                              child: CircleAvatar(
                                  radius: 25,
                                  backgroundImage: NetworkImage(
                                    profilPhotoUrl[index],
                                  )),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Container(
                              width: 100,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    messagesPersons[index],
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .copyWith(fontSize: 16),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    messages[index],
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .copyWith(fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              height: 130,
                              width: 170,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: GestureDetector(
                                        onTap: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    MessageDetail())),
                                        child: Image.network(
                                          clothingPhotos[index],
                                          height: 200,
                                          width: 100,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Divider(
                          color: bgDarkOne,
                          height: 30,
                          indent: 20,
                          endIndent: 20,
                          thickness: 1,
                        )
                      ],
                    )),
              );
            }),
      ),
    );
  }
}
