import 'package:flutter/material.dart';
import 'package:isurance/menu/Forms/personal_accident_insurance/maid_or_homeworker_insurance.dart';
import 'package:isurance/menu/Forms/personal_accident_insurance/student_insurance.dart';
import 'package:isurance/menu/Forms/personal_accident_insurance/trainee_insurance.dart';

class PersonalAccidentSubcategories extends StatefulWidget {
  PersonalAccidentSubcategories({Key key}) : super(key: key);

  @override
  _PersonalAccidentSubcategoriesState createState() => _PersonalAccidentSubcategoriesState();
}

class _PersonalAccidentSubcategoriesState extends State<PersonalAccidentSubcategories> {
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
                      'Student Insurance',
                      style: TextStyle(fontSize: 17),
                    ),
                onPressed: () {
                   Navigator.push(
                    context, MaterialPageRoute(builder: (context) => StudentInsurance()));
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
                      'Trainee Insurance',
                      style: TextStyle(fontSize: 17),
                    ),
                onPressed: () {
                   Navigator.push(
                    context, MaterialPageRoute(builder: (context) => TraineeInsurance()));
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
                      'Maid or Homeworker',
                      style: TextStyle(fontSize: 17),
                    ),
                onPressed: () {
                   Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MaidOrHomeworkerInsurance()));
                },
              ),
            ],
          ),
        ));
  }
}
