import 'package:flutter/material.dart';

List cateogires = ["Home", "School", "Clothes", "Car", "Books"];

List<IconData> icons = [
  Icons.home,
  Icons.school,
  Icons.checkroom,
  Icons.car_repair,
  Icons.book
];

LinearGradient gradient = LinearGradient(
    colors: <Color>[Color(0xff4a4a65), Color(0xff41415c), Color(0xff3d3d58)],
    begin: Alignment.bottomRight,
    end: Alignment.topLeft,
    stops: [0.1, 0.5, 0.9]);
