import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Swapie {
  final String name;
  final String id;
  final String swapiePhotoUrl;
  final int price;
  final String category;
  final int seen;
  final String publisherId;
  final String about;
  final DocumentReference userRef;

  Swapie({
    this.userRef,
    this.name,
    this.publisherId,
    this.id,
    this.swapiePhotoUrl,
    this.price,
    this.category,
    this.seen,
    this.about,
  });

  factory Swapie.createFromDoc(DocumentSnapshot doc) {
    return Swapie(
        userRef: FirebaseFirestore.instance.collection("users").doc("id"),
        name: doc.data()["name"],
        id: doc.id,
        swapiePhotoUrl: doc.data()["swapiePhotoUrl"],
        price: doc.data()["price"],
        category: doc.data()["category"],
        seen: doc.data()["seen"],
        publisherId: doc.data()["publisherId"],
        about: doc.data()["about"]);
  }
}
