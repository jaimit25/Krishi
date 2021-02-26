import 'package:flutter/material.dart';

class Articles extends StatelessWidget {
  String Head, ImageUrl, Body;

  Articles({@required this.Head, @required this.ImageUrl, @required this.Body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff0e8740),
          title: Text(
            Head,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ),
        body: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(ImageUrl),
                  )),
              height: 300,
              width: double.infinity,
              // child: Image.network(
              //   "https://i.ibb.co/QdQ3CQK/undraw-wishes-icyp.png",
              //   fit: BoxFit.cover,
              // ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Text(
                Body,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Container(
                margin: EdgeInsets.all(10),
                child: Divider(
                  color: Colors.black,
                ))
          ],
        ));
  }
}
