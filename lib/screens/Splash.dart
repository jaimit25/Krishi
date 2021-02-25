import 'dart:async';

import 'package:flutter/material.dart';

import 'Register.dart';
import 'login.dart';
import 'login.dart';

class splash extends StatefulWidget {
  @override
  _splashState createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), () {
      print('this function will work');
      Navigator.of(context).pop();
      Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('assets/images/krishi.png'),
      ),
    );
  }
}
