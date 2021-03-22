import 'dart:io';
import 'package:provider/provider.dart';
import 'package:takas/services/authorization.dart';
import 'package:takas/services/firestore_service.dart';
import 'package:takas/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:takas/const.dart';

import '../../lists.dart';

class AddSwapie extends StatefulWidget {
  @override
  _AddSwapieState createState() => _AddSwapieState();
}

class _AddSwapieState extends State<AddSwapie> {
  File file;
  final _formKey = GlobalKey<FormState>();
  final _formKeyPrice = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool loading = false;
  String tappedCategory;

  String givenName, givenAbout, givenCategory;
  int givenPrice, valueToint;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: allBgColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              loading
                  ? LinearProgressIndicator()
                  : SizedBox(
                      height: 0,
                    ),
              buildHeader(context),
              buildPhotoArea(context, file),
              //buildAddPhotoButton(context),
              buildCategories(context),
              buildTextFields(context),

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
            GestureDetector(
              onTap: () {
                setState(() {
                  file = null;
                });
              },
              child: Icon(
                Icons.arrow_back_ios,
                color: lightColor,
              ),
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

  buildPhotoArea(BuildContext context, File file) {
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
                  child: file == null
                      ? Center(
                          child: Text(
                            "Choose a pic",
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.file(
                            file,
                            fit: BoxFit.cover,
                          ),
                        )),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: GestureDetector(
                    onTap: () {},
                    child: file == null
                        ? GestureDetector(
                            onTap: () {
                              return choosePhoto(context);
                            },
                            child: Container(
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                  color: darkHeaderColor,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.add_a_photo,
                                    color: lightColor,
                                  ),
                                  Text(
                                    "Add",
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  )
                                ],
                              ),
                            ),
                          )
                        : null,
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  buildCategories(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
      child: Container(
        height: 200,
        width: 450,
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
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 150,
                    childAspectRatio: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          border: tappedCategory == (categories[index])
                              ? Border.all(color: lightColor)
                              : Border.all(color: darkColor),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                if (tappedCategory != (categories[index])) {
                                  givenCategory = categories[index];
                                  tappedCategory = (categories[index]);
                                  print(givenCategory);
                                }
                              });
                            },
                            child: Text(
                              categories[index],
                              style: tappedCategory == (categories[index])
                                  ? Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      .copyWith(fontSize: 17)
                                  : Theme.of(context)
                                      .textTheme
                                      .bodyText2
                                      .copyWith(
                                          color: lightColor2, fontSize: 17),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  buildTextFields(BuildContext context) {
    return Container(
      height: 250,
      width: MediaQuery.of(context).size.width * 0.9,
      child: Form(
        key: _formKey,
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
              onSaved: (inputValue) => givenName = inputValue,
              validator: (value) {
                return nameValidator(value);
              },
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
            ),
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
              onSaved: (inputValue) => givenAbout = inputValue,
              validator: (inputValue) {
                return aboutValidator(inputValue);
              },
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
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width * 0.98,
        child: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.02,
            ),
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
              key: _formKeyPrice,
              child: Row(
                children: [
                  Container(
                    height: 50,
                    width: 100,
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      validator: (inputValue) {
                        return priceValidator1((inputValue));
                      },
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
                      onChanged: (value) {
                        valueToint = int.parse(value);
                        givenPrice = valueToint;
                        return valueToint;
                      },
                    ),
                  ),
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
      child: GestureDetector(
        onTap: shareButton,
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
              Text("Share", style: Theme.of(context).textTheme.bodyText2)
            ],
          ),
        ),
      ),
    );
  }

  void shareButton() async {
    if (_formKey.currentState.validate() &&
        _formKeyPrice.currentState.validate()) {
      _formKey.currentState.save();
      print(givenName);
      print(givenAbout);

      if (!loading) {
        setState(() {
          loading = true;
        });
        String uploadedPhotoUrl =
            await StorageService().uploadSwapiePhoto(file);
        var activeUserId =
            Provider.of<Authorization>(context, listen: false).activeUserId;

        await FirestoreService().createSwapie(
            photoUrl: uploadedPhotoUrl,
            about: givenAbout,
            name: givenName,
            category: givenCategory,
            price: givenPrice,
            seen: 200,
            publisherId: activeUserId);

        setState(() {
          loading = false;
          file = null;
        });
        _scaffoldKey.currentState.showSnackBar(
          SnackBar(
            content: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Share is successful"),
              ],
            ),
          ),
        );
        
      }
    }
  }

  choosePhoto(context) {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text(
            "Choose A Picture",
            style: Theme.of(context).textTheme.headline4,
          ),
          children: [
            SimpleDialogOption(
              onPressed: takekApic,
              child: Text(
                "Take a photo",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(color: darkHeaderColor),
              ),
            ),
            SimpleDialogOption(
              onPressed: chooseFromGallery,
              child: Text(
                "Pick a photo",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(color: darkHeaderColor),
              ),
            ),
            SimpleDialogOption(
              child: Text(
                "Cancel",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(color: darkHeaderColor),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }

  takekApic() async {
    var image = await ImagePicker().getImage(
        source: ImageSource.camera,
        maxHeight: 200,
        maxWidth: 150,
        imageQuality: 80);

    setState(() {
      file = File(image.path);
    });
  }

  chooseFromGallery() async {
    var image = await ImagePicker().getImage(
        source: ImageSource.gallery,
        maxHeight: 200,
        maxWidth: 150,
        imageQuality: 80);
    setState(() {
      file = File(image.path);
    });
  }

  nameValidator(String value) {
    if (value.trim().length > 20) {
      return "Make it shorter than 20";
    }
  }

  aboutValidator(String value) {
    if (value.trim().length > 50) {
      return "Make it shorter than 50";
    }
  }

  priceValidator1(String inputValue) {
    valueToint = int.parse(inputValue);
    if (inputValue.isEmpty) {
      return "Can't be empty";
    }
  }
}
