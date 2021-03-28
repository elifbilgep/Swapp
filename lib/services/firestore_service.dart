import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/swapie.dart';
import '../models/user.dart';

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
      "id": id,
    });
  }

  Future<List<UserDetail>> bringAllUsers() async {
    QuerySnapshot userDocs = await _firestore.collection("users").get();
    var users =
        userDocs.docs.map((doc) => UserDetail.createFromDoc(doc)).toList();

    return users;
  }

  Future<UserDetail> bringUser(id) async {
    DocumentSnapshot doc = await _firestore.collection("users").doc(id).get();
    if (doc.exists) {
      UserDetail user = UserDetail.createFromDoc(doc);
      return user;
    }
    return null;
  }

  Future<void> createSwapie({
    userRef,
    name,
    id,
    photoUrl,
    price,
    category,
    seen,
    publisherId,
    about,
  }) async {
    await _firestore.collection("swappies").doc(id).set({
      "userRef": userRef,
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

  bringAllSwapies() async {
    var snapshot = await _firestore.collection("swappies").get();

    var swapies =
        snapshot.docs.map((doc) => Swapie.createFromDoc(doc)).toList();

    return swapies;
  }

  bringUserSwapies(id) async {
    var snapshot = await _firestore
        .collection("swappies")
        .where("publisherId", isEqualTo: id)
        .get();
    var mySwapies =
        snapshot.docs.map((doc) => Swapie.createFromDoc(doc)).toList();

    return mySwapies;
  }

  bringOneSwapie(id) async {
    var snapshot = await _firestore.collection("swappies").doc(id).get();

    Swapie otherSwapie = Swapie.createFromDoc(snapshot);
    return otherSwapie;
  }

  Future<List<UserDetail>> userSearch(String searchWord) async {
    var snapshot = await _firestore
        .collection("users")
        .where(
          "userName",
          isLessThanOrEqualTo: searchWord,
        )
        .get();

    var searchedUsers =
        snapshot.docs.map((doc) => UserDetail.createFromDoc(doc)).toList();
    return searchedUsers;
  }
}
