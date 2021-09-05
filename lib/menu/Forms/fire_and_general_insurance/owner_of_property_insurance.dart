import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter_country_picker/flutter_country_picker.dart';

class OwnerOfPropertyInsurance extends StatefulWidget {
  @override
  _OwnerOfPropertyInsuranceState createState() =>
      _OwnerOfPropertyInsuranceState();
}

class _OwnerOfPropertyInsuranceState
    extends State<OwnerOfPropertyInsurance> {
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

    Widget manufacturedcountryTextFormField() {
      return new Center(
        child: CountryPicker(
          dense: false,
          showFlag: true, //displays flag, true by default
          showDialingCode: false, //displays dialing code, false by default
          showName: true, //displays country name, true by default
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
              'Owner of property Insurance Policy',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 21.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Basic information',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Value of property',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 7),
            _input(
              "Value of property",
            ),
            SizedBox(height: 15),
            Text(
              'Value of home items',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 7),
            _input(
              "Value of home items",
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () => _selectstartDate(context), // Refer step 3
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
            Text(
              'Insurance period  |  1 year',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 25),
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
            SizedBox(height: 15),
            Text(
              'Name of beneficiary',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 7),
            _input(
              "Name of beneficiary",
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
              'Property information',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20),
            RaisedButton(
              padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              color: Colors.cyanAccent[700],
              textColor: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Type of property',
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
                _typeofpropertyBottomsheet(context);
              },
            ),
            SizedBox(height: 25),
            Text(
              'Country  |  Kuwait',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 25),
            Text(
              'Type of ownership  |  Owner',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 25),
            Text(
              'Address of property',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 7),
            _input(
              "Address",
            ),
            SizedBox(height: 25),
            Text(
              'Do you hav any item with a value exeeding 10,000KD?',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            Center(
              child: Row(
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
                      Text('Yes'),
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
                      Text('No'),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              'If yes, Please specify in detail.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 15),
            _detailinput('If yes, Specify in detail'),
            SizedBox(height: 25),
            Text(
              'Did you face any losses in the past year?',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            Center(
              child: Row(
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
                      Text('Yes'),
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
                      Text('No'),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
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

  _selectstartDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      helpText: 'Date of start of insurance',
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  _selectmanufactureDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      helpText: 'Boat manufactured date',
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  void _insurancecoverageamountBottomsheet(context) {
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
            height: 260,
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
                        '10,000 KD',
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Radio(value: 1, groupValue: 1, onChanged: null),
                      SizedBox(width: 10),
                      Text(
                        '30,000 KD',
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
                        '50,000 KD',
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Radio(value: 1, groupValue: 1, onChanged: null),
                      SizedBox(width: 10),
                      Text(
                        '100,000 KD',
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

  void _typeofpropertyBottomsheet(context) {
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
            height: 120,
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
                        'Villa',
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Radio(value: 1, groupValue: 1, onChanged: null),
                      SizedBox(width: 10),
                      Text(
                        'Apartment',
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
            height: 260,
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
                        'Fiber glass',
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Radio(value: 1, groupValue: 1, onChanged: null),
                      SizedBox(width: 10),
                      Text(
                        'Iron',
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Radio(value: 1, groupValue: 1, onChanged: null),
                      SizedBox(width: 10),
                      Text(
                        'Aluminum',
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Radio(value: 1, groupValue: 1, onChanged: null),
                      SizedBox(width: 10),
                      Text(
                        'Wood',
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Radio(value: 1, groupValue: 1, onChanged: null),
                      SizedBox(width: 10),
                      Text(
                        'Other',
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

Widget _detailinput(String hint) {
  return Container(
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
        maxLines: 5,
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
