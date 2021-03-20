import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final DateTime time = DateTime.now();

  Future<void> createUser(
      {id, email, userName, nameAndLastName, country, city,photoUrl= ""}) async {
    await _firestore.collection("users").doc(id).set({
      "userName": userName,
      "nameAndLastName": nameAndLastName,
      "email": email,
      "photoUrl": photoUrl,
      "country": country,
      "city": city,
    });
  }
}
