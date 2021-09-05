import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:isurance/Admin_panel/policies/policies_list.dart';
import 'dart:io';
import 'package:isurance/Admin_panel/policies/upload_policy/select_category.dart';

String policyCategory = "";
String policySubCategory = "";
String policyCompany = "";
String policyCompanyImage = "";
String policyCountry = "";
File _imagePolicy;
File _policyTerms;
bool _imagecheck = false;
bool _termscheck = false;
bool _picUploading = false;
bool _fileUploading = false;
bool piccheck = false;
bool _loading = false;

String _imageUrl;
String _termsUrl;

class UploadPolicy extends StatefulWidget {
  @override
  _UploadPolicyState createState() => _UploadPolicyState();
}

class _UploadPolicyState extends State<UploadPolicy> {
  @override
  //image picker
  final TextEditingController policyTittlecontroller =
      new TextEditingController();
  final TextEditingController policyPricecontroller =
      new TextEditingController();
  final TextEditingController policyPeriodcontroller =
      new TextEditingController();
  final TextEditingController policyDescriptioncontroller =
      new TextEditingController();

  @override
  void dispose() {
    policyTittlecontroller.dispose();
    policyPricecontroller.dispose();
    policyPeriodcontroller.dispose();
    policyDescriptioncontroller.dispose();
    policyCategory = "";
    policySubCategory = "";
    policyCompany = "";
    policyCompanyImage = "";
    policyCountry = "";
    super.dispose();
  }

