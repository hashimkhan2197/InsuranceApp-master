import 'dart:async';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:isurance/Admin_panel/policies/PolicyModel.dart';
import 'package:isurance/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Login_signup/UserModel.dart';
import 'menu/Navigationbar.dart';

List<String> wishListDocid = [];

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => new SplashScreenState();
}

class SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  var _visible = true;

  AnimationController animationController;
  Animation<double> animation;

  startTime() async {
    var _duration = new Duration(seconds: 5);
    return new Timer(_duration, navigationPage);
  }

  Future<void> navigationPage() async {
    var prefs = await SharedPreferences.getInstance();

    if (prefs.containsKey("insuranceAppUser")) {
      final extractedUserData = json.decode(prefs.getString('insuranceAppUser'))
          as Map<String, Object>;
      await Firestore.instance
          .collection("Users List")
          .where("UserUserUid", isEqualTo: extractedUserData['userUid'])
          .getDocuments()
          .then((value) async => {
                print("hiii2"),
                userDetails = UserModel(
                    userDocId: value.documents[0].documentID,
                    userEmail: value.documents[0]["UserEmail"],
                    userImage: value.documents[0]["UserImage"],
                    userNumber: "03319042434",
                    username: value.documents[0]["UserName"],
                    userUid: value.documents[0]["UserUserUid"])
              });

      await FirebaseFirestore.instance
          .collection("Wish List")
          .where("UserUid", isEqualTo: userDetails.userUid)
          .get()
          .then((value) => {
                for (int i = 0; i < value.docs.length; i++)
                  {
                    wishListDocid.add(value.docs[i]["documentId"]),
                  }
              });

      await Firestore.instance
          .collection("Policies List")
          .getDocuments()
          .then((policyDetail) => {
                print(policyDetail.docs.length),
                for (int i = 0; i < policyDetail.docs.length; i++)
                  {
                    searchedpolicyDetailsFromList.add(PolicyDetails(
                        policyCategory: policyDetail.documents[i]
                            ["PolicyCategory"],
                        policyCompnay: policyDetail.documents[i]
                            ["PolicyCompany"],
                        policyCountry: policyDetail.documents[i]
                            ["PolicyCountry"],
                        policyDocID: policyDetail.documents[i].documentID,
                        policyDescription: policyDetail.documents[i]
                            ["PolicyDescription"],
                        policyImage: policyDetail.documents[i]["PolicyImage"],
                        policyPeriod: policyDetail.documents[i]["PolicyPeriod"],
                        policySubCategory: policyDetail.documents[i]
                            ["PolicySubCategory"],
                        policyTerms: policyDetail.documents[i]
                            ["TermsAndConditions"],
                        policyprice: policyDetail.documents[i]["PolicyPrice"],
                        policytiitle: policyDetail.documents[i]["PolicyTittle"],
                        policyCompanyImage: policyDetail.documents[i]
                            ["PolicyCompanyImage"])),
                  }
              });

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => NavigationBar()));
    } else {
      Navigator.of(context).pushReplacementNamed(LOGIN);
    }
  }

  @override
  Future<void> initState() {
    super.initState();

    animationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 3));
    animation =
        new CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                new Image.asset(
                  'assets/Logo.png',
                  width: animation.value * 300,
                  height: animation.value * 300,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
