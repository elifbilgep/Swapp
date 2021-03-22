import 'package:flutter/material.dart';
import 'package:takas/Pages/auth/profile.dart';
import 'package:takas/const.dart';
import 'package:takas/models/user.dart';
import 'package:takas/services/firestore_service.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searcController = TextEditingController();
  Future<List<UserDetail>> searchResult;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: allBgColor,
        body: Column(
          children: [
            buildSearchBar(context),
            searchResult != null
                ? buildResults(context)
                : Expanded(
                    child: Center(
                      child: Text(
                        "No search, yet..",
                        textAlign: TextAlign.center,
                      ), 
                    ),
                  )
          ],
        ),
      ),
    );
  }

  buildSearchBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0, left: 15, right: 15),
      child: GestureDetector(
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => Search())),
          child: TextFormField(
            onFieldSubmitted: (input) {
              setState(() {
                searchResult = FirestoreService().userSearch(input);
              });
            },
            cursorColor: darkColor,
            style: Theme.of(context).textTheme.bodyText1,
            controller: searcController,
            decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: lightColor,
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    searcController.clear();
                    setState(() {
                      searchResult = null;
                    });
                  },
                  child: Icon(
                    Icons.cancel,
                    color: lightColor,
                    size: 30,
                  ),
                ),
                filled: true,
                fillColor: lightColor2,
                hintText: "Search",
                hintStyle: Theme.of(context).textTheme.bodyText2,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20),
                )),
          )),
    );
  }

  buildResults(BuildContext context) {
    return FutureBuilder<List<UserDetail>>(
      future: searchResult,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
              child: CircularProgressIndicator(
            backgroundColor: darkColor,
          ));
        }
        if (snapshot.data.length == 0) {
          return Column(
            children: [
              Center(child: Text("No results")),
            ],
          );
        }
        return Expanded(
          child: ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              UserDetail user = snapshot.data[index];
              return Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 15, right: 15),
                child: Card(
                  elevation: 10,
                  color: lightColor2,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Profile(
                                    profileUserId: user.id,
                                  )));
                    },
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: user.photoUrl.isEmpty
                            ? AssetImage("assets/images/anonim.png")
                            : NetworkImage(user.photoUrl),
                      ),
                      title: Text(user.userName,
                          style: Theme.of(context).textTheme.headline4.copyWith(
                              fontWeight: FontWeight.bold, color: lightColor)),
                      subtitle: Text("${user.country}, ${user.city}",
                          style: Theme.of(context).textTheme.headline5),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
