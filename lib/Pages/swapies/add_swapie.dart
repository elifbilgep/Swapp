import 'package:flutter/material.dart';
import 'package:takas/const.dart';

class AddSwapie extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: allBgColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              buildHeader(context),
              buildPhotoArea(context),
              //buildAddPhotoButton(context),
              buildCategories(context),
              buildTextFieldName(context),
              buildTextField(context),
              buildPrice(context),
              buildSaveButton(context),
            ],
          ),
        ),
      ),
    );
  }

  buildHeader(BuildContext context) {
    return Container(
      height: 100,
      color: darkHeaderColor,
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: Row(
          children: [
            Icon(
              Icons.arrow_back_ios,
              color: lightColor,
            ),
            Text(
              "Add Swapie",
              style: Theme.of(context).textTheme.headline3,
            ),
          ],
        ),
      ),
    );
  }

  buildPhotoArea(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0, left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                height: 220,
                width: 170,
                decoration: BoxDecoration(
                    border: Border.all(color: lightColor),
                    borderRadius: BorderRadius.circular(20)),
                child: Center(
                  child: Text(
                    "Choose a pic",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.add_a_photo,
                          color: lightColor,
                        ),
                        Text(
                          "Add",
                          style: Theme.of(context).textTheme.bodyText1,
                        )
                      ],
                    ),
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                        color: darkHeaderColor,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  buildAddPhotoButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.add_a_photo_rounded,
                color: lightColor,
                size: 20,
              ),
              Text(
                "Add Photo",
                style: Theme.of(context).textTheme.bodyText1,
              )
            ],
          ),
        ),
        height: 30,
        width: 200,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.grey.shade900, blurRadius: 6, spreadRadius: 1),
        ], color: darkbuttonColor, borderRadius: BorderRadius.circular(20)),
      ),
    );
  }

  buildCategories(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0),
      child: Container(
        height: 140,
        width: 390,
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Choose a category:",
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Center(
                      child: Text("Technology",
                          style: Theme.of(context).textTheme.bodyText1),
                    ),
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                        border: Border.all(color: lightColor2),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Container(
                    child: Center(
                      child: Text("Clothing",
                          style: Theme.of(context).textTheme.bodyText1),
                    ),
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                        border: Border.all(color: lightColor2),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Container(
                    child: Center(
                      child: Text("Decoration",
                          style: Theme.of(context).textTheme.bodyText1),
                    ),
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                        border: Border.all(color: lightColor2),
                        borderRadius: BorderRadius.circular(10)),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Center(
                      child: Text("Hobby",
                          style: Theme.of(context).textTheme.bodyText1),
                    ),
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                        border: Border.all(color: lightColor2),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Container(
                    child: Center(
                      child: Text("Books",
                          style: Theme.of(context).textTheme.bodyText1),
                    ),
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                        border: Border.all(color: lightColor2),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  Container(
                    child: Center(
                      child: Text("Others",
                          style: Theme.of(context).textTheme.bodyText1),
                    ),
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                        border: Border.all(color: lightColor2),
                        borderRadius: BorderRadius.circular(10)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildTextFieldName(BuildContext context) {
    return Container(
      height: 150,
      width: 390,
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 6,
                ),
                Icon(
                  Icons.text_fields,
                  color: darkHeaderColor,
                ),
                SizedBox(
                  width: 6,
                ),
                Text("Swapie's Name"),
              ],
            ),
            TextFormField(
              maxLines: 1,
              maxLength: 20,
              maxLengthEnforced: false,
              cursorColor: darkHeaderColor,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                filled: true,
                fillColor: lightColor,
              ),
            )
          ],
        ),
      ),
    );
  }

  buildTextField(BuildContext context) {
    return Container(
      height: 150,
      width: 390,
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 6,
                ),
                Icon(
                  Icons.textsms_outlined,
                  color: darkHeaderColor,
                ),
                SizedBox(
                  width: 6,
                ),
                Text("About Your Swapie"),
              ],
            ),
            TextFormField(
              maxLines: 2,
              maxLength: 50,
              maxLengthEnforced: false,
              cursorColor: darkHeaderColor,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                filled: true,
                fillColor: lightColor,
              ),
            )
          ],
        ),
      ),
    );
  }

  buildPrice(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
        height: 50,
        width: 390,
        child: Row(
          children: [
            Icon(
              Icons.attach_money_outlined,
              size: 30,
              color: darkHeaderColor,
            ),
            Text(
              "Price:",
              style: Theme.of(context).textTheme.bodyText2,
            ),
            SizedBox(
              width: 15,
            ),
            Form(
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 100,
                    child: TextFormField(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                    ),
                  ),
                  Text(" between ",
                      style: Theme.of(context).textTheme.bodyText1),
                  Container(
                    height: 50,
                    width: 100,
                    child: TextFormField(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.white, width: 2.0),
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  buildSaveButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, bottom: 25),
      child: Container(
        height: 50,
        width: 300,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 3,
                  blurRadius: 1,
                  offset: Offset(0, 6)
                  // changes position of shadow
                  ),
            ],
            borderRadius: BorderRadius.circular(20),
            color: signAndCreateButtonColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Save", style: Theme.of(context).textTheme.bodyText2)
          ],
        ),
      ),
    );
  }
}
