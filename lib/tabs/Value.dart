import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:krishi/Models/UserProfile.dart';
import 'package:krishi/Services/crud.dart';
import 'package:krishi/screens/AddProduct.dart';
import 'package:krishi/screens/MyPro.dart';
import 'package:krishi/screens/ShowDish.dart';
import 'package:krishi/screens/ShowFav.dart';

class Value extends StatefulWidget {
  @override
  _ValueState createState() => _ValueState();
}

class _ValueState extends State<Value> {
  Query _ref;
  QuerySnapshot ast;
  crudMethods crudObj = new crudMethods();
  FirebaseAuth _auth = FirebaseAuth.instance;
  userprofile localuser;

  @override
  void initState() {
    crudObj.user().then((QuerySnapshot results) {
      setState(() {
        ast = results;
      });
      results.docs.forEach((element) {
        print(element.data());
      });
    });
    super.initState();
  }

  Widget _buildListItem({
    String Name,
    String Photo,
    String Description,
    String Price,
    String uid,
    String Index,
  }) {
    return Dismissible(
      key: Key(Index),
      onDismissed: (direction) {
        FirebaseFirestore.instance
            .collection('favourites')
            .doc(uid)
            .collection('fav')
            .add({
          'uid': uid,
          'Price': Price,
          'Description': Description,
          'Photo': Photo,
          'Name': Name,
        }).then((value) {
          Fluttertoast.showToast(
              msg: 'Suceffully Added To Favourites',
              toastLength: Toast.LENGTH_LONG,
              backgroundColor: Colors.black,
              textColor: Colors.white,
              timeInSecForIosWeb: 3,
              gravity: ToastGravity.BOTTOM);
        });

        // crudObj.deleteUser(Index);
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => ShowDish(
        //               Name: Name,
        //               Description: Description,
        //               Photo: Photo,
        //               Price: Price,
        //               Id: Index,
        //             )));
      },
      background: Container(
        color: Colors.green,
      ),
      child: GestureDetector(
        onTap: () {
          print(uid);
          getData(uid);

          print(localuser.Email);

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ShowDish(
                        Name: Name,
                        Description: Description,
                        Photo: Photo,
                        Price: Price,
                        Id: uid,
                        Index: Index,
                        UserPhoto: localuser.Photo,
                        UserName: localuser.Name,
                        UserEmail: localuser.Email,
                        UserPhone: localuser.phone,
                        UserCity: localuser.city,
                      )));
        },
        child: Card(
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Container(
            decoration: BoxDecoration(
              // border: Border.all(color: Colors.deepOrange),
              borderRadius: BorderRadius.circular(10.0),
            ),
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 90,
                  width: 90,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      image: DecorationImage(
                          image: NetworkImage(Photo), fit: BoxFit.cover)),
                ),
                Container(
                    margin: EdgeInsets.only(left: 10),
                    // width: 150,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            Name,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          child: Text(
                            Description,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: Text(
                            "Price: " + Price,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Color(0xff0e8740),
                            ),
                          ),
                        )
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    void _pushPage(BuildContext context, Widget page) {
      Navigator.of(context).push(
        MaterialPageRoute<void>(builder: (_) => page),
      );
    }

    if (ast != null) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff0e8740),
          title: Text(
            'Buy & Sell',
            style: TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.w700),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: ast.docs.length,
                itemBuilder: (context, index) {
                  return _buildListItem(
                    Name: ast.docs[index].get('Name'),
                    Photo: ast.docs[index].get('Photo'),
                    Description: ast.docs[index].get('Description'),
                    Price: ast.docs[index].get('Price'),
                    uid: ast.docs[index].get('uid'),
                    Index: ast.docs[index].id,
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.view_list,
          backgroundColor: Color(0xff0e8740),
          children: [
            SpeedDialChild(
              child: Icon(
                Icons.add,
                color: Colors.black,
              ),
              backgroundColor: Colors.white,
              label: "Add product",
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AddProduct()));
              },
            ),
            SpeedDialChild(
              child: Icon(
                Icons.turned_in_rounded,
                color: Colors.black,
              ),
              backgroundColor: Colors.white,
              label: "My Products",
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyPro()));
              },
            ),
            SpeedDialChild(
              child: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              backgroundColor: Colors.white,
              label: "Show Favourites",
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ShowFav()));
              },
            ),
          ],
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }

  Future<void> getData(uid) async {
    var doc =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    setState(() {
      localuser = userprofile.fromDocument(doc);
    });
  }
}
