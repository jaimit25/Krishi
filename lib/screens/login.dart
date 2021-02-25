import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:krishi/animation/FadeAnimation.dart';

import '../navigation.dart';
import 'Register.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var _passwordVisible;
  String email;
  String password;
  User user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
            child: Container(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 400,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/background.png'),
                            fit: BoxFit.fill)),
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          left: 30,
                          width: 80,
                          height: 200,
                          child: FadeAnimation(
                              1,
                              Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/light-1.png'))),
                              )),
                        ),
                        Positioned(
                          left: 140,
                          width: 80,
                          height: 150,
                          child: FadeAnimation(
                              1.3,
                              Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/light-2.png'))),
                              )),
                        ),
                        Positioned(
                          right: 40,
                          top: 40,
                          width: 80,
                          height: 150,
                          child: FadeAnimation(
                              1.5,
                              Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/clock.png'))),
                              )),
                        ),
                        Positioned(
                          child: FadeAnimation(
                              1.6,
                              Container(
                                margin: EdgeInsets.only(top: 50),
                                child: Center(
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 40,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(30.0),
                    child: Column(
                      children: <Widget>[
                        FadeAnimation(
                            1.8,
                            Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color:
                                            Color.fromRGBO(143, 148, 251, .2),
                                        blurRadius: 20.0,
                                        offset: Offset(0, 10))
                                  ]),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[100]))),
                                    child: TextField(
                                      onChanged: (value) {
                                        setState(() {
                                          email = value;
                                        });
                                      },
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Email ",
                                          hintStyle: TextStyle(
                                              color: Colors.grey[400])),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    child: TextField(
                                      onTap: () {
                                        setState(() {
                                          _passwordVisible = !_passwordVisible;
                                        });
                                      },
                                      onChanged: (value) {
                                        setState(() {
                                          password = value;
                                        });
                                      },
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Password",
                                          hintStyle: TextStyle(
                                              color: Colors.grey[400])),
                                    ),
                                  )
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 30,
                        ),
                        FadeAnimation(
                            2,
                            GestureDetector(
                              onTap: () {
                                FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                        email: email, password: password)
                                    .then((value) {
                                  print('you clicked login');
                                  // Navigator.of(context).pushReplacementNamed('/homepage');
                                  print(
                                      'XXXXXXXXXXXXX XXXXxxxxxxxxxxRxxxxSuccccccesfull xxxxxxxxxxxxxxxxxxXXXXXXXXXXXXXXXXXXXXXXXXX');
                                  print('you clicked login button');
                                  Navigator.of(context).pop();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Navigation()));
                                });
                              },
                              child: Container(
                                height: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    gradient: LinearGradient(colors: [
                                      Color(0xff3e9d72),
                                      Color(0xff4baa7c)
                                    ])),
                                child: Center(
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            )),
                        SizedBox(
                          height: 5,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Register()));
                          },
                          child: Container(
                            child: Text(
                              "New Here? Register",
                              style: TextStyle(color: Colors.greenAccent),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  getUser() async {
    user = FirebaseAuth.instance.currentUser;
    print(user.uid);
  }
}
