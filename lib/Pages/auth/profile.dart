import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:takas/Pages/auth/acc_settings.dart';
import 'package:takas/const.dart';
import 'package:takas/models/swapie.dart';
import 'package:takas/models/user.dart';
import 'package:takas/services/authorization.dart';
import 'package:takas/services/firestore_service.dart';

import '../../lists.dart';

class Profile extends StatefulWidget {
  final String profileUserId;
  Profile({Key key, this.profileUserId}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<Swapie> _swapies = [];
  String _activeUserId;

  _bringSwapies() async {
    List<Swapie> swapies =
        await FirestoreService().bringAllSwapies(widget.profileUserId);

    setState(() {
      _swapies = swapies;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _bringSwapies();
  }

  @override
  Widget build(BuildContext context) {
    _activeUserId = Provider.of<Authorization>(context).activeUserId;
    return SafeArea(
      child: Scaffold(
        backgroundColor: allBgColor,
        body: FutureBuilder(
          future: FirestoreService().bringUser(widget.profileUserId),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              Center(
                child: CircularProgressIndicator(),
              );
            }
            return buildProfile(context, snapshot.data, _activeUserId);
          },
        ),
      ),
    );
  }

  Widget buildProfile(
      BuildContext context, UserDetail profileData, _activeUserId) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            buildHeader(context, _activeUserId),
            buildUserPhotoAndInfo(context, profileData),
            buildSwapies(context)
          ],
        ),
      ),
    );
  }

  buildHeader(BuildContext context, _activeUserId) {
    return Container(
      height: 100,
      color: darkHeaderColor,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Row(
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.arrow_back_ios),
              color: lightColor,
            ),
            Text(
              "Profile",
              style: Theme.of(context).textTheme.headline3,
            ),
            SizedBox(
              width: 180,
            ),
            widget.profileUserId == _activeUserId
                ? GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileSettings())),
                    child: Icon(
                      Icons.settings,
                      color: lightColor,
                    ),
                  )
                : SizedBox(
                    width: 30,
                  )
          ],
        ),
      ),
    );
  }

  buildUserPhotoAndInfo(BuildContext context, UserDetail profileData) {
    return Container(
      height: 220,
      width: 300,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            child: Container(
              decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                BoxShadow(color: Colors.grey.shade900, blurRadius: 5)
              ]),
              child: CircleAvatar(
                radius: 50.0,
                backgroundImage: profileData.photoUrl.isNotEmpty
                    ? NetworkImage(profileData.photoUrl)
                    : AssetImage("assets/images/anonim.png"),
              ),
            ),
          ),
          Text(
            profileData.userName,
            style: Theme.of(context).textTheme.headline1.copyWith(
                  fontSize: 25,
                  color: lightColor,
                ),
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            profileData.nameLastName,
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(fontSize: 20, color: lightColor),
          ),
          SizedBox(
            height: 3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.location_on_outlined,
                color: darkHeaderColor,
                size: 30,
              ),
              Text("${profileData.country}, ${profileData.city}",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(fontSize: 17))
            ],
          )
        ],
      ),
    );
  }

  buildSwapies(BuildContext context) {
    return Container(
      height: mostRecentPhotos.length.toDouble() * 170,
      child: GridView.builder(
          scrollDirection: Axis.vertical,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            childAspectRatio: 0.75,
            crossAxisSpacing: 0,
            mainAxisSpacing: 20,
          ),
          itemCount: _swapies.length,
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
                        _swapies[index].swapiePhotoUrl,
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
                              Text(_swapies[index].price.toString()),
                              Icon(
                                Icons.attach_money,
                                color: lightColor,
                              )
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
}
