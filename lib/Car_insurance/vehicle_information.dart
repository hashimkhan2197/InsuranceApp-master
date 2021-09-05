import 'package:flutter/material.dart';
import 'Driving_History.dart';
import 'Personal_information.dart';

class VehicleInformation extends StatefulWidget {
  VehicleInformation({Key key}) : super(key: key);

  @override
  _VehicleInformationState createState() => _VehicleInformationState();
}

class _VehicleInformationState extends State<VehicleInformation> {
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
            SizedBox(height: 30),
            Text(
              'VEHICLE INFORMAITON',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(height: 70),
            Text(
              'When did you buy the vehicle?',
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
            SizedBox(height: 30),
            Text(
              'How many kilometers do you drive in an average year?',
              //textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(height: 10),
            _input('e.g. 25,000'),
            SizedBox(height: 50),
            Text(
              'Do you have daily commute?(Do you drive to, work School or a public transit station?)',
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
            SizedBox(height: 50),
            Text(
              'How many km one way to school?',
              //textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w300,
              ),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
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
                      'Select Kelometers',
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
                  _shipmaterialBottomsheet(context);
                },
              ),
            ),
            SizedBox(height: 70),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DrivingHistory(),
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

  void _shipmaterialBottomsheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return Container(
          color: Color(0xFF737373),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              //border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(10),
                topRight: const Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 5,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            height: 300,
            //height: MediaQuery.of(context).size.height * 80,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: ListView(
                children: [
                  Row(
                    children: [
                      Radio(value: 1, groupValue: 1, onChanged: null),
                      SizedBox(width: 10),
                      Text(
                        '1',
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Radio(value: 1, groupValue: 1, onChanged: null),
                      SizedBox(width: 10),
                      Text(
                        '5',
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Radio(value: 1, groupValue: 1, onChanged: null),
                      SizedBox(width: 10),
                      Text(
                        '10',
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Radio(value: 1, groupValue: 1, onChanged: null),
                      SizedBox(width: 10),
                      Text(
                        '15',
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Radio(value: 1, groupValue: 1, onChanged: null),
                      SizedBox(width: 10),
                      Text(
                        '20',
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Radio(value: 1, groupValue: 1, onChanged: null),
                      SizedBox(width: 10),
                      Text(
                        '25+',
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      helpText: 'When did you buy the vehicle',
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
}

Widget _input(String hint) {
  return Container(
    height: 60,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 10,
              offset: Offset(2, 2))
        ]),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(10, 8, 15, 0),
      child: TextFormField(
        decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.grey[600], fontSize: 13),
            //labelText: label,
            hintText: hint,
            focusColor: Colors.grey,

            //fillColor: Colors.white,

            fillColor: Colors.white),
        //keyboardType: TextInputType.emailAddress,
        style: TextStyle(
          fontFamily: "Poppins",
        ),
      ),
    ),
  );
}
