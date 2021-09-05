import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_country_picker/flutter_country_picker.dart';
import 'package:intl/intl.dart';
import 'package:isurance/Admin_panel/policies/PolicyModel.dart';
import 'package:isurance/Login_signup/UserModel.dart';

class StudentInsurance extends StatefulWidget {
  @override
  _StudentInsuranceState createState() => _StudentInsuranceState();
}

class _StudentInsuranceState extends State<StudentInsurance> {
  DateTime policystartDate = DateTime.now();
  DateTime policyEndDate;
  DateTime dateOfBirth = DateTime.now();
  Country _selected;
  bool countryCodeSelected = false;
  String userAge = "0";
  String policyPeriod;
  int policyPeriodinDays = 0;
  bool _loading = false;

  String paymentOption = "Card";
  TextEditingController firstNameController = new TextEditingController();
  TextEditingController lastNameController = new TextEditingController();
  TextEditingController beneficiaryNameController = new TextEditingController();
  TextEditingController nationalIdCardController = new TextEditingController();
  TextEditingController passportNumberController = new TextEditingController();
  TextEditingController phoneNumberController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  final _formKey = GlobalKey<FormState>();

  //payment options
  bool card = true;
  bool cashondelivery = false;

  bool terms = false;
  String insuranceAmount = "0";

  @override
  void dispose() {
    // TODO: implement dispose
    firstNameController.dispose();
    lastNameController.dispose();
    beneficiaryNameController.dispose();
    nationalIdCardController.dispose();
    emailController.dispose();
    passportNumberController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();

    super.dispose();
  }

