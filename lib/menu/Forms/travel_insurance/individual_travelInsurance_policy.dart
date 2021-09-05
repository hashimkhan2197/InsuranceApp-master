import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter_country_picker/flutter_country_picker.dart';

class IndividualTravelInsurancePolicy extends StatefulWidget {
  @override
  _IndividualTravelInsurancePolicyState createState() =>
      _IndividualTravelInsurancePolicyState();
}

class _IndividualTravelInsurancePolicyState
    extends State<IndividualTravelInsurancePolicy> {
  //image picker
  File _image;
  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  @override
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

  DateTime _dateTime;
  DateTime selectedDate = DateTime.now();
  Country _selected;

  //payment options
  bool card = false;
  bool cashondelivery = false;

  bool terms = false;

  Widget build(BuildContext context) {
    Future<File> pickImage(BuildContext context, ImageSource source) async {
      File selected = (await ImagePicker.pickImage(
        source: source,
        imageQuality: 20,
      )) as File;
      return selected;
    }

    ////////Call this Function ///////////////
    Future<void> _showdialogbox(BuildContext context) {
      //select camera or gallery
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Take a Picture"),
              content: SingleChildScrollView(
                child: ListBody(
                  children: [
                    GestureDetector(
                      onTap: () async {
                        await pickImage(context, ImageSource.gallery);

                        Navigator.pop(context);
                      },
                      child: Text("Open Galley"),
                    ),
                    Padding(padding: EdgeInsets.all(10.0)),
                    GestureDetector(
                      onTap: () async {
                        await pickImage(context, ImageSource.camera);

                        Navigator.pop(context);
                      },
                      child: Text("Open Camera"),
                    ),
                  ],
                ),
              ),
            );
          });
    }

    Widget countryTextFormField() {
      return new Center(
        child: CountryPicker(
          dense: false,
          showFlag: true, //displays flag, true by default
          showDialingCode: true, //displays dialing code, false by default
          showName: false, //displays country name, true by default
          showCurrency: false, //eg. 'British pound'
          showCurrencyISO: false, //eg. 'GBP'
          onChanged: (Country country) {
            setState(() {
              _selected = country;
            });
          },
          selectedCountry: _selected,
        ),
      );
    }

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
            Text(
              'Individual Travel Insurance Policy',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 23.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Travel information',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Travel Destination',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 7),
            _input(
              "Travel Destination",
            ),
            SizedBox(height: 25),
            GestureDetector(
              onTap: () => _selectDate(context), // Refer step 3
              child: Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.cyanAccent[700])),
                  ),
                  child: Center(
                    child: Text(
                      'Date of start of insurance',
                      style: TextStyle(
                        color: Colors.cyanAccent[700],
                        fontSize: 17.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 25),
            RaisedButton(
              padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              color: Colors.cyanAccent[700],
              textColor: Colors.white,
              child: Text(
                'TIME OF TRIP',
                style: TextStyle(fontSize: 17),
              ),
              onPressed: () {
                _selecttimeoftripBottomsheet(context);
              },
            ),
            SizedBox(height: 20),
            Divider(
              color: Colors.brown,
            ),
            SizedBox(height: 20),
            Text(
              'Personal information',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 15),
            Text(
              'First name',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 7),
            _input(
              "First name",
            ),
            SizedBox(height: 15),
            Text(
              'Family name',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 7),
            _input(
              "Family name",
            ),
            SizedBox(height: 25),
            Text(
              'Gender',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Radio(
                        value: 1,
                        groupValue: selectedRadio,
                        activeColor: Colors.cyanAccent[700],
                        onChanged: (val) {
                          print("Radio $val");
                          setSelectedRadio(val);
                        },
                      ),
                      Text('Male'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(
                        value: 2,
                        groupValue: selectedRadio,
                        activeColor: Colors.cyanAccent[700],
                        onChanged: (val) {
                          print("Radio $val");
                          setSelectedRadio(val);
                        },
                      ),
                      Text('Female'),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 15),
            RaisedButton(
              padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              color: Colors.cyanAccent[700],
              textColor: Colors.white,
              child: Text("DATE OF BIRTH",
                  style: TextStyle(
                    fontSize: 18.0,
                  )),
              onPressed: () => _selectDate(context),
            ),
            SizedBox(height: 25),
            Text(
              'Nationality',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 7),
            _input(
              "Nationality",
            ),
            SizedBox(height: 15),
            Text(
              'National ID Number',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 7),
            _input(
              "National ID number",
            ),
            SizedBox(height: 20),
            Text(
              'Picture of National ID',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 7),
            InkWell(
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 10,
                          offset: Offset(2, 2))
                    ]),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 70),
                      Icon(
                        Icons.photo_camera,
                        color: Colors.grey[400],
                        size: 30,
                      ),
                      Text(
                        'Picture of front of National ID',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {
                _showdialogbox(context);
              },
            ),
            SizedBox(height: 7),
            InkWell(
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 10,
                          offset: Offset(2, 2))
                    ]),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 70),
                      Icon(
                        Icons.photo_camera,
                        color: Colors.grey[400],
                        size: 30,
                      ),
                      Text(
                        'Picture of back of National ID',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              onTap: () {
                _showdialogbox(context);
              },
            ),
            SizedBox(height: 15),
            Text(
              'Passport number',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 7),
            _input(
              "Passport number",
            ),
            SizedBox(height: 15),
            Text(
              'Phone number',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 7),
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
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
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  countryTextFormField(),
                  SizedBox(width: 10),
                  _textInput('Phone Number'),
                ],
              ),
            ),
            SizedBox(height: 15),
            Text(
              'Email address',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 7),
            _input(
              "email@email.com",
            ),
            SizedBox(height: 40),
            Divider(
              color: Colors.brown,
            ),
            SizedBox(height: 20),
            Text(
              'Checkout info',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 15),
            Text(
              'Delivery address',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 7),
            _input(
              "Delivery address",
            ),
            SizedBox(height: 15),
            Text(
              'Payment option',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            Row(
              children: <Widget>[
                Row(
                  children: [
                    Checkbox(
                      activeColor: Colors.cyanAccent[700],
                      checkColor: Colors.white,
                      value: card,
                      onChanged: (bool value) {
                        setState(() {
                          card = value;
                        });
                      },
                    ),
                    Text(
                      'Card',
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
                      value: cashondelivery,
                      onChanged: (bool value) {
                        setState(() {
                          cashondelivery = value;
                        });
                      },
                    ),
                    Text(
                      'Cash on delivery',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    )
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(
                  activeColor: Colors.cyanAccent[700],
                  checkColor: Colors.white,
                  value: terms,
                  onChanged: (bool value) {
                    setState(() {
                      terms = value;
                    });
                  },
                ),
                Text(
                  'Agree on terms and conditions',
                  style: TextStyle(fontSize: 15, color: Colors.grey),
                )
              ],
            ),
            SizedBox(height: 25),
            RaisedButton(
              padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              color: Colors.cyanAccent[700],
              textColor: Colors.white,
              child: Text(
                'Confirm',
                style: TextStyle(fontSize: 17),
              ),
              onPressed: () {},
            ),
            SizedBox(height: 25),
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
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  void _selecttimeoftripBottomsheet(context) {
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
            height: 280,
            //height: MediaQuery.of(context).size.height * 80,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ListView(
                children: [
                  Row(
                    children: [
                      Radio(value: 1, groupValue: 1, onChanged: null),
                      SizedBox(width: 10),
                      Text(
                        '7 Days',
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Radio(value: 1, groupValue: 1, onChanged: null),
                      SizedBox(width: 10),
                      Text(
                        '15 Days',
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Radio(value: 1, groupValue: 1, onChanged: null),
                      SizedBox(width: 10),
                      Text(
                        '30 Days',
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Radio(value: 1, groupValue: 1, onChanged: null),
                      SizedBox(width: 10),
                      Text(
                        '60 Days',
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Radio(value: 1, groupValue: 1, onChanged: null),
                      SizedBox(width: 10),
                      Text(
                        '90 Days',
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Radio(value: 1, groupValue: 1, onChanged: null),
                      SizedBox(width: 10),
                      Text(
                        '180 Days',
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Radio(value: 1, groupValue: 1, onChanged: null),
                      SizedBox(width: 10),
                      Text(
                        '1 Year',
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Radio(value: 1, groupValue: 1, onChanged: null),
                      SizedBox(width: 10),
                      Text(
                        '2 Years',
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

Widget _textInput(String hint) {
  return Container(
    width: 180,
    height: 60,
    margin: EdgeInsets.only(top: 6, bottom: 0),
    decoration: BoxDecoration(),
    //padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
    child: TextFormField(
      keyboardType: TextInputType.phone,
      //controller: controller,
      decoration: InputDecoration(
        hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
        border: InputBorder.none,
        hintText: hint,
      ),
    ),
  );
}
