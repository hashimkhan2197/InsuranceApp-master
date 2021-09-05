import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter_country_picker/flutter_country_picker.dart';
import 'package:isurance/Admin_panel/policies/PolicyModel.dart';
import 'package:intl/intl.dart';
import 'package:isurance/Login_signup/UserModel.dart';

class OccupantOfPropertyInsurance extends StatefulWidget {
  @override
  _OccupantOfPropertyInsuranceState createState() =>
      _OccupantOfPropertyInsuranceState();
}

class _OccupantOfPropertyInsuranceState
    extends State<OccupantOfPropertyInsurance> {
  //image picker
  File _image;

  File _imagePolicy;

  bool _imagecheck = false;

  bool _picUploading = false;

  bool piccheck = false;
  bool _loading = false;

  String _cnicFront;
  String _cnicBack;

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
  DateTime policystartDate = DateTime.now();
  bool dateSelected = false;
  Country _selected;
  bool countryCodeSelected = false;
  bool itemExceding10k = false;
  String paymentOption = "Card";

  bool yes10k = false;
  bool no10k = true;
  bool yesloss = false;
  bool noloss = true;

  //payment options
  bool card = true;
  bool cashondelivery = false;

  bool terms = false;
  String typeOfProperty = "";

  TextEditingController valueOfPropertyController = new TextEditingController();
  TextEditingController valueOfHomeItemsController =
      new TextEditingController();
  TextEditingController firstNameController = new TextEditingController();
  TextEditingController familyNameController = new TextEditingController();
  TextEditingController beneficiaryNameController = new TextEditingController();
  TextEditingController nationalIdCardController = new TextEditingController();
  TextEditingController nationalityController = new TextEditingController();
  TextEditingController passportNumberController = new TextEditingController();
  TextEditingController phoneNumberController = new TextEditingController();
  TextEditingController propertyAddressController = new TextEditingController();
  TextEditingController itemDetailsController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    firstNameController.dispose();
    familyNameController.dispose();
    beneficiaryNameController.dispose();
    propertyAddressController.dispose();
    itemDetailsController.dispose();

    nationalityController.dispose();
    nationalIdCardController.dispose();
    emailController.dispose();
    passportNumberController.dispose();
    phoneNumberController.dispose();
    emailController.dispose();

    super.dispose();
  }

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
              countryCodeSelected = true;
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
        child: _picUploading
            ? Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 28.0),
                      child: Text(
                        'Uploading image ....',
                        style: TextStyle(
                          color: Colors.cyanAccent[700],
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                    CircularProgressIndicator()
                  ],
                ),
              )
            : Form(
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
                    Text(
                      'Value of property',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 7),
                    _input("Value of property", valueOfPropertyController),
                    SizedBox(height: 15),
                    Text(
                      'Value of home items',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 7),
                    _input("Value of home items", valueOfHomeItemsController),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () => _selectstartDate(context), // Refer step 3
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(color: Colors.cyanAccent[700])),
                          ),
                          child: Center(
                            child: dateSelected
                                ? Text(
                                    'Date of start of insurance  |  ' +
                                        DateFormat('dd-MM-yyyy')
                                            .format(policystartDate)
                                            .toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.cyanAccent[700],
                                      fontSize: 17.0,
                                    ),
                                  )
                                : Text(
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
                    _input("First name", firstNameController),
                    SizedBox(height: 15),
                    Text(
                      'Family name',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 7),
                    _input("Family name", familyNameController),
                    SizedBox(height: 15),
                    Text(
                      'Name of beneficiary',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 7),
                    _input("Name of beneficiary", beneficiaryNameController),
                    SizedBox(height: 25),
                    Text(
                      'Nationality',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 7),
                    _input("Nationality", nationalityController),
                    SizedBox(height: 15),
                    Text(
                      'National ID Number',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 7),
                    _input("National ID number", nationalIdCardController),
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  blurRadius: 10,
                                  offset: Offset(2, 2))
                            ]),
                        child: _cnicFront != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)),
                                child: Image(
                                  image: NetworkImage(_cnicFront),
                                  width: MediaQuery.of(context).size.width,
                                  height: 180,
                                  fit: BoxFit.fill,
                                ),
                              )
                            : Center(
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
                      onTap: () async {
                        _imagePolicy =
                            await pickImage(context, ImageSource.gallery);
                        setState(() {
                          piccheck = true;
                        });
                        if (_imagePolicy != null) {
                          print("HII");
                          setState(() {
                            _picUploading = true;
                          });
                          final FirebaseStorage _storgae = FirebaseStorage(
                              storageBucket:
                                  'gs://insurance-app-515f9.appspot.com');
                          print("HII");
                          StorageUploadTask uploadTask;
                          String filePath = '${DateTime.now()}.png';
                          uploadTask = _storgae
                              .ref()
                              .child(filePath)
                              .putFile(_imagePolicy);
                          uploadTask.onComplete.then((_) async {
                            print(1);
                            String url1 = await uploadTask.lastSnapshot.ref
                                .getDownloadURL();
                            _imagePolicy.delete().then((onValue) {
                              print(2);
                            });
                            setState(() {
                              _imagecheck = true;
                              _picUploading = false;
                            });
                            print(url1);

                            _cnicFront = url1;
                          });
                        }
                      },
                    ),
                    SizedBox(height: 7),
                    InkWell(
                      child: Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  blurRadius: 10,
                                  offset: Offset(2, 2))
                            ]),
                        child: _cnicBack != null
                            ? ClipRRect(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10)),
                                child: Image(
                                  image: NetworkImage(_cnicBack),
                                  width: MediaQuery.of(context).size.width,
                                  height: 180,
                                  fit: BoxFit.fill,
                                ),
                              )
                            : Center(
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
                      onTap: () async {
                        _imagePolicy =
                            await pickImage(context, ImageSource.gallery);
                        setState(() {
                          piccheck = true;
                        });
                        if (_imagePolicy != null) {
                          print("HII");
                          setState(() {
                            _picUploading = true;
                          });
                          final FirebaseStorage _storgae = FirebaseStorage(
                              storageBucket:
                                  'gs://insurance-app-515f9.appspot.com');
                          print("HII");
                          StorageUploadTask uploadTask;
                          String filePath = '${DateTime.now()}.png';
                          uploadTask = _storgae
                              .ref()
                              .child(filePath)
                              .putFile(_imagePolicy);
                          uploadTask.onComplete.then((_) async {
                            print(1);
                            String url1 = await uploadTask.lastSnapshot.ref
                                .getDownloadURL();
                            _imagePolicy.delete().then((onValue) {
                              print(2);
                            });
                            setState(() {
                              _imagecheck = true;
                              _picUploading = false;
                            });
                            print(url1);

                            _cnicBack = url1;
                          });
                        }
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
                          Container(
                            child: typeOfProperty == ""
                                ? Text(
                                    'Type of property',
                                    style: TextStyle(fontSize: 17),
                                  )
                                : Text(
                                    typeOfProperty,
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
                    policyDetailsFromList.policySubCategory ==
                            "Occupant of property insurance"
                        ? Text(
                            'Type of ownership  |  Renter',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 17.0,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        : Text(
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
                    _input("Address", propertyAddressController),
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
                              Checkbox(
                                value: yes10k,
                                activeColor: Colors.cyanAccent[700],
                                onChanged: (val) {
                                  setState(() {
                                    itemExceding10k = true;
                                    yes10k = true;
                                    no10k = false;
                                  });
                                },
                              ),
                              Text('Yes'),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                value: no10k,
                                activeColor: Colors.cyanAccent[700],
                                onChanged: (val) {
                                  setState(() {
                                    itemExceding10k = false;
                                    yes10k = false;
                                    no10k = true;
                                  });
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
                    _detailinput(
                        'If yes, Specify in detail', itemDetailsController),
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
                              Checkbox(
                                value: yesloss,
                                activeColor: Colors.cyanAccent[700],
                                onChanged: (val) {
                                  setState(() {
                                    yesloss = true;
                                    noloss = false;
                                  });
                                },
                              ),
                              Text('Yes'),
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                value: noloss,
                                activeColor: Colors.cyanAccent[700],
                                onChanged: (val) {
                                  setState(() {
                                    yesloss = false;
                                    noloss = true;
                                  });
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
                                  paymentOption = "Card";
                                  card = true;
                                  cashondelivery = false;
                                });
                              },
                            ),
                            Text(
                              'Card',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.grey),
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
                              style:
                                  TextStyle(fontSize: 15, color: Colors.grey),
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
                      onPressed: () {
                        applyForPolicy();
                      },
                    ),
                    SizedBox(height: 25),
                  ],
                ),
              ),
      ),
    );
  }

  Future<void> applyForPolicy() async {
    if (_formKey.currentState.validate() &&
        dateSelected &&
        countryCodeSelected &&
        _cnicBack != null &&
        _cnicFront != null &&
        typeOfProperty != "" &&
        terms) {
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
        "Value Of Property": valueOfPropertyController.text,
        "Value Of Home Items": valueOfHomeItemsController.text,
        "StartingDate": policystartDate.toString(),
        "EndingDate": policystartDate
            .add(Duration(days: int.parse(policyDetailsFromList.policyPeriod)))
            .toString(),
        "FormUserFirstName": firstNameController.text,
        "FormUserFamilyName": familyNameController.text,
        "FormBeneficiaryName": beneficiaryNameController.text,
        "FormNationalty": nationalIdCardController.text,
        "FormUserNIC": nationalIdCardController.text,
        "IDcardFrontPic": _cnicFront,
        "IDcardBackPic": _cnicBack,
        "FormUserPhoneNumber":
            _selected.dialingCode + phoneNumberController.text,
        "FormUserEmail": emailController.text,
        "Type Of Property": typeOfProperty,
        "Country": "Kuwait",
        "Type Of OwnerShip": policyDetailsFromList.policySubCategory ==
                "Occupant of property insurance"
            ? "Renter"
            : "Owner",
        "FormPropertyAddress": propertyAddressController.text,
        "ItemsMoreThan10000KD": itemExceding10k,
        "ItemDetails": itemDetailsController.text,
        "LossInPastYear": yesloss,
        "PolicyCategory": policyDetailsFromList.policyCategory,
        "PolicySubCategory": policyDetailsFromList.policySubCategory,
        "UserUid": userDetails.userUid,
        "UserEmail": userDetails.userEmail,
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
        dateSelected = true;
        policystartDate = picked;
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
                  InkWell(
                    onTap: () {
                      setState(() {
                        typeOfProperty = 'Villa';
                      });
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.circle,
                            size: 14,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Villa',
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
                        typeOfProperty = 'Apartment';
                      });
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.circle,
                            size: 14,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Apartment',
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

Widget _detailinput(String hint, controller) {
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
        controller: controller,
        maxLines: 5,
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
