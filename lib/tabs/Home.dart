import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:krishi/navigation.dart';
import 'package:krishi/screens/GrowCrops.dart';
import 'package:krishi/screens/ShowDish.dart';
import 'package:krishi/screens/expert.dart';
import 'package:krishi/tabs/Profile.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Widget> imageSliders = [
    'https://images.unsplash.com/photo-1551924260-3e5ea639c806?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=967&q=80',
    'https://www.theindiaforum.in/sites/default/files/field/image/2019/10/01/Ramkumar%20Radhakrishnan%2C%20Wikimedia-1569929663.jpeg',
    'https://images.unsplash.com/photo-1592037852353-65c9f4cf996e?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=967&q=80',
    'https://aidindia.org/wp-content/uploads/2015/10/39.jpg',
    'https://www.probusinsurance.com/wp-content/uploads/2019/07/23.jpg',
    'https://upload.wikimedia.org/wikipedia/commons/b/b7/Harvesting_beans_%285762966966%29.jpg'
  ]
      .map((item) => Container(
            child: Container(
              margin: EdgeInsets.all(2.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.network(item, fit: BoxFit.cover, width: 1000.0),
                      // Positioned(
                      //   bottom: 0.0,
                      //   left: 0.0,
                      //   right: 0.0,
                      //   child: Container(
                      //     decoration: BoxDecoration(
                      //       gradient: LinearGradient(
                      //         colors: [
                      //           Color.fromARGB(200, 0, 0, 0),
                      //           Color.fromARGB(0, 0, 0, 0)
                      //         ],
                      //         begin: Alignment.bottomCenter,
                      //         end: Alignment.topCenter,
                      //       ),
                      //     ),
                      //     padding: EdgeInsets.symmetric(
                      //         vertical: 10.0, horizontal: 20.0),
                      //     child: Text(
                      //       'No. ${1} image',
                      //       style: TextStyle(
                      //         color: Colors.white,
                      //         fontSize: 20.0,
                      //         fontWeight: FontWeight.bold,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  )),
            ),
          ))
      .toList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.only(left: 15, right: 15, top: 10),
                    height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Color(0xff0e8740),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    child: Container(
                      margin: EdgeInsets.only(left: 10),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Today's Weather",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      ),
                    )),
                Container(
                    margin: EdgeInsets.only(left: 15, right: 15, top: 1),
                    height: 120,
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
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 100,
                          margin: EdgeInsets.only(left: 40),
                          child: Image.asset("assets/images/cloudy.png"),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 40),
                          alignment: Alignment.center,
                          child: Text(
                            "26° C",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 40,
                            ),
                          ),
                        )
                      ],
                    )),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Slider(),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => GrowCrops()));
                  },
                  child: Container(
                      margin: EdgeInsets.only(left: 10, right: 10, top: 20),
                      height: 120,
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
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 80,
                            margin: EdgeInsets.only(left: 30),
                            child: Image.asset("assets/images/planting.png"),
                          ),
                          Container(
                            width: 110,
                            margin: EdgeInsets.only(left: 20, right: 10),
                            alignment: Alignment.center,
                            child: Text(
                              "How to crop Plant?",
                              maxLines: 3,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          Container(
                            height: 30,
                            margin: EdgeInsets.only(left: 6),
                            child: Icon(Icons.arrow_forward_ios_sharp),
                          ),
                        ],
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => expert()));
                  },
                  child: Container(
                      margin: EdgeInsets.only(left: 10, right: 10, top: 20),
                      height: 80,
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
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.only(left: 30),
                            child: Image.asset("assets/images/agent.png"),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20),
                            alignment: Alignment.center,
                            child: Text(
                              "Ask Our Experts..",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 17,
                              ),
                            ),
                          ),
                          // Container(
                          //   height: 30,
                          //   margin: EdgeInsets.only(left: 10, right: 20),
                          //   child: Icon(Icons.arrow_forward_ios_sharp),
                          // ),
                        ],
                      )),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    bottom: 10,
                    left: 20,
                  ),
                  child: Text(
                    'Government Yojanas',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 10,
                    right: 10,
                    left: 10,
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Navigation()));
                            },
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    child:
                                        Image.asset("assets/images/pkvj.png"),
                                    height: 120,

                                    width: double.infinity,
                                    // child: Image.network(
                                    //   "https://i.ibb.co/QdQ3CQK/undraw-wishes-icyp.png",
                                    //   fit: BoxFit.cover,
                                    // ),
                                  ),
                                ],
                              ),
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.all(10),
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  new BoxShadow(
                                    color: Colors.grey[600],
                                    blurRadius: 5.0,
                                  ),
                                ],
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(20.0),
                                gradient: new LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    // Color.fromARGB(255, 25, 178, 238),
                                    Colors.white,
                                    Colors.white
                                  ],
                                ),
                                // border: Border.all(
                                // )
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Navigation()));
                            },
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    child: Image.asset(
                                        "assets/images/pradhan.jpg"),
                                    height: 140,
                                    width: double.infinity,
                                    // child: Image.network(
                                    //   "https://i.ibb.co/QdQ3CQK/undraw-wishes-icyp.png",
                                    //   fit: BoxFit.cover,
                                    // ),
                                  ),
                                ],
                              ),
                              margin: EdgeInsets.all(5),
                              padding: EdgeInsets.all(5),
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  new BoxShadow(
                                    color: Colors.grey[600],
                                    blurRadius: 5.0,
                                  ),
                                ],
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(20.0),
                                gradient: new LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    // Color.fromARGB(255, 25, 178, 238),
                                    Colors.white,
                                    Colors.white
                                  ],
                                ),
                                // border: Border.all(
                                // )
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Navigation()));
                            },
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    child: Image.asset("assets/images/gbm.png"),
                                    height: 140,
                                    width: double.infinity,
                                    // child: Image.network(
                                    //   "https://i.ibb.co/QdQ3CQK/undraw-wishes-icyp.png",
                                    //   fit: BoxFit.cover,
                                    // ),
                                  ),
                                ],
                              ),
                              margin: EdgeInsets.all(5),
                              padding: EdgeInsets.all(5),
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  new BoxShadow(
                                    color: Colors.grey[600],
                                    blurRadius: 5.0,
                                  ),
                                ],
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(20.0),
                                gradient: new LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    // Color.fromARGB(255, 25, 178, 238),
                                    Colors.white,
                                    Colors.white
                                  ],
                                ),
                                // border: Border.all(
                                // )
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Navigation()));
                            },
                            child: Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    child:
                                        Image.asset("assets/images/enam.jpeg"),
                                    height: 140,
                                    width: double.infinity,
                                    // child: Image.network(
                                    //   "https://i.ibb.co/QdQ3CQK/undraw-wishes-icyp.png",
                                    //   fit: BoxFit.cover,
                                    // ),
                                  ),
                                ],
                              ),
                              margin: EdgeInsets.all(5),
                              padding: EdgeInsets.all(5),
                              height: 150,
                              width: 150,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  new BoxShadow(
                                    color: Colors.grey[600],
                                    blurRadius: 5.0,
                                  ),
                                ],
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(20.0),
                                gradient: new LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    // Color.fromARGB(255, 25, 178, 238),
                                    Colors.white,
                                    Colors.white
                                  ],
                                ),
                                // border: Border.all(
                                // )
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }

  Widget Slider() {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20))),
      child: CarouselSlider(
        options: CarouselOptions(
          autoPlay: true,
          aspectRatio: 2.0,
          enlargeCenterPage: true,
        ),
        items: imageSliders,
      ),
    );
  }
}
