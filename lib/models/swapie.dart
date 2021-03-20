import 'package:cloud_firestore/cloud_firestore.dart';

class Swapie {
  final String id;
  final String swapiePhotoUrl;
  final int firstPriceInterval;
  final int secondPriceInterval;
  final String category;
  final int seen;
  final String publisherId;

  Swapie({
    this.publisherId,
    this.id,
    this.swapiePhotoUrl,
    this.firstPriceInterval,
    this.secondPriceInterval,
    this.category,
    this.seen,
  });

  factory Swapie.createFromDoc(DocumentSnapshot doc) {
    return Swapie(
        id: doc.id,
        swapiePhotoUrl: doc["swapiePhotoUrl"],
        firstPriceInterval: doc["firstPriceInterval"],
        secondPriceInterval: doc["seconddPriceInterval"],
        category: doc["category"],
        seen: doc["seen"],
        publisherId: doc["publisherId"]);
  }
}
