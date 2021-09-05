import 'package:flutter/material.dart';
import 'package:isurance/menu/Forms/travel_insurance/family_travel_insurance.dart';
import 'package:isurance/menu/Forms/travel_insurance/individual_travelInsurance_policy.dart';

class TravelSubcategories extends StatefulWidget {
  TravelSubcategories({Key key}) : super(key: key);

  @override
  _TravelSubcategoriesState createState() => _TravelSubcategoriesState();
}

class _TravelSubcategoriesState extends State<TravelSubcategories> {
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
                      'Individual Travel Insurance',
                      style: TextStyle(fontSize: 17),
                    ),
                onPressed: () {
                   Navigator.push(
                    context, MaterialPageRoute(builder: (context) => IndividualTravelInsurancePolicy()));
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
                      'Family travel Insurance',
                      style: TextStyle(fontSize: 17),
                    ),
                onPressed: () {
                   Navigator.push(
                    context, MaterialPageRoute(builder: (context) => FamilyTravelInsurance()));
                },
              ),
              
            ],
          ),
        ));
  }
}
