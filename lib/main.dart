import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:krishi/navigation.dart';

import 'screens/Register.dart';
import 'screens/Splash.dart';
import 'screens/login.dart';
import 'screens/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    Firebase.initializeApp();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: splash(),
    );
  }
}

// Builder(
//                 builder: (context) => GestureDetector(
//                   onTap: () {
//                     Scaffold.of(context).showSnackBar(
//                       SnackBar(
//                         behavior: SnackBarBehavior.floating,
//                         margin:
//                             EdgeInsets.symmetric(horizontal: 10, vertical: 12),
//                         backgroundColor: Colors.black,
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(10.0),
//                         ),
//                         duration: Duration(milliseconds: 1000),
//                         content: Text(
//                           '  Add Dish',
//                           style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.w700,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                   child: Container(
//                     margin: EdgeInsets.all(10),
//                     padding: EdgeInsets.all(10),
//                     width: MediaQuery.of(context).size.width,
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         border: Border.all(color: Colors.black),
//                         borderRadius: BorderRadius.all(Radius.circular(10))),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Container(
//                           child: Icon(Icons.add, color: Colors.black),
//                         ),
//                         Container(
//                           child: Text(
//                             '     Add Dishes   ',
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w700,
//                                 fontSize: 18,
//                                 color: Colors.black),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
