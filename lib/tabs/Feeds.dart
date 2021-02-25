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
                    margin: EdgeInsets.only(bottom: 6),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 5, right: 5, top: 10),
                          height: 40,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xff0e8740),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5),
                            ),
                          ),
                          child: Container(
                            margin: EdgeInsets.only(left: 10),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              document["Head"],
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 0, right: 0, top: 1),
                          height: 300,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xffffffff),
                            boxShadow: [
                              new BoxShadow(
                                color: Colors.grey[600],
                                blurRadius: 5.0,
                              ),
                            ],
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                            ),
                          ),
                          child: Container(
                            height: 400,
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(document['Photo']),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 5, right: 5, top: 1),
                          padding: EdgeInsets.all(10),
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xff0e8740),
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                            ),
                          ),
                          child: Container(
                            margin: EdgeInsets.only(left: 10),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              document["body"],
                              maxLines: 5,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ));
              }).toList(),
            );
          },
        ),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.view_list,
        backgroundColor: Color(0xff000000),
        children: [
          SpeedDialChild(
            child: Icon(
              Icons.add,
              color: Colors.black,
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
