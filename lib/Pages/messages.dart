import 'package:flutter/material.dart';
import 'package:takas/const.dart';

class Messages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: allBgColor,
        body: Stack(
          children: [
            Center(
              child: Column(
                children: [buildHeader(context), buildPersonCard(context)],
              ),
            ),
            buildBottomNavBar(context),
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
      width: MediaQuery.of(context).size.width,
      color: darkHeaderColor,
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: Row(
          children: [
            Icon(
              Icons.arrow_back_ios_outlined,
              color: lightColor,
            ),
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

  buildPersonCard(BuildContext context) {
    return Container(
      child: Expanded(
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 10),
                child: Container(
                  height: 140,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.6),
                                      spreadRadius: 1,
                                      blurRadius: 10,
                                      offset: Offset(0, 3),
                                    )
                                  ]),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(
                                  "https://i.pinimg.com/564x/51/98/18/519818ac43ff0f69a0a968da5d5465e4.jpg",
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  "Tuğba Yılmaz",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(fontSize: 16),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Hello :)",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(fontSize: 14),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.network(
                                        "https://images.gardrops.com/uploads/2351209/user_items/23512097-s4-file-6031053d52ea3.jpeg",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Icon(
                                    Icons.swap_horiz,
                                    size: 30,
                                  ),
                                  Container(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.network(
                                          "https://images.gardrops.com/uploads/134640/user_items/134640400-s1-iphone-product-595b89361554c.png",
                                          fit: BoxFit.cover),
                                    ),
                                  )
                                ],
                              ),
                              height: 110,
                              width: 200,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Divider(
                          color: lightColor,
                          height: 10,
                          indent: 20,
                          endIndent: 20,
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
}
