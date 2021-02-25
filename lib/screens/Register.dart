import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:krishi/animation/FadeAnimation.dart';

import '../navigation.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  String email, password, city, name;
  final GlobalKey<FormState> formstate = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Form(
            key: formstate,
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
                                    "Register",
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
                                    child: TextFormField(
                                      onChanged: (value) {
                                        setState(() {
                                          name = value;
                                        });
                                      },
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Name ",
                                          hintStyle: TextStyle(
                                              color: Colors.grey[400])),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[100]))),
                                    child: TextFormField(
                                      onChanged: (value) {
                                        setState(() {
                                          email = value;
                                        });
                                      },
                                      validator: (email) {
                                        EmailValidator.validate(email)
                                            ? null
                                            : "Invalid Email Address";
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
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey[100]))),
                                    child: TextFormField(
                                      onChanged: (value) {
                                        setState(() {
                                          city = value;
                                        });
                                      },
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "City",
                                          hintStyle: TextStyle(
                                              color: Colors.grey[400])),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      onChanged: (value) {
                                        setState(() {
                                          password = value;
                                        });
                                      },
                                      validator: (value) {
                                        Pattern pattern =
                                            r'^(?=.*[0-9]+.*)(?=.*[a-zA-Z]+.*)[0-9a-zA-Z]{6,}$';

                                        RegExp regex = new RegExp(pattern);
                                        if (!regex.hasMatch(value)) {
                                          return "Invalid Passsword";
                                        } else
                                          return null;
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
                              onTap: () async {
                                print('you clicked Create Account button');
                                if (formstate.currentState.validate()) {
                                  print("hiiiiiiiiiiiiiii");

                                  // User user=await FirebaseAuth.instance
                                  //     .createUserWithEmailAndPassword(
                                  //         email: email, password: password)
                                  //     .user;
                                  User user = (await FirebaseAuth.instance
                                          .createUserWithEmailAndPassword(
                                              email: email, password: password))
                                      .user;
                                  print('you clicked login');
                                  FirebaseFirestore.instance
                                      .collection('/users')
                                      .doc(user.uid)
                                      .set({
                                    'uid': user.uid,
                                    'aboutus': 'Add Bio',
                                    'Name': name,
                                    'Email': email,
                                    'Password': password,
                                    'phone': 'Add Phone',
                                    'city': city,
                                    'occupation': 'Add Occupation',
                                    'Photo':
                                        'https://st2.depositphotos.com/3261171/8636/i/950/depositphotos_86365582-stock-photo-nice-girl-having-a-walk.jpg'
                                  }).then((result) {
                                    print("User Added");
                                    Navigator.of(context).pop();
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Navigation()));
                                  }).catchError((e) {
                                    print("Error: $e" + "!");
                                  });

                                  // Navigator.of(context).pushReplacementNamed('/homepage');

                                  // Navigator.of(context).pop();
                                  // Navigator.of(context).pushNamed('/show');

                                }
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
                                    "Register",
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
                        Container(
                          child: Text(
                            "Already a User? Login Now",
                            style: TextStyle(color: Colors.greenAccent),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
