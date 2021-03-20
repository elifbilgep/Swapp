

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:takas/models/user.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final DateTime time = DateTime.now();

  Future<void> createUser(
      {id,
      email,
      userName,
      nameAndLastName,
      country,
      city,
      photoUrl = ""}) async {
    await _firestore.collection("users").doc(id).set({
      "userName": userName,
      "nameAndLastName": nameAndLastName,
      "email": email,
      "photoUrl": photoUrl,
      "country": country,
      "city": city,
    });
  }

  /*Future<UserDetail> bringUser(id) async {
    DocumentSnapshot doc = await _firestore.collection("users").doc(id).get();
    if (doc.exists) {
      UserDetail user = UserDetail.createFromDoc(doc);
      return user;
    }
    return null;
  }*/
}
