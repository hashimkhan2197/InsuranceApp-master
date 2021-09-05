import 'package:flutter/material.dart';
import 'package:isurance/menu/Forms/marine_insurance/Fishing_boat_insurance.dart';
import 'package:isurance/menu/Forms/marine_insurance/jet_ski_insurance.dart';
import 'package:isurance/menu/Forms/marine_insurance/motor_boat_insurance.dart';
import 'package:isurance/menu/Forms/marine_insurance/picnic_boat_insurance.dart';

class MarineSubcategories extends StatefulWidget {
  MarineSubcategories({Key key}) : super(key: key);

  @override
  _MarineSubcategoriesState createState() => _MarineSubcategoriesState();
}

class _MarineSubcategoriesState extends State<MarineSubcategories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        extendBodyBehindAppBar: true,
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: ListView(
            children: [
              SizedBox(height: 140),
              RaisedButton(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                color: Colors.cyanAccent[700],
                textColor: Colors.white,
                child: Text(
                      'Motor Boat',
                      style: TextStyle(fontSize: 17),
                    ),
                onPressed: () {
                   Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MotorBoatInsurance()));
                },
              ),
              SizedBox(height: 15),
              RaisedButton(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                color: Colors.cyanAccent[700],
                textColor: Colors.white,
                child: 
                    Text(
                      'Picnic Boat',
                      style: TextStyle(fontSize: 17),
                    ),
                onPressed: () {
                   Navigator.push(
                    context, MaterialPageRoute(builder: (context) => PicnicBoatInsurance()));
                },
              ),
              SizedBox(height: 15),
              RaisedButton(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                color: Colors.cyanAccent[700],
                textColor: Colors.white,
                child: Text(
                      'Fishing Boat',
                      style: TextStyle(fontSize: 17),
                    ),
                onPressed: () {
                   Navigator.push(
                    context, MaterialPageRoute(builder: (context) => FishingBoatInsurance()));
                },
              ),
              SizedBox(height: 15),
              RaisedButton(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                color: Colors.cyanAccent[700],
                textColor: Colors.white,
                child: 
                    Text(
                      'Jet Ski',
                      style: TextStyle(fontSize: 17),
                    ),
                onPressed: () {
                   Navigator.push(
                    context, MaterialPageRoute(builder: (context) => JetSkiInsurance()));
                },
              ),
            ],
          ),
        ));
  }
}