  //image picker

  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Upload Policy',
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
              : Stack(
                  children: [
                    ListView(
                      children: [
                        SizedBox(height: 20),
                        InkWell(
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

                                _imageUrl = url1;
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
                                _imagePolicy == null
                                    ? Center(
                                        child: Icon(
                                          Icons.camera_alt,
                                          size: 50,
                                          color: Colors.grey,
                                        ),
                                      )
                                    : Container(
                                        height: 200,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10)),
                                          child: Image(
                                            image: NetworkImage(_imageUrl),
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 180,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SelectCategory()));
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Container(
                              decoration: BoxDecoration(),
                              child: Center(
                                child: policyCategory != "" &&
                                        policySubCategory != ""
                                    ? Text(
                                        'Category : $policyCategory \n\nSubcategory : $policySubCategory',
                                        style: TextStyle(
                                          color: Colors.cyanAccent[700],
                                          fontSize: 18.0,
                                        ),
                                      )
                                    : Text(
                                        'Select category and sub-category',
                                        style: TextStyle(
                                          color: Colors.cyanAccent[700],
                                          fontSize: 18.0,
                                        ),
                                      ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 25),
                        RaisedButton(
                            padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            color: Colors.cyanAccent[700],
                            textColor: Colors.white,
                            child: policyCompany == ""
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Select company",
                                          style: TextStyle(
                                            fontSize: 18.0,
                                          )),
                                      SizedBox(width: 10),
                                      Icon(Icons.arrow_drop_down)
                                    ],
                                  )
                                : Text("Company : " + policyCompany,
                                    style: TextStyle(
                                      fontSize: 18.0,
                                    )),
                            onPressed: () {
                              _companyBottomsheet(context);
                            }),
                        SizedBox(height: 30),
                        GestureDetector(
                          onTap: () async {
                            _policyTerms =
                                await pickFile(context, ImageSource.gallery);
                            setState(() {
                              piccheck = true;
                            });
                            if (_policyTerms != null) {
                              setState(() {
                                _fileUploading = true;
                              });
                              print("HII");
                              final FirebaseStorage _storgae = FirebaseStorage(
                                  storageBucket:
                                      'gs://insurance-app-515f9.appspot.com');
                              print("HII");
                              StorageUploadTask uploadTask;
                              String filePath = '${DateTime.now()}.png';
                              uploadTask = _storgae
                                  .ref()
                                  .child(filePath)
                                  .putFile(_policyTerms);
                              uploadTask.onComplete.then((_) async {
                                print(1);
                                String url1 = await uploadTask.lastSnapshot.ref
                                    .getDownloadURL();
                                _policyTerms.delete().then((onValue) {
                                  print(2);
                                });
                                setState(() {
                                  _termscheck = true;
                                  _fileUploading = false;
                                });
                                print(url1);

                                _termsUrl = url1;
                              });
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Container(
                              decoration: BoxDecoration(),
                              child: Center(
                                child: _fileUploading
                                    ? Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                'Uploading',
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
                                    : Container(
                                        child: _termsUrl != null
                                            ? Text(
                                                'Terms and conditions Uploaded',
                                                style: TextStyle(
                                                  color: Colors.cyanAccent[700],
                                                  fontSize: 18.0,
                                                ),
                                              )
                                            : Text(
                                                'Uplaod terms and conditions',
                                                style: TextStyle(
                                                  color: Colors.cyanAccent[700],
                                                  fontSize: 18.0,
                                                ),
                                              ),
                                      ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        GestureDetector(
                          onTap: () {
                            _choosecountryBottomsheet(context);
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: Container(
                              decoration: BoxDecoration(),
                              child: Center(
                                child: policyCountry == ""
                                    ? Text(
                                        'Choose country',
                                        style: TextStyle(
                                          color: Colors.cyanAccent[700],
                                          fontSize: 18.0,
                                        ),
                                      )
                                    : Text(
                                        "Country : " + policyCountry,
                                        style: TextStyle(
                                          color: Colors.cyanAccent[700],
                                          fontSize: 18.0,
                                        ),
                                      ),
                              ),
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
                          child: _loading
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : Text("Upload Policy",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                  )),
                          onPressed: () {
                            if (_imagecheck &&
                                _termscheck &&
                                policyCategory != "" &&
                                policyCountry != "" &&
                                policyCompany != "" &&
                                _formKey.currentState.validate()) {
                              print("Hi");
                              uploadPolicy();
                            } else {
                              _imagecheck == false
                                  ? showDialog(
                                      context: context,
                                      builder:(context){return AlertDialog(
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
                                  : policyCategory == ""
                                      ? showDialog(
                                          context: context,
                                          builder:(context){return AlertDialog(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    new BorderRadius.circular(
                                                        18.0),
                                                side: BorderSide(
                                                  color: Colors.red[400],
                                                )),
                                            content:
                                                Text("Category not selected"),
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
                                      : policyCompany == ""
                                          ? showDialog(
                                              context: context,
                                              builder:(context){return AlertDialog(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        new BorderRadius
                                                            .circular(18.0),
                                                    side: BorderSide(
                                                      color: Colors.red[400],
                                                    )),
                                                content: Text(
                                                    "Company not selected"),
                                                actions: <Widget>[
                                                  FlatButton(
                                                    child: Text(
                                                      "OK",
                                                      style: TextStyle(
                                                          color:
                                                              Colors.red[400]),
                                                    ),
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                  )
                                                ],
                                              );})
                                          : policyCountry == ""
                                              ? showDialog(
                                                  context: context,
                                                  builder:(context){return AlertDialog(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                new BorderRadius
                                                                        .circular(
                                                                    18.0),
                                                            side: BorderSide(
                                                              color: Colors
                                                                  .red[400],
                                                            )),
                                                    content: Text(
                                                        "Country not selected"),
                                                    actions: <Widget>[
                                                      FlatButton(
                                                        child: Text(
                                                          "OK",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .red[400]),
                                                        ),
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                      )
                                                    ],
                                                  );})
                                              : _termsUrl == null
                                                  ? showDialog(
                                                      context: context,
                                                      builder:(context){return AlertDialog(
                                                        shape:
                                                            RoundedRectangleBorder(
                                                                borderRadius:
                                                                    new BorderRadius
                                                                            .circular(
                                                                        18.0),
                                                                side:
                                                                    BorderSide(
                                                                  color: Colors
                                                                      .red[400],
                                                                )),
                                                        content: Text(
                                                            "Terms and Conditions not uploaded"),
                                                        actions: <Widget>[
                                                          FlatButton(
                                                            child: Text(
                                                              "OK",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                          .red[
                                                                      400]),
                                                            ),
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
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

  void _companyBottomsheet(context) {
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
              child: StreamBuilder(
                  stream: Firestore.instance
                      .collection("Companies List")
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(
                        child: Text(
                          'NO COMPANIES YET',
                        ),
                      );
                    } else
                      return ListView.builder(
                          itemCount: snapshot.data.documents.length,
                          itemBuilder: (context, index) {
                            DocumentSnapshot companyDetail =
                                snapshot.data.documents[index];

                            return InkWell(
                              onTap: () {
                                setState(() {
                                  policyCompany = companyDetail["CompanyName"];
                                  policyCompanyImage =
                                      companyDetail["CompanyLogo"];
                                });
                                Navigator.pop(context);
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 18,
                                      child: ClipOval(
                                        child: SizedBox(
                                          height: 50,
                                          width: 50,
                                          child: Image(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                companyDetail["CompanyLogo"]),
                                            width: 50,
                                            height: 50,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      companyDetail["CompanyName"],
                                      style: TextStyle(fontSize: 18),
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                  }),
            ),
          ),
        );
      },
    );
  }

  void _choosecountryBottomsheet(context) {
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
            height: 100,
            //height: MediaQuery.of(context).size.height * 80,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ListView(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        policyCountry = 'Kuwait';
                      });
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_forward,
                            size: 18,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Kuwait',
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        policyCountry = 'Lebanon';
                      });
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_forward,
                            size: 18,
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Lebanon',
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> uploadPolicy() async {
    setState(() {
      _loading = true;
    });
    print(policyTittlecontroller.text);
    print(policyPeriodcontroller.text);
    try {
      await FirebaseFirestore.instance.collection("Policies List").add({
        'PolicyImage': _imageUrl,
        'TermsAndConditions': _termsUrl,
        'PolicyCategory': policyCategory,
        'PolicySubCategory': policySubCategory,
        'PolicyCompany': policyCompany,
        'PolicyCompanyImage': policyCompanyImage,
        "PolicyCountry": policyCountry,
        'PolicyTittle': policyTittlecontroller.text,
        'PolicyPrice': policyPricecontroller.text,
        'PolicyPeriod': policyPeriodcontroller.text,
        "PolicyDescription": policyDescriptioncontroller.text,
        "Approved": false,
        "Rejected": false,
      });
      int userNumber = 0;

      await FirebaseFirestore.instance
          .collection("Numbers")
          .where("Name", isEqualTo: "Total Policies")
          .getDocuments()
          .then((value) => {
                userNumber = int.parse(value.documents[0]["Count"]) + 1,
              });

      await FirebaseFirestore.instance
          .collection("Numbers")
          .document("Total Policies")
          .update({"Count": userNumber.toString()});

      print(4);
      Navigator.pop(context);

      setState(() {
        _loading = false;
        _imagePolicy = null;
        _policyTerms = null;
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
