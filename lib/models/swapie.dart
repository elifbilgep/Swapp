import 'package:cloud_firestore/cloud_firestore.dart';

class Swapie {
  final String name;
  final String id;
  final String swapiePhotoUrl;
  final int price;
  final String category;
  final int seen;
  final String publisherId;
  final String about;

  Swapie({
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
        id: doc.id,
        swapiePhotoUrl: doc.data()["swapiePhotoUrl"],
        price: doc.data()["price"],
        category: doc.data()["category"],
        seen: doc.data()["seen"],
        publisherId: doc.data()["publisherId"],
        about: doc.data()["about"]);
  }
}
