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

  updateData(sDoc, newValues) {
    return FirebaseFirestore.instance
        .collection('products')
        .doc(sDoc)
        .update(newValues)
        .catchError((e) {
      print(e);
    });
  }

  deleteUser(docId) {
    return FirebaseFirestore.instance
        .collection('products')
        .doc(docId)
        .delete()
        .catchError((e) => print(e));
  }
}
