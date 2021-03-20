import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';

class UserDetail {
  final String id;
  final String userName;
  final String nameLastName;
  final String photoUrl;
  final String email;
  final String country;
  final String city;

  UserDetail(
      {@required this.id,
      this.userName,
      this.nameLastName,
      this.photoUrl,
      this.email,
      this.country,
      this.city});

  factory UserDetail.createFromFirebase(auth.User user) {
    return UserDetail(
      id: user.uid,
      userName: user.displayName,
      photoUrl: user.photoURL,
      email: user.email,
    );
  }

  factory UserDetail.createFromDoc(DocumentSnapshot doc) {
    return UserDetail(
      id: doc.id,
      userName: doc["userName"],
      nameLastName: doc["nameAndLastName"],
      email: doc["email"],
      photoUrl: doc["photoUrl"],
      city: doc["city"],
      country: doc["country"]
      
    );
  }
}
