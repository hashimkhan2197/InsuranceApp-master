import 'package:flutter/material.dart';
import 'package:isurance/menu/Forms/fire_and_general_insurance/occupant_of_property_insurance.dart';
import 'package:isurance/menu/Forms/fire_and_general_insurance/owner_of_property_insurance.dart';

class FireAndGeneralSubcategories extends StatefulWidget {
  FireAndGeneralSubcategories({Key key}) : super(key: key);

  @override
  _FireAndGeneralSubcategoriesState createState() => _FireAndGeneralSubcategoriesState();
}

class _FireAndGeneralSubcategoriesState extends State<FireAndGeneralSubcategories> {
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
                      'Occupant of Property',
                      style: TextStyle(fontSize: 17),
                    ),
                onPressed: () {
                   Navigator.push(
                    context, MaterialPageRoute(builder: (context) => OccupantOfPropertyInsurance()));
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
                      'Owner of Property',
                      style: TextStyle(fontSize: 17),
                    ),
                onPressed: () {
                   Navigator.push(
                    context, MaterialPageRoute(builder: (context) => OwnerOfPropertyInsurance()));
                },
              ),
            ],
          ),
        ));
  }
}
