import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:krishi/navigation.dart';
import 'package:permission_handler/permission_handler.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  String uid;
  String imageurl;

  // String headfeed;
  // String bodyfeed;
  // userprofile localuser;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getuser();
  }

  final TextEditingController ProductName = TextEditingController();
  final TextEditingController ProductPrice = TextEditingController();
  final TextEditingController ProductDescription = TextEditingController();

// photo, price, Product name ,description
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    ProductName.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Navigation()));
            },
            icon: Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
          )
        ],
        backgroundColor: Colors.tealAccent,
        title: Text(
          'Add Product',
          style: GoogleFonts.laila(
            textStyle: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w700, color: Colors.black),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                uploadImage();
              },
              child: imageurl != null
                  ? Container(
                      height: 200,
                      // decoration: BoxDecoration(
                      //   shape: BoxShape.rectangle,
                      //   image: DecorationImage(
                      //     fit: BoxFit.cover,
                      //     image: NetworkImage(imageurl),
                      //   ),
                      // ),
                      child: Image.network(imageurl),
                    )
                  : Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/crop.jpeg'),
                        ),
                      ),
                    ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              height: 60,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              margin: EdgeInsets.only(top: 20, left: 10, right: 10),
              child: TextFormField(
                controller: ProductName,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.add_shopping_cart_sharp,
                      color: Colors.tealAccent,
                    ),
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                    hintText: 'Product Name',
                    border: InputBorder.none),
              ),
            ),
            Container(
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    height: 60,
                    width: 180,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    margin: EdgeInsets.only(top: 20, left: 10, right: 10),
                    child: TextFormField(
                      controller: ProductPrice,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                      decoration: InputDecoration(
                          prefixIcon: Icon(
                            Icons.calculate_rounded,
                            color: Colors.tealAccent,
                          ),
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                          ),
                          hintText: 'Price',
                          border: InputBorder.none),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              height: 60,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              margin: EdgeInsets.only(top: 20, left: 10, right: 10),
              child: TextFormField(
                controller: ProductDescription,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.notes_rounded,
                      color: Colors.tealAccent,
                    ),
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                    ),
                    hintText: 'Product Description',
                    border: InputBorder.none),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            GestureDetector(
              onTap: () {
                print(ProductPrice.text);
                print(imageurl);
                print(
                    'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx');
                FirebaseFirestore.instance.collection('products').add(
                  {
                    'Photo': imageurl,
                    'Name': ProductName.text,
                    'Price': ProductPrice.text,
                    'Description': ProductDescription.text,
                    'uid': uid
                  },
                );
                Navigator.of(context).pop();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Navigation()));
              },
              child: Container(
                margin: EdgeInsets.all(10),
                height: 50,
                decoration: BoxDecoration(
                  gradient: new LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomRight,
                    colors: [
                      // Color.fromARGB(255, 25, 178, 238),
                      Colors.tealAccent,
                      Colors.tealAccent
                    ],
                  ),
                  // color: Colors.black,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    'Add Feed',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 20),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  uploadImage() async {
    print('This Code Will Run');
    final _storage = FirebaseStorage.instance;
    final _picker = ImagePicker();
    PickedFile image;

    //Check Permissions
    await Permission.photos.request();

    var permissionStatus = await Permission.photos.status;

    if (permissionStatus.isGranted) {
      //Select Image
      image = await _picker.getImage(source: ImageSource.gallery);
      var file = File(image.path);
      if (image != null) {
        //Upload to Firebase
        var snapshot = await _storage
            .ref()
            .child('Products')
            .child(generateRandomString(90))
            .putFile(file);

        var downloadUrl = await snapshot.ref.getDownloadURL();
        setState(() {
          imageurl = downloadUrl;
        });
        // FirebaseFirestore.instance.collection('Feed').doc('usersfeed').set({
        //   'Photo': imageurl,
        //   'Head': headfeed,
        //   'body': bodyfeed,
        // });

        print(imageurl);
      } else {
        print('No Path Received');
      }
    } else {
      print('Grant Permissions and try again');
    }
  }

  String generateRandomString(int len) {
    var r = Random();
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return List.generate(len, (index) => _chars[r.nextInt(_chars.length)])
        .join();
  }

  getuser() async {
    User user = FirebaseAuth.instance.currentUser;
    uid = user.uid;
    print(uid);
  }
}
