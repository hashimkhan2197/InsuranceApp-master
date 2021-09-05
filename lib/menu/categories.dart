import 'package:flutter/material.dart';
import 'package:isurance/Car_insurance/Location.dart';
import 'package:isurance/Car_insurance/Personal_information.dart';
import 'package:isurance/Home_insurance/Personal_info.dart';
import 'package:isurance/menu/Forms/fire_and_general_insurance/fireandgeneral_subcategories.dart';
import 'package:isurance/menu/Forms/marine_insurance/marine_subcategories.dart';
import 'package:isurance/menu/Forms/personal_accident_insurance/personalaccident_subcategories.dart';
import 'package:isurance/menu/Forms/travel_insurance/travel_subcategories.dart';
import 'package:isurance/menu/Policies.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Categories',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: GridView.count(
          mainAxisSpacing: 5,
          crossAxisCount: 2,
          crossAxisSpacing: 5,
          children: [
            InkWell(
              onTap: () {
                policyCategory = "Fire and general insurance";
//                Navigator.push(context,
//                    MaterialPageRoute(builder: (context) => Policies()));
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                decoration: BoxDecoration(
                  color: Colors.red[100],
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Image(
                      image: AssetImage('assets/fireandgeneralinsurance.png'),
                      height: 120,
                      width: 120,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Fire and General Insurance',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                policyCategory = "Marine insurance";
//                Navigator.push(context,
//                    MaterialPageRoute(builder: (context) => Policies()));
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                decoration: BoxDecoration(
                  color: Colors.blue[200],
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Image(
                      image: AssetImage('assets/marineinsurance.png'),
                      height: 120,
                      width: 120,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Marine Insurance',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                policyCategory = "Personal accident insurance";
//                Navigator.push(context,
//                    MaterialPageRoute(builder: (context) => Policies()));
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                decoration: BoxDecoration(
                  color: Colors.deepOrangeAccent[100],
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Image(
                      image: AssetImage('assets/personalaccidentinsurance.png'),
                      height: 120,
                      width: 120,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Personal Accident Insurance',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                policyCategory = "Travel insurance";
//                Navigator.push(context,
//                    MaterialPageRoute(builder: (context) => Policies()));
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                decoration: BoxDecoration(
                  color: Colors.lightGreen[100],
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Image(
                      image: AssetImage('assets/travelinsurance.png'),
                      height: 120,
                      width: 120,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Travel Insurance',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CarLocaiton()));
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                decoration: BoxDecoration(
                  color: Colors.red[100],
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Image(
                      image: AssetImage('assets/carinsurance.png'),
                      height: 140,
                      width: 140,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Car Insurance',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
//                Navigator.push(context,
//                    MaterialPageRoute(builder: (context) => Policies()));
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Image(
                      image: AssetImage('assets/Lifeinsurance.png'),
                      height: 140,
                      width: 140,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Life Insurance',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
//                Navigator.push(context,
//                    MaterialPageRoute(builder: (context) => Policies()));
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                decoration: BoxDecoration(
                  color: Colors.yellow[100],
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Image(
                      image: AssetImage('assets/propertyinsurance.png'),
                      height: 120,
                      width: 120,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Property Insurance',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePersonalInformaiton()));
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                decoration: BoxDecoration(
                  color: Colors.pink[100],
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Image(
                      image: AssetImage('assets/homeownersinsurance.png'),
                      height: 130,
                      width: 130,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Home owner Insurance',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 13),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
//                Navigator.push(context,
//                    MaterialPageRoute(builder: (context) => Policies()));
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                decoration: BoxDecoration(
                  color: Colors.cyan[100],
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Image(
                      image: AssetImage('assets/rentinsurance.png'),
                      height: 120,
                      width: 120,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Renter Insurance',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
//                Navigator.push(context,
//                    MaterialPageRoute(builder: (context) => Policies()));
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                decoration: BoxDecoration(
                  color: Colors.orange[100],
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Image(
                      image: AssetImage('assets/termlifeinsurance.png'),
                      height: 120,
                      width: 120,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Term Life Insurance',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
//                Navigator.push(context,
//                    MaterialPageRoute(builder: (context) => Policies()));
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                decoration: BoxDecoration(
                  color: Colors.brown[100],
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Image(
                      image: AssetImage('assets/long-termcareinsurance.png'),
                      height: 120,
                      width: 120,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Long-term Care Insurance',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
//                Navigator.push(context,
//                    MaterialPageRoute(builder: (context) => Policies()));
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Image(
                      image: AssetImage('assets/identitytheftinsurance.png'),
                      height: 120,
                      width: 120,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Identity theft Insurance',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 13),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
//                Navigator.push(context,
//                    MaterialPageRoute(builder: (context) => Policies()));
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                decoration: BoxDecoration(
                  color: Colors.green[100],
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Image(
                      image: AssetImage('assets/businessinsurance.png'),
                      height: 120,
                      width: 120,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Business Insurance',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
//                Navigator.push(context,
//                    MaterialPageRoute(builder: (context) => Policies()));
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                decoration: BoxDecoration(
                  color: Colors.indigo[100],
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Image(
                      image: AssetImage('assets/motorbikeinsurance.png'),
                      height: 120,
                      width: 120,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Motorbike Insurance',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
//                Navigator.push(context,
//                    MaterialPageRoute(builder: (context) => Policies()));
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                decoration: BoxDecoration(
                  color: Colors.purple[100],
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Image(
                      image: AssetImage('assets/cashinsafeinsurance.png'),
                      height: 120,
                      width: 120,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Cash in Safe Insurance',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
//                Navigator.push(context,
//                    MaterialPageRoute(builder: (context) => Policies()));
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                decoration: BoxDecoration(
                  color: Colors.red[100],
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Image(
                      image: AssetImage('assets/foreignworkersinsurance.png'),
                      height: 120,
                      width: 120,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Foreign Workers Insurance',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 13),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
//                Navigator.push(context,
//                    MaterialPageRoute(builder: (context) => Policies()));
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                decoration: BoxDecoration(
                  color: Colors.lightBlue[100],
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Image(
                      image:
                          AssetImage('assets/medicalmalpracticeinsurance.png'),
                      height: 120,
                      width: 120,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: 15),
                    Text(
                      'medical malpractice Insurance',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 13),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
//                Navigator.push(context,
//                    MaterialPageRoute(builder: (context) => Policies()));
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                decoration: BoxDecoration(
                  color: Colors.amber[100],
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Image(
                      image: AssetImage('assets/droneinsurance.png'),
                      height: 120,
                      width: 120,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Drone Insurance',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
//                Navigator.push(context,
//                    MaterialPageRoute(builder: (context) => Policies()));
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                decoration: BoxDecoration(
                  color: Colors.greenAccent[100],
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Image(
                      image: AssetImage('assets/naturaldisasterinsurance.png'),
                      height: 120,
                      width: 120,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Natural Disaster Insurance',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
//                Navigator.push(context,
//                    MaterialPageRoute(builder: (context) => Policies()));
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                decoration: BoxDecoration(
                  color: Colors.greenAccent[100],
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Image(
                      image: AssetImage('assets/thirdpartyinsurance.png'),
                      height: 120,
                      width: 120,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Third Party Insurance',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
