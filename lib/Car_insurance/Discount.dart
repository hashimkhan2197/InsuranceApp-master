import 'package:flutter/material.dart';
import 'Driving_History.dart';
import 'Personal_information.dart';

class Discount extends StatefulWidget {
  Discount({Key key}) : super(key: key);

  @override
  _DiscountState createState() => _DiscountState();
}

class _DiscountState extends State<Discount> {
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
              'Do you have winter tires?',
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
              'Do you want to insure multiple vehicles?',
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
              'Are you retired?',
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
              'My Driving Discount?',
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
              'Have you taken a driver training course?',
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
              'Do you drive a hybrid vehicle?',
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
            InkWell(
              onTap: () {
//                Navigator.push(
//                  context,
//                  MaterialPageRoute(
//                    builder: (context) => DrivingHistory(),
//                  ),
//                );
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
