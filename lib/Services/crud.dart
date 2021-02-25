import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class crudMethods {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> addUser(userData) {
    return FirebaseFirestore.instance
        .collection('products')
        .add(userData)
        .then((value) {
      print("UID: ${FirebaseAuth.instance.currentUser.uid}");
    }).catchError((e) {
      print(e);
    });
  }

  Future<QuerySnapshot> user() async {
    return await FirebaseFirestore.instance.collection('products').get();
  }

  Future<QuerySnapshot> myuser(uid) async {
    return await FirebaseFirestore.instance
        .collection('products')
        .where('uid', isEqualTo: uid)
        .get();
  }

  Future<QuerySnapshot> fav(uid) async {
    return await FirebaseFirestore.instance
        .collection('favourites')
        .doc(uid)
        .collection('fav')
        .get();
  }

  updateData(sDoc, newValues) {
    return FirebaseFirestore.instance
        .collection('products')
        .doc(sDoc)
        .update(newValues)
        .catchError((e) {
      print(e);
    });
  }

  deletefav(uid, docId) async {
    return await FirebaseFirestore.instance
        .collection('favourites')
        .doc(uid)
        .collection('fav')
        .doc(docId)
        .delete()
        .catchError((e) => print(e));
  }

  deleteUser(docId) {
    return FirebaseFirestore.instance
        .collection('products')
        .doc(docId)
        .delete()
        .catchError((e) => print(e));
  }
}
