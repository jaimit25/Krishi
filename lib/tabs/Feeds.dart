import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:krishi/screens/AddFeeds.dart';

class Feeds extends StatefulWidget {
  @override
  _FeedsState createState() => _FeedsState();
}

class _FeedsState extends State<Feeds> {
  String useruid;
  var Data;
  User user;
  Colors like;
  bool likes;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUser();
    // getData();
    print('qqqqqqqqqqqqqqqqqqqqqqqqqqqqq');
    print(useruid);
    print('ppppppppppppppppppppppppppp');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: StreamBuilder(
          stream: Data,
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView(
              children: snapshot.data.docs.map((document) {
                return Container(
                  // color: Colors.grey[100],
                  padding: EdgeInsets.only(
                    bottom: 10,
                    // left: 3,
                    // right: 3,
                  ),
                  // decoration: BoxDecoration(
                  //   color: Colors.tealAccent,
                  //   border: Border.all(
                  //       color: Colors.black,
                  //       width: 0.6,
                  //       style: BorderStyle.solid),
                  //   borderRadius: BorderRadius.only(
                  //     topLeft: Radius.circular(14),
                  //     topRight: Radius.circular(14),
                  //     bottomLeft: Radius.circular(14),
                  //     bottomRight: Radius.circular(14),
                  //   ),
                  //   // color: Colors.grey[200],
                  // ),

                  margin: EdgeInsets.only(
                    top: 5,
                  ),
                  // margin: EdgeInsets.only(top: 2),
                  // color: Colors.blue,
                  // width: MediaQuery.of(context).size.width,
                  // height: 90,
                  // child: Center(
                  //   child: Text(document['Caption']),
                  // ),

                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 3,
                        ),
                        // color: Colors.grey[100],
                        decoration: BoxDecoration(color: Colors.tealAccent
                            // borderRadius: BorderRadius.only(
                            //   topLeft: Radius.circular(5),
                            //   topRight: Radius.circular(5),
                            // ),
                            // color: Colors.grey[200],
                            ),

                        height: 60,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              child: Text(
                                document['Head'],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 8, right: 8),
                        height: 300,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(document['Photo']),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.tealAccent,
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {});
                              },
                              child: Container(
                                padding: EdgeInsets.all(5),
                                margin: EdgeInsets.only(top: 10),
                                child: Icon(Icons.self_improvement_outlined,
                                    size: 30, color: Colors.black),
                              ),
                            ),
                            Container(
                              width: 300,
                              padding: EdgeInsets.only(
                                  left: 10, top: 10, bottom: 5, right: 10),
                              child: Text(
                                document['body'],
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            );
          },
        ),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.view_list,
        backgroundColor: Colors.tealAccent,
        children: [
          SpeedDialChild(
            child: Icon(
              Icons.add,
              color: Colors.tealAccent,
            ),
            backgroundColor: Colors.white,
            label: "Add feeds",
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Addfeeds()));
            },
          ),
        ],
      ),
    );
  }

  getUser() async {
    user = FirebaseAuth.instance.currentUser;

    setState(() {
      useruid = user.uid;
    });

    print(useruid);
    Data = FirebaseFirestore.instance
        .collection('Feed')
        // .doc('usersfeed')
        // .collection('userimage')
        .snapshots();
    print('xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
  }
}
