import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter_country_picker/flutter_country_picker.dart';
import 'package:isurance/Admin_panel/policies/PolicyModel.dart';
import 'package:intl/intl.dart';
import 'package:isurance/Login_signup/UserModel.dart';

class MotorBoatInsurance extends StatefulWidget {
  @override
  _MotorBoatInsuranceState createState() => _MotorBoatInsuranceState();
}

class _MotorBoatInsuranceState extends State<MotorBoatInsurance> {
  //image picker

  String insuranceAmount = "0";

  File _image;

  File _imagePolicy;

  bool _imagecheck = false;

  bool _picUploading = false;

  bool piccheck = false;
  bool _loading = false;

  String _cnicFront;
  String _cnicBack;
  String _vehicleIDpic;
  String _shipHullMaterial;

  DateTime _dateTime;
  DateTime policystartDate = DateTime.now();
  bool dateSelected = false;
  bool manfacturingDateSelected = false;
  Country _boatCountry;
  Country _countryCode;
  bool countryCodeSelected = false;
  bool itemExceding10k = false;
  String paymentOption = "Card";
  DateTime manfacturingDate = DateTime.now();
  bool yes10k = false;
  bool no10k = true;
  bool yesloss = false;
  bool noloss = true;
  String regionalBoundries;

  //payment options
  bool card = true;
  bool cashondelivery = false;

  bool terms = false;
  String typeOfProperty = "";

  TextEditingController firstNameController = new TextEditingController();
  TextEditingController familyNameController = new TextEditingController();

  TextEditingController nationalIdCardController = new TextEditingController();
  TextEditingController nationalityController = new TextEditingController();
  TextEditingController passportNumberController = new TextEditingController();
  TextEditingController phoneNumberController = new TextEditingController();
  TextEditingController propertyAddressController = new TextEditingController();
  TextEditingController itemDetailsController = new TextEditingController();

  TextEditingController registrationNumberController =
      new TextEditingController();
  TextEditingController nameOfBoatController = new TextEditingController();
  TextEditingController boatFlagController = new TextEditingController();
  TextEditingController numberOfEngines = new TextEditingController();

  TextEditingController typeOfEnginesController = new TextEditingController();
  TextEditingController engineHorsePowerController =
      new TextEditingController();
  TextEditingController boatHieghtController = new TextEditingController();
  TextEditingController boatWidthController = new TextEditingController();

  TextEditingController boatDepthController = new TextEditingController();
  TextEditingController totalLoadController = new TextEditingController();
  TextEditingController totalRegisteredLoadController =
      new TextEditingController();
  TextEditingController netWeightRecodedController =
      new TextEditingController();

