import 'package:flutter/material.dart';
import 'package:takas/const.dart';

class AddSwapie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: allBgColor,
      body: Column(
        children: [
          buildHeader(context),
        ],
      ),
    );
  }

  buildHeader(BuildContext context) {
    return Container(
      height: 200,

      width: MediaQuery.of(context).size.width,

    );
  }
}
