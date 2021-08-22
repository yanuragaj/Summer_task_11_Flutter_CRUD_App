import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyUpdate extends StatefulWidget {
  //const MyUpdate({ Key? key }) : super(key: key);

  @override
  _MyUpdateState createState() => _MyUpdateState();
  MyUpdate(String this.docid);
  var docid;
}

class _MyUpdateState extends State<MyUpdate> {
  var fsconnect = FirebaseFirestore.instance;

  var username;

  var password;

  var desc;

  var d;
  myupdate() async {
    var collection = FirebaseFirestore.instance.collection('crud');
    collection
        .doc(widget.docid) // <-- Doc ID where data should be updated.
        .update({
          'username': '$username',
          'passowrd': '$password',
          'description': '$desc'
        }) // <-- Updated data
        .then((_) => print('Updated'))
        .catchError((error) => print('Update failed: $error'));
  }

  final fieldText1 = TextEditingController();
  final fieldText2 = TextEditingController();
  final fieldText3 = TextEditingController();

  void clearText() {
    fieldText1.clear();
    fieldText2.clear();
    fieldText3.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 4.0,
            sigmaY: 4.0,
          ),
          child: Container(
            margin: EdgeInsets.all(0),
            decoration: BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                  image: AssetImage("assets/images/Tile3.jpg"),
                  fit: BoxFit.cover),
            ),
            child: Center(
              child: ListView(
                children: [
                  BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 30.0,
                      sigmaY: 30.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.07,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(40),
                                bottomRight: Radius.circular(40),
                              ),
                              child: BackdropFilter(
                                filter: ImageFilter.blur(
                                  sigmaX: 100.0,
                                  sigmaY: 100.0,
                                ),
                                child: Container(
                                  margin: EdgeInsets.all(0),
                                  child: Center(
                                    child: Text(
                                      "UPDATE RECORD",
                                      style: TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold,
                                          color:
                                              Colors.transparent.withOpacity(1),
                                          shadows: [
                                            Shadow(
                                              color: Colors.black,
                                              blurRadius: 30,
                                            )
                                          ]),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width * 0.2,
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60),
                            topRight: Radius.circular(60),
                          ),
                          child: BackdropFilter(
                            filter:
                                ImageFilter.blur(sigmaX: 90.0, sigmaY: 90.0),
                            child: Container(
                              padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.1,
                                right: MediaQuery.of(context).size.width * 0.1,
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                  ),
                                  Text(
                                    "Enter Username",
                                    style: TextStyle(fontSize: 28),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.03,
                                  ),
                                  TextField(
                                    onChanged: (value) {
                                      username = value;
                                      print(username);
                                    },
                                    controller: fieldText1,
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          width: 1.5,
                                          color: Colors.black,
                                        ),
                                      ),
                                      hintText: 'username',
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.width * 0.1,
                                  ),
                                  Text(
                                    "Enter Passsword",
                                    style: TextStyle(fontSize: 28),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.03,
                                  ),
                                  TextField(
                                    onChanged: (value) {
                                      password = value;
                                    },
                                    controller: fieldText2,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                        width: 1.5,
                                      )),
                                      hintText: 'password',
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height:
                                        MediaQuery.of(context).size.width * 0.1,
                                  ),
                                  Text(
                                    "Enter Description",
                                    style: TextStyle(fontSize: 28),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.03,
                                  ),
                                  TextField(
                                    onChanged: (value) {
                                      desc = value;
                                    },
                                    controller: fieldText3,
                                    decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                        width: 1.5,
                                      )),
                                      hintText: 'give description here...',
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.width *
                                        0.15,
                                  ),
                                  Material(
                                    color: Colors.transparent,
                                    shadowColor: Colors.black,
                                    child: MaterialButton(
                                      colorBrightness: Brightness.dark,
                                      color: Colors.white.withOpacity(0.3),
                                      elevation: 18.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                      ),
                                      onPressed: () {
                                        try {
                                          if (username == "" ||
                                              password == "" ||
                                              desc == "" ||
                                              username == null ||
                                              password == null ||
                                              desc == null) {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  backgroundColor: Colors
                                                      .transparent
                                                      .withOpacity(0.1),
                                                  contentTextStyle: TextStyle(
                                                      color: Colors.white,
                                                      backgroundColor: Colors
                                                          .transparent
                                                          .withOpacity(0.1)),
                                                  content: Text(
                                                    "Please Fill All Field !!",
                                                    style: TextStyle(
                                                      fontSize: 25,
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          } else {
                                            myupdate();

                                            print(username);
                                            username = "";
                                            print(password);
                                            password = "";
                                            print(desc);
                                            print("get data");
                                            desc = "";

                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  backgroundColor: Colors
                                                      .transparent
                                                      .withOpacity(0.1),
                                                  contentTextStyle: TextStyle(
                                                      color: Colors.white,
                                                      backgroundColor: Colors
                                                          .transparent
                                                          .withOpacity(0.1)),
                                                  content: Text(
                                                    "SUCCESSFULLY UPDATED INTO FIRESTORE DATABASE !!",
                                                    style: TextStyle(
                                                      fontSize: 20,
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                            clearText();
                                          }
                                        } on NoSuchMethodError {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                backgroundColor: Colors
                                                    .transparent
                                                    .withOpacity(0.1),
                                                contentTextStyle: TextStyle(
                                                    color: Colors.white,
                                                    backgroundColor: Colors
                                                        .transparent
                                                        .withOpacity(0.1)),
                                                content: Text(
                                                  'SUCCESSFULLY UPDATED INTO FIRESTORE DATABASE !!!',
                                                  style: TextStyle(
                                                    fontSize: 25,
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        } catch (e) {
                                          showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                backgroundColor: Colors
                                                    .transparent
                                                    .withOpacity(0.1),
                                                contentTextStyle: TextStyle(
                                                    color: Colors.white,
                                                    backgroundColor: Colors
                                                        .transparent
                                                        .withOpacity(0.1)),
                                                content: Text(
                                                  'SERVER DOWN !!!!',
                                                  style: TextStyle(
                                                    fontSize: 25,
                                                  ),
                                                ),
                                              );
                                            },
                                          );
                                        }
                                      },
                                      child: Text("UPDATE"),
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.width *
                                        0.05,
                                  ),
                                  Material(
                                    color: Colors.transparent,
                                    shadowColor: Colors.black,
                                    child: MaterialButton(
                                      colorBrightness: Brightness.dark,
                                      color: Colors.white.withOpacity(0.3),
                                      elevation: 18.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                      ),
                                      onPressed: () {
                                        Navigator.pushNamed(context, "view");
                                      },
                                      child: Text("VIEW RECORDS"),
                                    ),
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.width *
                                        0.15,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
