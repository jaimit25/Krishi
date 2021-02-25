import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krishi/Models/UserProfile.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  userprofile localuser;
  FirebaseAuth _auth;
  User user;
  String test;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Loader();
  }

  Widget Loader() {
    return FutureBuilder(
      future:
          FirebaseFirestore.instance.collection('users').doc(user.uid).get(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (!snapshot.hasData) {
          return loadingwidget();
        }
        return profilepage();
      },
    );
  }

  Widget loadingwidget() {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget profilepage() {
    return Scaffold(
      body: Container(
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                // color: Colors.blue[300],
                image: DecorationImage(
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.5), BlendMode.darken),
                  image: AssetImage("assets/images/wheat.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 20, bottom: 5),
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          colorFilter: new ColorFilter.mode(
                              Colors.black.withOpacity(0.1), BlendMode.darken),
                          fit: BoxFit.cover,
                          image: NetworkImage(localuser.Photo),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 10,
                      ),
                      child: Text(
                        localuser.Name,
                        style: GoogleFonts.laila(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    // Container(
                    //   margin: EdgeInsets.only(
                    //     top: 10,
                    //     bottom: 10,
                    //   ),
                    //   child: Text(
                    //     'I am a web developer',
                    //     maxLines: 5,
                    //     style: GoogleFonts.laila(
                    //       textStyle: TextStyle(
                    //         color: Colors.white,
                    //         fontSize: 17,
                    //         fontWeight: FontWeight.w500,
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    GestureDetector(
                      onTap: () {
                        print('Edited');
                      },
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        height: 26,
                        width: 90,
                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: Center(
                          child: Text(
                            'Edit Profile',
                            style: GoogleFonts.laila(
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 2,
                              color: Colors.white,
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15, top: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  new BoxShadow(
                    color: Colors.grey[600],
                    blurRadius: 5.0,
                  ),
                ],
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Column(
                children: [
                  Container(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                    left: 10,
                                  ),
                                  child: Icon(
                                    Icons.account_box_rounded,
                                    color: Color(0xff0e8740),
                                    size: 25,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Text(
                                    localuser.Name,
                                    style: GoogleFonts.laila(
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                        fontSize: 17,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),
                            child: Divider(
                              height: 5,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  left: 10,
                                ),
                                child: Icon(
                                  Icons.location_city,
                                  color: Color(0xff0e8740),
                                  size: 25,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Text(
                                  localuser.city,
                                  style: GoogleFonts.laila(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                          child: Divider(
                            height: 5,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  left: 10,
                                ),
                                child: Icon(
                                  Icons.phone,
                                  color: Color(0xff0e8740),
                                  size: 25,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Text(
                                  localuser.phone,
                                  style: GoogleFonts.laila(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 3),
                          child: Divider(
                            height: 5,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                  left: 10,
                                ),
                                child: Icon(
                                  Icons.email,
                                  color: Color(0xff0e8740),
                                  size: 25,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Text(
                                  localuser.Email,
                                  style: GoogleFonts.laila(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      fontSize: 17,
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
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                print('Edited');
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                height: 50,
                child: Center(
                  child: Text(
                    'Log Out',
                    style: GoogleFonts.laila(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.grey[600],
                        blurRadius: 7.0,
                      ),
                    ],
                    color: Color(0xff0e8740),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
            ),
          ],
        ),
      ),
    );
  }

  getCurrentUser() async {
    var user1 = FirebaseAuth.instance.currentUser;
    setState(() {
      user = user1;
    });
    final uid = user.uid;
    print(uid);
    var doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();
    print(doc.data);

    setState(() {
      localuser = userprofile.fromDocument(doc);
    });
    print(localuser.Email);
    print('this method has run');
  }
}