  TextEditingController emailController = new TextEditingController();
  final _formKey = GlobalKey<FormState>();

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
              _countryCode = country;
            });
          },
          selectedCountry: _countryCode,
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
              _boatCountry = country;
            });
          },
          selectedCountry: _boatCountry,
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
                        fontSize: 23.0,
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
                      'Insurance period  | ' +
                          policyDetailsFromList.policyPeriod +
                          " years",
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
                            _cnicFront = url1;
                            setState(() {
                              _imagecheck = true;
                              _picUploading = false;
                            });
                            print(url1);
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
                            _cnicBack = url1;
                            setState(() {
                              _imagecheck = true;
                              _picUploading = false;
                            });
                            print(url1);
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
                    SizedBox(height: 15),
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
                        child: _vehicleIDpic != null
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
                                      'Picture of front of Vehicle ID',
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
                              _vehicleIDpic = url1;
                              _imagecheck = true;
                              _picUploading = false;
                            });
                            print(url1);
                          });
                        }
                      },
                    ),
                    SizedBox(height: 40),
                    Divider(
                      color: Colors.brown,
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Boat information',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap: () =>
                          _selectmanufactureDate(context), // Refer step 3
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                                bottom:
                                    BorderSide(color: Colors.cyanAccent[700])),
                          ),
                          child: Center(
                            child: manfacturingDateSelected
                                ? Text(
                                    'Date of manufacturing of boat   |  ' +
                                        DateFormat('dd-MM-yyyy')
                                            .format(manfacturingDate)
                                            .toString(),
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.cyanAccent[700],
                                      fontSize: 17.0,
                                    ),
                                  )
                                : Text(
                                    'Date of manufacturing of boat',
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: regionalBoundries == null
                                ? Text(
                                    'Regional boundaries',
                                    style: TextStyle(fontSize: 17),
                                  )
                                : Text(
                                    regionalBoundries,
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
                        _regionalboundariesBottomsheet(context);
                      },
                    ),
                    SizedBox(height: 25),
                    Text(
                      'Registration Number',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 7),
                    _input("Registration number", registrationNumberController),
                    SizedBox(height: 15),
                    Text(
                      'Name of boat',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 7),
                    _input("Name of boat", nameOfBoatController),
                    SizedBox(height: 15),
                    Text(
                      'Boat flag',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    _input("Boat flag", boatFlagController),
                    SizedBox(height: 7),
                    SizedBox(height: 20),
                    Text(
                      'Boat manufactured Country',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 7),
                    manufacturedcountryTextFormField(),
                    SizedBox(height: 25),
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
                            child: _shipHullMaterial == null
                                ? Text(
                                    'Ship Hull material',
                                    style: TextStyle(fontSize: 17),
                                  )
                                : Text(
                                    _shipHullMaterial,
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
                        _shipmaterialBottomsheet(context);
                      },
                    ),
                    SizedBox(height: 25),
                    Text(
                      'Number of engines',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 7),
                    _input("Number of engines", numberOfEngines),
                    SizedBox(height: 15),
                    Text(
                      'Type of engine',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 7),
                    _input("Type of engine", typeOfEnginesController),
                    SizedBox(height: 15),
                    Text(
                      'Engine horse power',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 7),
                    _input("Engine horse power", engineHorsePowerController),
                    SizedBox(height: 25),
                    Text(
                      'Boat dimensions ( in feet )',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Height',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 7),
                    _input("Heigh", boatHieghtController),
                    SizedBox(height: 15),
                    Text(
                      'Width',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 7),
                    _input("width", boatWidthController),
                    SizedBox(height: 15),
                    Text(
                      'Depth',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 7),
                    _input("Depth", boatDepthController),
                    SizedBox(height: 25),
                    Text(
                      'Load',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Total load',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 7),
                    _input("total load", totalLoadController),
                    SizedBox(height: 15),
                    Text(
                      'Total registered load',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 7),
                    _input(
                        "total registered load", totalRegisteredLoadController),
                    SizedBox(height: 15),
                    Text(
                      'Net weight recorded ',
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 7),
                    _input("Net weight recorded ", netWeightRecodedController),
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
                            ? Center(child: CircularProgressIndicator())
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
        insuranceAmount != "0" &&
        dateSelected &&
        countryCodeSelected &&
        _cnicBack != null &&
        _cnicFront != null &&
        _vehicleIDpic != null &&
        manfacturingDateSelected &&
        terms &&
        regionalBoundries != null &&
        _boatCountry != null &&
        _shipHullMaterial != null) {
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
        "InsuranceAmont": insuranceAmount,
        "StartingDate": policystartDate.toString(),
        "EndingDate": policystartDate
            .add(Duration(days: int.parse(policyDetailsFromList.policyPeriod)))
            .toString(),
        "FormUserFirstName": firstNameController.text,
        "FormUserFamilyName": familyNameController.text,
        "FormNationalty": nationalIdCardController.text,
        "FormUserNIC": nationalIdCardController.text,
        "IDcardFrontPic": _cnicFront,
        "IDcardBackPic": _cnicBack,
        "FormUserPhoneNumber":
            _countryCode.dialingCode + phoneNumberController.text,
        "FormUserEmail": emailController.text,
        "VehicleIDPicture": _vehicleIDpic,
        "DateOfManfacturingOfBoat": manfacturingDate.toString(),
        "RegionalBoundries": regionalBoundries,
        "RegistrationNumber": registrationNumberController.text,
        "NameOfBoat": nameOfBoatController.text,
        "BoatFlag": boatFlagController.text,
        "BoatCountry": _boatCountry.name,
        "ShipHullMaterial": _shipHullMaterial,
        "NumberOfEngines": numberOfEngines.text,
        "TypesOfEngines": typeOfEnginesController.text,
        "EngineHorsePower": engineHorsePowerController.text,
        "BoatHeight": boatHieghtController.text,
        "BoatWidth": boatWidthController.text,
        "BoatDepth": boatDepthController.text,
        "TotalLoad": totalLoadController.text,
        "TotalRegsteredLoad": totalRegisteredLoadController.text,
        "NetWeightRecorded": netWeightRecodedController.text,
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

  _selectmanufactureDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: manfacturingDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      helpText: 'Boat manufactured date',
    );
    if (picked != null && picked != manfacturingDate)
      setState(() {
        manfacturingDateSelected = true;
        manfacturingDate = picked;
      });
  }

  void _insurancecoverageamountBottomsheet(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return policyDetailsFromList.policySubCategory != "Jet ski insurance"
            ? Container(
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
                              insuranceAmount = "30000";
                            });
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                SizedBox(width: 10),
                                Text(
                                  'Up to 30,000 KD',
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
                              insuranceAmount = "50000";
                            });
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                SizedBox(width: 10),
                                Text(
                                  'Up to 50,000 KD',
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
                              insuranceAmount = "100000";
                            });
                            Navigator.pop(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                SizedBox(width: 10),
                                Text(
                                  'Up to 100,000 KD',
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
              )
            : Container(
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

  void _regionalboundariesBottomsheet(context) {
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
                        regionalBoundries = 'Kuwaiti territorial waters only';
                      });
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            'Kuwaiti territorial waters only',
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
                        regionalBoundries = 'Arabian Gulf waters only';
                      });
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            'Arabian Gulf waters only',
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
                  InkWell(
                    onTap: () {
                      setState(() {
                        _shipHullMaterial = 'Fiber glass';
                      });
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          Text(
                            'Fiber glass',
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
                        _shipHullMaterial = 'Iron';
                      });
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          Text(
                            'Iron',
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
                        _shipHullMaterial = 'Aluminum';
                      });
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          Text(
                            'Aluminum',
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
                        _shipHullMaterial = 'Wood';
                      });
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          Text(
                            'Wood',
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
                        _shipHullMaterial = 'Other';
                      });
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          SizedBox(width: 10),
                          Text(
                            'Other',
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
