import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:isurance/Admin_panel/companies/companies_list.dart';
import 'package:isurance/Admin_panel/companies/company_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'CompanyModel.dart';

class EditCompany extends StatefulWidget {
  EditCompany({Key key}) : super(key: key);

  @override
  _EditCompanyState createState() => _EditCompanyState();
}

class _EditCompanyState extends State<EditCompany> {
  final TextEditingController companyNamecontroller =
      new TextEditingController(text: companyDetailFromList.companyName);
  final TextEditingController companyEmailcontroller =
      new TextEditingController(text: companyDetailFromList.companyEmail);
  final TextEditingController companyPasswordcontroller =
      new TextEditingController(text: companyDetailFromList.companyPassword);
  final TextEditingController companyConfirmPasswordcontroller =
      new TextEditingController(text: companyDetailFromList.companyPassword);
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    companyNamecontroller.dispose();
    companyEmailcontroller.dispose();
    companyPasswordcontroller.dispose();
    companyConfirmPasswordcontroller.dispose();

    super.dispose();
  }

  //image picker
  File _image;
  bool imagecheck = false;
  bool piccheck = false;
  bool _loading = false;

  String imageUrl;

  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
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
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: ListView(
            children: [
              Center(
                child: Text(
                  'Add new company',
                  style: TextStyle(
                    fontSize: 23.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: 30),
              InkWell(
                onTap: () async {
                  _image = await pickImage(context, ImageSource.gallery);
                  setState(() {
                    piccheck = true;
                  });
                  if (_image != null) {
                    print("HII");
                    final FirebaseStorage _storgae = FirebaseStorage(
                        storageBucket: 'gs://insurance-app-515f9.appspot.com');
                    print("HII");
                    StorageUploadTask uploadTask;
                    String filePath = '${DateTime.now()}.png';
                    uploadTask = _storgae.ref().child(filePath).putFile(_image);
                    uploadTask.onComplete.then((_) async {
                      print(1);
                      String url1 =
                          await uploadTask.lastSnapshot.ref.getDownloadURL();
                      _image.delete().then((onValue) {
                        print(2);
                      });
                      setState(() {
                        imagecheck = true;
                      });
                      print(url1);

                      imageUrl = url1;
                    });
                  }
                },
                child: Container(
                  decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
                    BoxShadow(
                      color: Colors.grey[300],
                      offset: Offset(0, 0),
                      blurRadius: 5,
                    ),
                  ]),
                  child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 55,
                      child: CircleAvatar(
                        radius: 50,
                        child: ClipOval(
                          child: SizedBox(
                              height: 130.0,
                              width: 130.0,
                              child: (_image != null)
                                  ? Image.file(
                                      _image,
                                      fit: BoxFit.cover,
                                    )
                                  : Image.network(
                                      companyDetailFromList.companyLogo,
                                      fit: BoxFit.cover,
                                    )),
                        ),
                      )),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: Text(
                  'Company Logo',
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Name',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 7),
              _input(companyDetailFromList.companyName, companyNamecontroller),

              SizedBox(height: 15),
              // Text(
              //   'Choose company email',
              //   style: TextStyle(
              //     fontSize: 16.0,
              //   ),
              // ),
              // SizedBox(height: 7),
              // _input(companyDetailFromList.companyName, companyEmailcontroller),
              // SizedBox(height: 15),
              // Text(
              //   'Password',
              //   style: TextStyle(
              //     fontSize: 16.0,
              //   ),
              // ),
              // SizedBox(height: 7),
              // _input(companyDetailFromList.companyPassword,
              //     companyPasswordcontroller),

              RaisedButton(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                color: Colors.cyanAccent[700],
                textColor: Colors.white,
                child: _loading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Text("UPDATE",
                        style: TextStyle(
                          fontSize: 18.0,
                        )),
                onPressed: () {
                  if (_image == null) {
                    if (_formKey.currentState.validate()) addCompany();
                  } else if (imagecheck && _formKey.currentState.validate()) {
                    print("Hi");
                    addCompany();
                  } else {
                    imagecheck == false
                        ? showDialog(
                            context: context,
                            builder:(context){return AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(18.0),
                                  side: BorderSide(
                                    color: Colors.red[400],
                                  )),
                              title: Text("Wait..."),
                              content: Text("Image Not Uploaded"),
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
                            );})
                        : null;
                  }
                },
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }

  Future<File> pickImage(BuildContext context, ImageSource source) async {
    // ignore: unnecessary_cast
    File selected = (await ImagePicker.pickImage(
      source: source,
      imageQuality: 20,
    )) as File;
    return selected;
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
          validator: hint == "Confirm Password"
              ? (val) {
                  if (val != companyPasswordcontroller.text) {
                    return "Password doesn't match";
                  } else if (val.length == 0) {
                    return hint + " cannot be empty";
                  } else {
                    return null;
                  }
                }
              : (val) {
                  if (val.length == 0) {
                    return hint + " cannot be empty";
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

  /////addd company

  Future<void> addCompany() async {
    setState(() {
      _loading = true;
    });
    print(companyEmailcontroller.text);
    print(companyPasswordcontroller.text);
    try {
      String docid;
      await FirebaseFirestore.instance
          .collection("Companies List")
          .where("CompanyEmail", isEqualTo: companyDetailFromList.companyEmail)
          .getDocuments()
          .then((value) => {
                docid = value.documents[0].documentID,
              });

      await FirebaseFirestore.instance
          .collection("Companies List")
          .document(docid)
          .update({
        'CompanyName': companyNamecontroller.text,
        'CompanyLogo':
            _image == null ? companyDetailFromList.companyLogo : imageUrl,
        'Blocked': false
      });

      companyDetailFromList = CompanyModel(
          companyEmail: companyEmailcontroller.text,
          companyLogo:
              _image == null ? companyDetailFromList.companyLogo : imageUrl,
          companyName: companyNamecontroller.text,
          companyPassword: companyPasswordcontroller.text);

      print(companyDetailFromList.companyName);

      print(4);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => CompanyInfo()));

      setState(() {
        _loading = false;
      });
    } catch (signUpError) {
      setState(() {
        _loading = false;
      });

      //Error handling

      showDialog(
          context: context,
          builder:(context){return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(18.0),
                side: BorderSide(
                  color: Colors.red[400],
                )),
            title: Text(signUpError.toString()),
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
    }
  }
}
