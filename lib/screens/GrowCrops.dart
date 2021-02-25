import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:krishi/navigation.dart';

class GrowCrops extends StatefulWidget {
  @override
  _GrowCropsState createState() => _GrowCropsState();
}

class _GrowCropsState extends State<GrowCrops> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0e8740),
        title: Text(
          '',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.forward_rounded),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Navigation()));
              })
        ],
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            child: Text(
              'How to grow crops?',
              style: GoogleFonts.laila(
                textStyle: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 28,
                    color: Colors.green[500]),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1499529112087-3cb3b73cec95?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=967&q=80'),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 15,
            ),
            child: Text(
              'Agricultural process',
              textAlign: TextAlign.center,
              style: GoogleFonts.laila(
                textStyle: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 25,
                    color: Colors.green[500]),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 20),
            child: Text(
              'The agricultural cycle is the annual cycle of activities related to the growth and harvest of a crop (Plant). These activities include loosening the soil, seeding, special watering, moving plants when they grow bigger, and harvesting, among other.',
              overflow: TextOverflow.ellipsis,
              maxLines: 5,
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 18,
                  color: Colors.black54),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, top: 5, right: 20, bottom: 20),
            child: Text(
              'The main steps for agricultural practices include preparation of soil, sowing, adding manure and fertilizers, irrigation, harvesting and storage.',
              overflow: TextOverflow.ellipsis,
              maxLines: 5,
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 18,
                  color: Colors.black54),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              bottom: 10,
              top: 15,
            ),
            child: Text(
              'Seeding',
              textAlign: TextAlign.center,
              style: GoogleFonts.laila(
                textStyle: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 25,
                    color: Colors.green[500]),
              ),
            ),
          ),
          Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://www.thespruce.com/thmb/qaKG_y_-ZTY-fVTWYFEG-B1EHTY=/450x0/filters:no_upscale():max_bytes(150000):strip_icc()/mature-man-planting-seeds--close-up-BA65580-5b305eb8fa6bcc00364d3c9e.jpg'),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
            child: Text(
              'The fundamental factor in the process of seeding is dependent on the properties of both seed and the soil it is being planted in.',
              overflow: TextOverflow.ellipsis,
              maxLines: 5,
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 18,
                  color: Colors.black54),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              bottom: 10,
              top: 15,
            ),
            child: Text(
              'Seedling',
              textAlign: TextAlign.center,
              style: GoogleFonts.laila(
                textStyle: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 25,
                    color: Colors.green[500]),
              ),
            ),
          ),
          Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://www.microdrips.com/en/blog/wp-content/uploads/2017/05/preparing-seedlings-1200x800.jpg'),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
            child: Text(
              'Germination is a process by which the seed develops into a seedling. The vital conditions necessary for this process are water, air, temperature, energy, viability and enzymes. If any of these conditions are absent, the process cannot undergo successfully. Germination is also known as sprouting; it is also considered as the first sign of life shown by a seed.',
              overflow: TextOverflow.ellipsis,
              maxLines: 10,
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 18,
                  color: Colors.black54),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              bottom: 10,
              top: 15,
            ),
            child: Text(
              'Pollination',
              textAlign: TextAlign.center,
              style: GoogleFonts.laila(
                textStyle: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 25,
                    color: Colors.green[500]),
              ),
            ),
          ),
          Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://image.shutterstock.com/image-vector/diagram-showing-pollination-flower-bee-260nw-1498690340.jpg'),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
            child: Text(
              'The process of pollination refers to the transfer of pollen to the female organs of the plant. Optimum factor for ideal pollination are: relative humidity rate of 50-70% and temperature of 24.4 degrees Celsius. If the humidity rate is higher than 90%, the pollen would not shed. Increasing air circulation is a favourable method of keeping humidity levels under control.',
              overflow: TextOverflow.ellipsis,
              maxLines: 10,
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 18,
                  color: Colors.black54),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              bottom: 10,
              top: 15,
            ),
            child: Text(
              'Irrigation',
              textAlign: TextAlign.center,
              style: GoogleFonts.laila(
                textStyle: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 25,
                    color: Colors.green[500]),
              ),
            ),
          ),
          Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://www.indiafilings.com/learn/wp-content/uploads/2019/11/Micro-Irrigation-Fund.jpg'),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
            child: Text(
              'The process of pollination refers to the transfer of pollen to the female organs of the plant. Optimum factor for ideal pollination are: relative humidity rate of 50-70% and temperature of 24.4 degrees Celsius. If the humidity rate is higher than 90%, the pollen would not shed. Increasing air circulation is a favourable method of keeping humidity levels under control.',
              overflow: TextOverflow.ellipsis,
              maxLines: 10,
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 18,
                  color: Colors.black54),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              bottom: 10,
              top: 15,
            ),
            child: Text(
              'Harvesting',
              textAlign: TextAlign.center,
              style: GoogleFonts.laila(
                textStyle: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 25,
                    color: Colors.green[500]),
              ),
            ),
          ),
          Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1471532027614-154d124ccf57?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=1050&q=80'),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
            child: Text(
              'Reaping - cutting the mature panicles and straw above ground. Threshing - separating the paddy grain from the rest of cut crop. Cleaning - removing immature, unfilled, non-grain materials. Hauling - moving the cut crop to the threshing location.',
              overflow: TextOverflow.ellipsis,
              maxLines: 10,
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 18,
                  color: Colors.black54),
            ),
          ),
        ],
      ),
    );
  }
}
