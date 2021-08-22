import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'update.dart';

class MyView extends StatefulWidget {
  @override
  _MyViewState createState() => _MyViewState();
}

class _MyViewState extends State<MyView> {
  @override
  Widget build(BuildContext context) {
    var fs = FirebaseFirestore.instance;

    return Scaffold(
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
              child: Container(
                child: Column(
                  children: [
                    Expanded(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                          sigmaX: 30.0,
                          sigmaY: 30.0,
                        ),
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:
                                      MediaQuery.of(context).size.height * 0.07,
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
                                            "VIEW RECORDS",
                                            style: TextStyle(
                                                fontSize: 30,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.transparent
                                                    .withOpacity(1),
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
                                height:
                                    MediaQuery.of(context).size.width * 0.05,
                              ),
                              Material(
                                color: Colors.transparent,
                                shadowColor: Colors.black,
                                child: MaterialButton(
                                  colorBrightness: Brightness.dark,
                                  color: Colors.white.withOpacity(0.3),
                                  elevation: 18.0,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  onPressed: () {
                                    Navigator.pushNamed(context, "home");
                                  },
                                  child: Text("CREATE RECORD"),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.width * 0.05,
                              ),
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(60),
                                      topRight: Radius.circular(60),
                                      bottomLeft: Radius.circular(48),
                                      bottomRight: Radius.circular(48)),
                                  child: BackdropFilter(
                                    filter: ImageFilter.blur(
                                        sigmaX: 90.0, sigmaY: 90.0),
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.15),
                                      width: MediaQuery.of(context).size.width,
                                      //height: MediaQuery.of(context).size.height,
                                      padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.01,
                                        right:
                                            MediaQuery.of(context).size.width *
                                                0.01,
                                      ),
                                      child: StreamBuilder<QuerySnapshot>(
                                        stream:
                                            fs.collection("crud").snapshots(),
                                        builder: (context, snapshot) {
                                          if (snapshot.hasError) {
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
                                                "SOMETHING WENT WRONG !!",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                ),
                                              ),
                                            );
                                          }

                                          if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
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
                                                "LOADING",
                                                style: TextStyle(
                                                  fontSize: 20,
                                                ),
                                              ),
                                            );
                                          }

                                          return ListView(
                                            //shrinkWrap: true,
                                            children: snapshot.data!.docs.map(
                                                (DocumentSnapshot document) {
                                              Map<String, dynamic> data =
                                                  document.data()!
                                                      as Map<String, dynamic>;
                                              return Card(
                                                shadowColor: Colors.black,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          20.0),
                                                ),
                                                color: Colors.white
                                                    .withOpacity(0.4),
                                                child: ListTile(
                                                  title: Text(
                                                      'NAME: ${data['username']}'),
                                                  subtitle: Text(
                                                      'DESCRIPTION: ${data['description']}'),
                                                  leading: GestureDetector(
                                                    onTap: () {
                                                      print("Tapping");
                                                      var docid = document.id;

                                                      Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    MyUpdate(
                                                                        docid)),
                                                      );
                                                    },
                                                    child: Icon(
                                                      Icons.edit,
                                                      color: Colors.black,
                                                    ),
                                                  ),
                                                  trailing: GestureDetector(
                                                    onTap: () {
                                                      print("delete");
                                                      print(document.id);
                                                      final collection =
                                                          FirebaseFirestore
                                                              .instance
                                                              .collection(
                                                                  'crud');
                                                      collection
                                                          .doc(document
                                                              .id) // <-- Doc ID to be deleted.
                                                          .delete() // <-- Delete
                                                          .then((_) =>
                                                              print('Deleted'))
                                                          .catchError(
                                                              (error) =>
                                                                  showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (context) {
                                                                      return AlertDialog(
                                                                        backgroundColor: Colors
                                                                            .transparent
                                                                            .withOpacity(0.1),
                                                                        contentTextStyle: TextStyle(
                                                                            color:
                                                                                Colors.white,
                                                                            backgroundColor: Colors.transparent.withOpacity(0.1)),
                                                                        content:
                                                                            Text(
                                                                          "$error",
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                25,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    },
                                                                  ));
                                                    },
                                                    child: Icon(Icons
                                                        .delete_forever_sharp),
                                                  ),
                                                ),
                                              );
                                            }).toList(),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
