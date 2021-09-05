import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:isurance/Admin_panel/policies/policies_list.dart';
import 'dart:io';
import 'package:isurance/Admin_panel/policies/upload_policy/select_category.dart';

import 'PolicyModel.dart';

String editPolicyCountry = "";
File _editImagePolicy;
File _editpolicyTerms;
bool _editImagecheck = false;
bool _edittermscheck = false;
bool _editpicUploading = false;
bool _editfileUploading = false;
bool editpiccheck = false;
bool _editloading = false;

String _editimageUrl = policyDetailsFromList.policyImage;
String _edittermsUrl;

class EditPolicy extends StatefulWidget {
  @override
  _EditPolicyState createState() => _EditPolicyState();
}

class _EditPolicyState extends State<EditPolicy> {
  @override
  //image picker
  final TextEditingController policyTittlecontroller =
      new TextEditingController(text: policyDetailsFromList.policytiitle);
  final TextEditingController policyPricecontroller =
      new TextEditingController(text: policyDetailsFromList.policyprice);
  final TextEditingController policyPeriodcontroller =
      new TextEditingController(text: policyDetailsFromList.policyPeriod);
  final TextEditingController policyDescriptioncontroller =
      new TextEditingController(text: policyDetailsFromList.policyDescription);

  @override
  void dispose() {
    policyTittlecontroller.dispose();
    policyPricecontroller.dispose();
    policyPeriodcontroller.dispose();
    policyDescriptioncontroller.dispose();

    super.dispose();
  }

  //image picker

  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Policy',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: _editpicUploading
              ? Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 28.0),
                        child: Text(
                          'Updating image ....',
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
              : Stack(
                  children: [
                    ListView(
                      children: [
                        SizedBox(height: 20),
                        InkWell(
                          onTap: () async {
                            _editImagePolicy =
                                await pickImage(context, ImageSource.gallery);
                            setState(() {
                              editpiccheck = true;
                            });
                            if (_editImagePolicy != null) {
                              print("HII");
                              setState(() {
                                _editpicUploading = true;
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
                                  .putFile(_editImagePolicy);
                              uploadTask.onComplete.then((_) async {
                                print(1);
                                String url1 = await uploadTask.lastSnapshot.ref
                                    .getDownloadURL();
                                _editImagePolicy.delete().then((onValue) {
                                  print(2);
                                });
                                setState(() {
                                  _editImagecheck = true;
                                  _editpicUploading = false;
                                });
                                print(url1);

                                _editimageUrl = url1;
                              });
                            }
                          },
                          child: Container(
                            height: 200,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.grey[200],
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // SizedBox(height: 70),
                                Container(
                                  height: 200,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10)),
                                    child: Image(
                                      image: NetworkImage(_editimageUrl),
                                      width: MediaQuery.of(context).size.width,
                                      height: 180,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 25),
                        Text(
                          'Title',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 7),
                        _input("title", policyTittlecontroller,
                            TextInputType.name),
                        SizedBox(height: 15),
                        Text(
                          'Price',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 7),
                        _input("Price", policyPricecontroller,
                            TextInputType.number),
                        SizedBox(height: 15),
                        Text(
                          'Policy period',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 7),
                        _input("for example 1 year", policyPeriodcontroller,
                            TextInputType.number),
                        SizedBox(height: 15),
                        Text(
                          'Description',
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 7),
                        _descriptioninput(
                            "Type detail...", policyDescriptioncontroller),
                        SizedBox(height: 30),
                        RaisedButton(
                          padding: EdgeInsets.fromLTRB(50, 15, 50, 15),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          color: Colors.cyanAccent[700],
                          textColor: Colors.white,
                          child: _editloading
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : Text("Update Policy",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                  )),
                          onPressed: () {
                            if (_editImagecheck &&
                                _formKey.currentState.validate()) {
                              print("Hi");
                              EditPolicy();
                            } else {
                              _editImagecheck == false
                                  ? showDialog(
                                      context: context,
                                      builder: (context){return AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(18.0),
                                            side: BorderSide(
                                              color: Colors.red[400],
                                            )),
                                        title: Text("Wait..."),
                                        content: Text("Image Not Uploaded"),
                                        actions: <Widget>[
                                          FlatButton(
                                            child: Text(
                                              "OK",
                                              style: TextStyle(
                                                  color: Colors.red[400]),
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
                        SizedBox(height: 30),
                      ],
                    ),
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

  Future<File> pickFile(BuildContext context, ImageSource source) async {
    // ignore: unnecessary_cast
    File file = await FilePicker.getFile(
        type: FileType.custom, allowedExtensions: ['pdf']);
    return file;
  }

  Future<void> EditPolicy() async {
    setState(() {
      _editloading = true;
    });
    print(policyTittlecontroller.text);
    print(policyPeriodcontroller.text);
    try {
      String docId;
      await FirebaseFirestore.instance
          .collection("Policies List")
          .where("PolicyImage", isEqualTo: policyDetailsFromList.policyImage)
          .getDocuments()
          .then((value) {
        docId = value.documents[0].documentID;
      });
      await FirebaseFirestore.instance
          .collection("Policies List")
          .document(docId)
          .update({
        'PolicyImage': _editimageUrl,
        'PolicyTittle': policyTittlecontroller.text,
        'PolicyPrice': policyPricecontroller.text,
        'PolicyPeriod': policyPeriodcontroller.text,
        "PolicyDescription": policyDescriptioncontroller.text,
      });

      print(4);
      Navigator.pop(context);
      Navigator.pop(context);

      setState(() {
        _editloading = false;
        _editImagePolicy = null;
        _editpolicyTerms = null;
      });
    } catch (signUpError) {
      setState(() {
        _editloading = false;
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

Widget _input(String hint, controller, keyboardType) {
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
        keyboardType: keyboardType,
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

Widget _descriptioninput(String hint, controller) {
  return Container(
    height: 140,
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
        validator: (val) {
          if (val.length == 0) {
            return "This field cannot be empty";
          } else {
            return null;
          }
        },
        controller: controller,
        keyboardType: TextInputType.multiline,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.grey[600], fontSize: 14),
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
