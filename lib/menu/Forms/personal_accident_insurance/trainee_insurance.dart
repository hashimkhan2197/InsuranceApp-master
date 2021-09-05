import 'package:flutter/material.dart';
import 'package:flutter_country_picker/flutter_country_picker.dart';

class TraineeInsurance extends StatefulWidget {
  @override
  _TraineeInsuranceState createState() =>
      _TraineeInsuranceState();
}

class _TraineeInsuranceState
    extends State<TraineeInsurance> {
 
  DateTime selectedDate = DateTime.now();
  Country _selected;

  //payment options
  bool card = false;
  bool cashondelivery = false;

  bool terms = false;

  Widget build(BuildContext context) {
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
              'Trainee Insurance Policy',
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
                    'Insurance coverage amount',
                    style: TextStyle(fontSize: 17),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.arrow_drop_down,color: Colors.white,),
                ],
              ),
              onPressed: () {
                _insurancecoverageamountBottomsheet(context);
              },
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () => _selectDateofbirth(context), // Refer step 3
              child: Padding(
                padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(color: Colors.cyanAccent[700])),
                  ),
                  child: Center(
                    child: Text(
                      'Date of birth',
                      style: TextStyle(
                        color: Colors.cyanAccent[700],
                        fontSize: 17.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),SizedBox(height: 25),
            Text(
              'Age  |  18 years old',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17.0,
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
                    'Insurance period',
                    style: TextStyle(fontSize: 17),
                  ),
                  SizedBox(width: 10),
                  Icon(Icons.arrow_drop_down,color: Colors.white,),
                ],
              ),
              onPressed: () {
                _insuranceperiodBottomsheet(context);
              },
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
              'Expiry of insurance  |  jan 15, 2022',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 20),
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
              'Last name',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 7),
            _input(
              "Last name",
            ),
            SizedBox(height: 15),
            Text(
              'Beneficiary name',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 7),
            _input(
              "Beneficiary name",
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
            SizedBox(height: 15),
            Text(
              'Passport Number',
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

  _selectDateofbirth(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      helpText: 'Date of birth',
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
            height: 160,
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
                        'Up to 5,000 KD',
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Radio(value: 1, groupValue: 1, onChanged: null),
                      SizedBox(width: 10),
                      Text(
                        'Up to 10,000 KD',
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Radio(value: 1, groupValue: 1, onChanged: null),
                      SizedBox(width: 10),
                      Text(
                        'Up to 15,000 KD',
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
  void _insuranceperiodBottomsheet(context) {
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
                        '15 days',
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Radio(value: 1, groupValue: 1, onChanged: null),
                      SizedBox(width: 10),
                      Text(
                        '1 month',
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Radio(value: 1, groupValue: 1, onChanged: null),
                      SizedBox(width: 10),
                      Text(
                        '3 months',
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Radio(value: 1, groupValue: 1, onChanged: null),
                      SizedBox(width: 10),
                      Text(
                        '6 months',
                        style: TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Radio(value: 1, groupValue: 1, onChanged: null),
                      SizedBox(width: 10),
                      Text(
                        '1 year',
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
