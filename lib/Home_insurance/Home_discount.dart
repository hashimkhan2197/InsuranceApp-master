import 'package:flutter/material.dart';
//import 'package:forms/Car_insurance/Driving_History.dart';
//import 'package:forms/Car_insurance/Personal_information.dart';
import 'suggested_rate.dart';

class HomeDiscount extends StatefulWidget {
  HomeDiscount({Key key}) : super(key: key);

  @override
  _HomeDiscountState createState() => _HomeDiscountState();
}

class _HomeDiscountState extends State<HomeDiscount> {
  int selectedRadio;

  @override
  void initState() {
    super.initState();
    selectedRadio = 0;
  }

// Changes the selected value on 'onChanged' click on each radio button
  setSelectedRadio(int val) {
    setState(() {
      selectedRadio = val;
    });
  }

  //payment options
  bool yes = false;
  bool no = false;

  bool terms = false;

  DateTime _dateTime;
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: ListView(
          children: [
            SizedBox(height: 0),
            Text(
              'Discount',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(height: 50),
            Text(
              'Do you want to insure your home and your vehicle',
              //textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                Row(
                  children: [
                    Checkbox(
                      activeColor: Colors.cyanAccent[700],
                      checkColor: Colors.white,
                      value: yes,
                      onChanged: (bool value) {
                        setState(() {
                          yes = value;
                        });
                      },
                    ),
                    Text(
                      'Yes',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    )
                  ],
                ),
                SizedBox(width: 20),
                Row(
                  children: [
                    Checkbox(
                      activeColor: Colors.cyanAccent[700],
                      checkColor: Colors.white,
                      value: no,
                      onChanged: (bool value) {
                        setState(() {
                          no = value;
                        });
                      },
                    ),
                    Text(
                      'No',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),
            Text(
              'Do you have a monitered security system?',
              //textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                Row(
                  children: [
                    Checkbox(
                      activeColor: Colors.cyanAccent[700],
                      checkColor: Colors.white,
                      value: yes,
                      onChanged: (bool value) {
                        setState(() {
                          yes = value;
                        });
                      },
                    ),
                    Text(
                      'Yes',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    )
                  ],
                ),
                SizedBox(width: 20),
                Row(
                  children: [
                    Checkbox(
                      activeColor: Colors.cyanAccent[700],
                      checkColor: Colors.white,
                      value: no,
                      onChanged: (bool value) {
                        setState(() {
                          no = value;
                        });
                      },
                    ),
                    Text(
                      'No',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),
            Text(
              'Smoke-free household?',
              //textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: <Widget>[
                Row(
                  children: [
                    Checkbox(
                      activeColor: Colors.cyanAccent[700],
                      checkColor: Colors.white,
                      value: yes,
                      onChanged: (bool value) {
                        setState(() {
                          yes = value;
                        });
                      },
                    ),
                    Text(
                      'Yes',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    )
                  ],
                ),
                SizedBox(width: 20),
                Row(
                  children: [
                    Checkbox(
                      activeColor: Colors.cyanAccent[700],
                      checkColor: Colors.white,
                      value: no,
                      onChanged: (bool value) {
                        setState(() {
                          no = value;
                        });
                      },
                    ),
                    Text(
                      'No',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),
            Text(
              'Coverage Effective Date?',
              //textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w300,
              ),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(100, 15, 100, 15),
              child: RaisedButton(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                color: Colors.cyanAccent[700],
                textColor: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Select Date',
                      style: TextStyle(fontSize: 17),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                    ),
                  ],
                ),
                onPressed: () {
                  _selectDate(context);
                },
              ),
            ),
            SizedBox(height: 50),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeSuggestedRate(),
                  ),
                );
              },
              child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.cyanAccent[700],
                  ),
                  child: Icon(
                    Icons.navigate_next,
                    color: Colors.white,
                    size: 40,
                  )),
            )
          ],
        ),
      ),
    );
  }
  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      helpText: 'Select Date',
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
}

