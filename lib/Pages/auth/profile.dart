import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../const.dart';
import '../../models/swapie.dart';
import '../../models/user.dart';
import '../../services/authorization.dart';
import '../../services/firestore_service.dart';
import '../message/messages.dart';
import 'acc_settings.dart';

class Profile extends StatefulWidget {
  final comingIdFromSearch;

  const Profile({Key key, this.comingIdFromSearch}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String _activeUserId;
  UserDetail _profileOwner;
  var clickedSwapieId;
  List<Swapie> swapiesData;
  List<Swapie> mySwapies;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    FirestoreService().bringUser(widget.comingIdFromSearch);
    _activeUserId = Provider.of<Authorization>(context).activeUserId;
    return SafeArea(
      child: Container(
        color: darkColor2,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: FutureBuilder(
            future: FirestoreService().bringUser(widget.comingIdFromSearch),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              _profileOwner = snapshot.data;
              return buildProfile(context, _profileOwner, _activeUserId);
            },
          ),
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
            buildSwapies(context, _activeUserId)
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
        padding: const EdgeInsets.only(left: 20.0, right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Profile",
              style: Theme.of(context).textTheme.headline3,
            ),
            widget.comingIdFromSearch == _activeUserId
                ? GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileSettings(
                                  profile: _profileOwner,
                                ))),
                    child: Icon(
                      Icons.settings,
                      color: lightColor,
                    ),
                  )
                : SizedBox(
                    width: 30,
                  ),
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
                BoxShadow(color: Colors.grey.shade900, blurRadius: 2)
              ]),
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: profileData.photoUrl.isEmpty
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset("assets/images/anonim.png"))
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: profileData.photoUrl,
                        ),
                      ),
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

  buildSwapies(BuildContext context, _activeUserId) {
    return FutureBuilder(
      future: FirestoreService().bringUserSwapies(widget.comingIdFromSearch),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          mySwapies = snapshot.data;
        }

        return buildGridView(_activeUserId, snapshot.data);
      },
    );
  }

  Widget buildGridView(_activeUserId, mySwapies) {
    return Container(
      height: 1000,
      child: GridView.builder(
          scrollDirection: Axis.vertical,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            childAspectRatio: 0.75,
            crossAxisSpacing: 0,
            mainAxisSpacing: 20,
          ),
          itemCount: mySwapies.length,
          itemBuilder: (context, index) {
            return Center(
              child: GestureDetector(
                onTap: () {
                  clickedSwapieId = mySwapies[index].id;
                  if (widget.comingIdFromSearch != _activeUserId) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Messages()));
                  }
                },
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(30)),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.network(
                          mySwapies[index].swapiePhotoUrl,
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
                                color: midColor,
                                borderRadius: BorderRadius.circular(20)),
                            height: 50,
                            width: 130,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(mySwapies[index].price.toString()),
                                Icon(
                                  Icons.attach_money,
                                  color: bgDarkOne,
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
