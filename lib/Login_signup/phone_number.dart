import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_country_picker/flutter_country_picker.dart';
import 'package:isurance/Login_signup/phone_verification.dart';
import 'package:isurance/menu/Navigationbar.dart';

class PhoneNumber extends StatefulWidget {
  PhoneNumber({Key key}) : super(key: key);

  @override
  _PhoneNumberState createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {
  Country _selected;
  String countryPhoneCode = "1";
  bool _isLoading = true;
  final TextEditingController userNumbercontroller =
      new TextEditingController();
  final TextEditingController _codeController = new TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    userNumbercontroller.dispose();
    super.dispose();
  }

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
              countryPhoneCode = _selected.dialingCode;
            });
            print("hii");
            print(countryPhoneCode);
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
      body: Form(
        key: _formKey,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: ListView(
            children: [
              SizedBox(height: 20),
              Center(
                child: Text(
                  'Enter your phone number',
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Help us verify your identity by sending you a verification code. It will only take a minute!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
              SizedBox(height: 20),
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
                    _textInput('Phone Number', userNumbercontroller),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                child: _isLoading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : RaisedButton(
                        padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0)),
                        color: Colors.cyanAccent[700],
                        textColor: Colors.white,
                        child: Container(
                          child: Text("Send Code",
                              style: TextStyle(
                                fontSize: 18.0,
                              )),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            final phone = "+" +
                                countryPhoneCode +
                                userNumbercontroller.text.trim();
                            print(phone);
                            print(phone);

                            await loginUser(phone, context);
                          }
                        },
                      ),
              ),
              SizedBox(height: 70),
              Container(
                width: 170,
                height: 170,
                child: Image(
                  image: AssetImage('assets/Logo.png'),
                ),
              ),
            ],
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
        validator: (val) {
          if (val.length == 0) {
            return "This field cannot be empty";
          } else {
            return null;
          }
        },
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

  Future<bool> loginUser(String phone, BuildContext context) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    setState(() {
      _isLoading = true;
    });

    _auth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) async {
          Navigator.of(context).pop();

          dynamic result = await _auth.signInWithCredential(credential);

          FirebaseUser user = result.user;

          if (user != null) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NavigationBar()));
          } else {
            print("Error");
          }

          //This callback would gets called when verification is done auto maticlly
        },
        verificationFailed: (exception) {
          print("HIIII");
          print(exception);
          showDialog(
              context: context,
              builder:(context){return AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                    side: BorderSide(
                      color: Colors.red[400],
                    )),
                content: Text(exception.message),
                actions: <Widget>[
                  FlatButton(
                    child: Text(
                      "OK",
                      style: TextStyle(color: Colors.red[400]),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  )
                ],
              );});
        },
        codeSent: (String verificationId, [int forceResendingToken]) {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                  title: Text("Enter the code"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      TextField(
                        keyboardType: TextInputType.number,
                        controller: _codeController,
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 4.0, bottom: 8.0, right: 80),
                      child: new Container(
                        width: 100.0,
                        height: 40.0,
                        child: new RaisedButton(
                            onPressed: () async {
                              final code = _codeController.text.trim();
                              AuthCredential credential =
                                  PhoneAuthProvider.getCredential(
                                      verificationId: verificationId,
                                      smsCode: code);

                              dynamic result =
                                  await _auth.signInWithCredential(credential);

                              FirebaseUser user = result.user;

                              if (user != null) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => NavigationBar()));
                              } else {
                                print("Error");
                              }
                            },
                            child: Text("Confirm"),
                            textColor: Colors.white,
                            color: Colors.pinkAccent,
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0))),
                      ),
                    )
                  ],
                );
              });
        },
        codeAutoRetrievalTimeout: (String a) {});
    setState(() {
      _isLoading = false;
    });
  }
}