  @override
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
              countryCodeSelected = true;
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
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text(
                policyDetailsFromList.policySubCategory,
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
                    Container(
                      child: insuranceAmount == "0"
                          ? Text(
                              'Insurance coverage amount',
                              style: TextStyle(fontSize: 17),
                            )
                          : Text(
                              "Upto " + insuranceAmount + " KD",
                              style: TextStyle(fontSize: 17),
                            ),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                    ),
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
                    child: userAge == "0"
                        ? Center(
                            child: Text(
                              'Date of birth',
                              style: TextStyle(
                                color: Colors.cyanAccent[700],
                                fontSize: 17.0,
                              ),
                            ),
                          )
                        : Center(
                            child: Text(
                              DateFormat('dd-MM-yyyy')
                                  .format(dateOfBirth)
                                  .toString(),
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
                'Age  | ' + userAge + ' years old',
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
                    Container(
                      child: policyPeriod == null
                          ? Text(
                              'Insurance period',
                              style: TextStyle(fontSize: 17),
                            )
                          : Text(
                              policyPeriod,
                              style: TextStyle(fontSize: 17),
                            ),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.arrow_drop_down,
                      color: Colors.white,
                    ),
                  ],
                ),
                onPressed: () {
                  _insuranceperiodBottomsheet(context);
                },
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  if (policyPeriodinDays != 0)
                    _selectstartDate(context);
                  else {
                    showDialog(
                        context: context,
                        builder:(context){return AlertDialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(18.0),
                              side: BorderSide(
                                color: Colors.red,
                              )),
                          title: Text("First select insurance period."),
                          actions: <Widget>[
                            FlatButton(
                              child: Text(
                                "OK",
                                style: TextStyle(color: Colors.red),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            )
                          ],
                        );});
                  }
                }, // Refer step 3
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(color: Colors.cyanAccent[700])),
                    ),
                    child: policyEndDate == null
                        ? Center(
                            child: Text(
                              'Date of start of insurance',
                              style: TextStyle(
                                color: Colors.cyanAccent[700],
                                fontSize: 17.0,
                              ),
                            ),
                          )
                        : Center(
                            child: Text(
                              DateFormat('dd-MM-yyyy')
                                  .format(policystartDate)
                                  .toString(),
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
              Container(
                child: policyEndDate != null
                    ? Text(
                        'Expiry of insurance  |  ' +
                            DateFormat('dd-MM-yyyy')
                                .format(policyEndDate)
                                .toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    : Text(
                        'Expiry of insurance  |  00-00-00',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.w500,
                        ),
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
              _input("First name", firstNameController),
              SizedBox(height: 15),
              Text(
                'Last name',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 7),
              _input("Last name", lastNameController),
              SizedBox(height: 15),
              Text(
                'Beneficiary name',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 7),
              _input("Beneficiary name", beneficiaryNameController),
              SizedBox(height: 15),
              Text(
                'National ID Number',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 7),
              _input("National ID number", nationalIdCardController),
              SizedBox(height: 15),
              Text(
                'Passport Number',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 7),
              _input("Passport number", passportNumberController),
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
                    _textInput('Phone Number', phoneNumberController),
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
              _input("email@email.com", emailController),
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
                            paymentOption = "Card";
                            card = true;
                            cashondelivery = false;
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
                            paymentOption = "Cash On Delivery";
                            card = false;
                            cashondelivery = true;
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
                child: Container(
                  child: _loading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Text(
                          'Confirm',
                          style: TextStyle(fontSize: 17),
                        ),
                ),
                onPressed: () => applyForPolicy(),
              ),
              SizedBox(height: 25),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> applyForPolicy() async {
    if (insuranceAmount != "0" &&
        userAge != "0" &&
        policyPeriodinDays != 0 &&
        policyEndDate != null &&
        countryCodeSelected &&
        terms &&
        _formKey.currentState.validate()) {
      setState(() {
        _loading = true;
      });
      print("hiiii");
      await Firestore.instance.collection("Applications").add({
        "PolicyCompany": policyDetailsFromList.policyCompnay,
        "PolicyCountry": policyDetailsFromList.policyCountry,
        "PolicyDescription": policyDetailsFromList.policyDescription,
        "PolicyImage": policyDetailsFromList.policyImage,
        "PolicyPeriod": policyDetailsFromList.policyPeriod,
        "TermsAndConditions": policyDetailsFromList.policyTerms,
        "PolicyPrice": policyDetailsFromList.policyprice,
        "PolicyTittle": policyDetailsFromList.policytiitle,
        "PolicyCompanyImage": policyDetailsFromList.policyCompanyImage,
        "PolicyDocId": policyDetailsFromList.policyDocID,
        "Approved": false,
        "Pending": true,
        "Rejected": false,
        "PolicyCategory": policyDetailsFromList.policyCategory,
        "PolicySubCategory": policyDetailsFromList.policySubCategory,
        "StartingDate": policystartDate.toString(),
        "EndingDate": policyEndDate.toString(),
        "UserUid": userDetails.userUid,
        "UserEmail": userDetails.userEmail,
        "InsuranceCoverageAmount": insuranceAmount,
        "UserDateOfBirth": dateOfBirth,
        "UserAge": userAge,
        "InsurancePeriod": policyPeriodinDays,
        "FormUserFirstName": firstNameController.text,
        "FormUserLastName": lastNameController.text,
        "FormBeneficiaryName": beneficiaryNameController.text,
        "FormUserNIC": nationalIdCardController.text,
        "FormUserPassportNumber": passportNumberController.text,
        "FormUserPhoneNumber":
            _selected.dialingCode + phoneNumberController.text,
        "FormUserEmail": emailController.text,
        "PaymentOption": paymentOption,
      });
      setState(() {
        _loading = false;
      });

      Navigator.pop(context);
    } else {
      showDialog(
          context: context,
          builder:(context){return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0),
                side: BorderSide(
                  color: Colors.red,
                )),
            title: Text("Incomplete Form!!!"),
            actions: <Widget>[
              FlatButton(
                child: Text(
                  "OK",
                  style: TextStyle(color: Colors.red),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );});
    }
  }

  _selectstartDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: policystartDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2050),
      helpText: 'Date of start of insurance',
    );
    if (picked != null)
      setState(() {
        policystartDate = picked;
        policyEndDate = policystartDate.add(Duration(days: policyPeriodinDays));
      });
  }

  _selectDateofbirth(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: dateOfBirth,
      firstDate: DateTime(1900),
      lastDate: DateTime(2035),
      helpText: 'Date of birth',
    );
    if (picked != null && picked != dateOfBirth)
      setState(() {
        dateOfBirth = picked;

        userAge = (DateTime.now().difference(dateOfBirth).inDays / 365)
            .floor()
            .toString();
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
                  InkWell(
                    onTap: () {
                      setState(() {
                        insuranceAmount = "5000";
                      });
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          Text(
                            'Up to 5,000 KD',
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.red,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        insuranceAmount = "10000";
                      });
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          Text(
                            'Up to 10,000 KD',
                            style: TextStyle(fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.red,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        insuranceAmount = "15000";
                      });
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          Text(
                            'Up to 15,000 KD',
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.red,
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
                  InkWell(
                    onTap: () {
                      setState(() {
                        policyPeriodinDays = 15;
                        policyPeriod = '15 days';
                      });
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          Text(
                            '15 days',
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.red,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        policyPeriodinDays = 30;
                        policyPeriod = '1 month';
                      });
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          Text(
                            '1 month',
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.red,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        policyPeriodinDays = 90;
                        policyPeriod = '3 month';
                      });
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          Text(
                            '3 month',
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.red,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        policyPeriodinDays = 180;
                        policyPeriod = '6 month';
                      });
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          Text(
                            '6 month',
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.red,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        policyPeriodinDays = 365;
                        policyPeriod = '1 year';
                      });
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          Text(
                            '1 year',
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.red,
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

Widget _input(String hint, controller) {
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
        controller: controller,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.grey[600], fontSize: 14),
            hintText: hint,
            focusColor: Colors.grey,
            fillColor: Colors.white),
        validator: (val) {
          if (val.length == 0) {
            return "This field cannot be empty";
          } else {
            return null;
          }
        },
        style: TextStyle(
          fontFamily: "Poppins",
        ),
      ),
    ),
  );
}

Widget _textInput(String hint, controller) {
  return Container(
    width: 180,
    height: 60,
    margin: EdgeInsets.only(top: 6, bottom: 0),
    decoration: BoxDecoration(),
    //padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
    child: TextFormField(
      controller: controller,
      decoration: InputDecoration(
          border: InputBorder.none,
          hintStyle: TextStyle(color: Colors.grey[600], fontSize: 14),
          hintText: hint,
          focusColor: Colors.grey,
          fillColor: Colors.white),
      validator: (val) {
        if (val.length == 0) {
          return "This field cannot be empty";
        } else {
          return null;
        }
      },
      style: TextStyle(
        fontFamily: "Poppins",
      ),
    ),
  );
}
