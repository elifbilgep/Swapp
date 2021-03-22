import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:takas/models/swapie.dart';
import 'package:takas/models/user.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final DateTime time = DateTime.now();
  

  
  

  Future<void> createUser({
    id,
    email,
    userName,
    nameAndLastName,
    country,
    city,
    photoUrl = "",
  }) async {
    await _firestore.collection("users").doc(id).set({
      "userName": userName,
      "nameAndLastName": nameAndLastName,
      "email": email,
      "photoUrl": photoUrl,
      "country": country,
      "city": city,
    });
  }

  Future<UserDetail> bringUser(id) async {
    DocumentSnapshot doc = await _firestore.collection("users").doc(id).get();
    if (doc.exists) {
      UserDetail user = UserDetail.createFromDoc(doc);
      return user;
    }
    return null;
  }

  Future<void> createSwapie(
      {name,
      photoUrl,
      price,
      category,
      seen,
      publisherId,
      about,
      catgory}) async {
    await _firestore
        .collection("swapies")
        .doc(publisherId)
        .collection("userSwapies")
        .add({
      "name": name,
      "price": price,
      "swapiePhotoUrl": photoUrl,
      "seen": seen,
      "publisherId": publisherId,
      "about": about,
      "postTime": time,
      "category": category,
    });
  }

  Future<List<Swapie>> bringAllSwapies(userId) async {
    var snapshot = await _firestore
        .collection("swapies")
        .doc(userId)
        .collection("userSwapies")
        .orderBy("postTime", descending: true)
        .get();

    List<Swapie> swapies =
        snapshot.docs.map((doc) => Swapie.createFromDoc(doc)).toList();
    return swapies;
  }

  Future<List<UserDetail>> userSearch(String searchWord) async {
    var snapshot = await _firestore
        .collection("users")
        .where("userName",
            isGreaterThanOrEqualTo: searchWord, isLessThanOrEqualTo: searchWord)
        .get();

    var searchedUsers =
        snapshot.docs.map((doc) => UserDetail.createFromDoc(doc)).toList();
    return searchedUsers;
  }

  Future<List<Swapie>> bringAllTheSwapiesEver() async {
    QuerySnapshot snapshot =
        await FirebaseFirestore.instance.collection("users").get();
    var userIdList = snapshot.docs.map((doc) => doc.id).toList();
    List<Swapie> swapies = [];
    for (var id in userIdList) {
      swapies.addAll(await bringAllSwapies(id));
    }
    return swapies;
  }
}
