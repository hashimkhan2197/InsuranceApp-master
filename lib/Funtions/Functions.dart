import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:isurance/Admin_panel/policies/PolicyModel.dart';
import 'package:isurance/Login_signup/UserModel.dart';
import 'package:isurance/Login_signup/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> buyaPolicy() async {
  await Firestore.instance.collection("BoughtPolicies").add({
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
    "UserName": userDetails.username,
    "userPhoneNumber": userDetails.userNumber,
    "userEmail": userDetails.userEmail,
    "userPicture": userDetails.userImage
  });
  print("hiiii1");
  String applicationDocid = "";
  print("hiiii2");

  print(policyDetailsFromList.policyDocID);
  print(userDetails.userUid);

  await Firestore.instance
      .collection("Applications")
      .where(
        "PolicyTittle",
        isEqualTo: policyDetailsFromList.policytiitle,
      )
      .where("UserUid", isEqualTo: userDetails.userUid)
      .getDocuments()
      .then((value) => {
            applicationDocid = value.documents[0].documentID,
          });
  print("hiiii3");

  await Firestore.instance
      .collection("Applications")
      .document(applicationDocid)
      .update({
    "Approved": true,
  });
}

Future<void> signOut(BuildContext context) async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => Login()),
        (Route<dynamic> route) => false);
  } catch (e) {
    print(e); //
  }
}
