import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:krishi/tabs/Feeds.dart';
import 'package:krishi/tabs/Home.dart';
import 'package:krishi/tabs/Profile.dart';
import 'package:krishi/tabs/Value.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  var currentindex = 0;

  List<Center> tabs = [
    Center(
      child: Home(),
    ),
    Center(
      child: Value(),
    ),
    Center(
      child: Feeds(),
    ),
    Center(
      child: Profile(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentindex],
      bottomNavigationBar: ConvexAppBar(
        // backgroundColor: Colors.green,
        gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff0e8740),
              Color(0xff0e8740)
              // Color(0xff01BAEF),
              // Color(0xff20BF55),
              // Color(0xfff4d03f),
              // Color(0xff13547a),
            ]),
        items: [
          TabItem(icon: Icon(Icons.house_outlined, size: 25)),
          TabItem(icon: Icon(Icons.assignment_sharp, size: 25)),
          TabItem(icon: Icon(Icons.add_box_outlined, size: 25)),
          TabItem(icon: Icon(Icons.person, size: 25)),
        ],
        onTap: (index) {
          setState(() {
            currentindex = index;
          });
        },
      ),
    );
  }
}
