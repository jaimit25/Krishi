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
      home: Navigation(),
    );
  }
}
