import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krishi/navigation.dart';

class ShowDish extends StatelessWidget {
  String Name, Description, Photo, Price, Id, Index;
  ShowDish(
      {this.Name,
      this.Description,
      this.Photo,
      this.Price,
      this.Id,
      this.Index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              // margin: EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => Navigation()));
                    },
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  )),
                  Text(
                    'Product Details',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ],
              )),
          Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(Photo != null
                    ? Photo
                    : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8106FEUtzoaF2sMZOowsuLdym1inQyI-IuA&usqp=CAU'),
              ),
            ),
          ),
          Container(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: 20,
                    top: 20,
                  ),
                  child: Text(
                    'Price :',
                    style: GoogleFonts.laila(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                          color: Colors.green[700]),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 8,
                    top: 20,
                  ),
                  child: Text(
                    Price,
                    style: GoogleFonts.laila(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                          color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 5,
                    top: 20,
                  ),
                  child: Text(
                    '',
                    style: GoogleFonts.laila(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 18,
                          color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: 20,
              top: 30,
            ),
            child: Text(
              Name,
              style: GoogleFonts.laila(
                textStyle: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 28,
                    color: Colors.green[500]),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              left: 20,
              top: 30,
            ),
            child: Text(
              'Description',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  color: Colors.black),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, top: 30, right: 20, bottom: 20),
            child: Text(
              Description,
              overflow: TextOverflow.ellipsis,
              maxLines: 5,
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 18,
                  color: Colors.black45),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(top: 0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      // margin: EdgeInsets.only(bottom: 10),
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.green[400],
                        // borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                          child: Text('Contact',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: Colors.white))),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
