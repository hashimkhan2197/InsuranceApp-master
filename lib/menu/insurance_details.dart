import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:isurance/Admin_panel/policies/PolicyModel.dart';
import 'package:isurance/Login_signup/UserModel.dart';
import 'package:isurance/menu/Forms/fire_and_general_insurance/occupant_of_property_insurance.dart';
import 'package:isurance/menu/Forms/fire_and_general_insurance/owner_of_property_insurance.dart';
import 'package:isurance/menu/Forms/marine_insurance/Fishing_boat_insurance.dart';
import 'package:isurance/menu/Forms/marine_insurance/jet_ski_insurance.dart';
import 'package:isurance/menu/Forms/marine_insurance/motor_boat_insurance.dart';
import 'package:isurance/menu/Forms/marine_insurance/picnic_boat_insurance.dart';
import 'package:isurance/menu/Forms/personal_accident_insurance/maid_or_homeworker_insurance.dart';
import 'package:isurance/menu/Forms/personal_accident_insurance/student_insurance.dart';
import 'package:isurance/menu/Forms/personal_accident_insurance/trainee_insurance.dart';
import 'package:isurance/menu/Forms/travel_insurance/family_travel_insurance.dart';
import 'package:isurance/menu/Forms/travel_insurance/individual_travelInsurance_policy.dart';
import 'package:isurance/menu/home.dart';
import 'package:isurance/menu/payment.dart';
import 'package:isurance/menu/popular_policies.dart';
import 'package:isurance/menu/profile/approved.dart';
import 'package:isurance/menu/reviews.dart';

import '../splash_screen.dart';

bool addingToWish = false;

class InsuranceDetails extends StatefulWidget {
  InsuranceDetails({Key key}) : super(key: key);

  @override
  _InsuranceDetailsState createState() => _InsuranceDetailsState();
}

bool fav = true;

class _InsuranceDetailsState extends State<InsuranceDetails> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          policyDetailsFromList.policyCategory,
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Image(
              image: NetworkImage(policyDetailsFromList.policyImage),
              width: MediaQuery.of(context).size.width,
              height: 400,
              fit: BoxFit.cover,
            ),
            Container(
              height: 20,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 10,
                      offset: Offset(2, 2))
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: 400,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 10,
                        offset: Offset(2, 2))
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(5, 15, 10, 0),
                  child: ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 18,
                                backgroundColor: Colors.grey[100],
                                child: ClipOval(
                                  child: SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: Image(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(companyImage),
                                      width: 50,
                                      height: 50,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                policyDetailsFromList.policyCompnay,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 20,
                                    color: Colors.orange,
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    '( 7 )',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red),
                                  ),
                                ],
                              ),
                              SizedBox(height: 3),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Reviews()));
                                },
                                child: Text(
                                  'view all reviews',
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.grey),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              policyDetailsFromList.policytiitle,
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(height: 5),
                            Text(
                              policyDetailsFromList.policyCategory,
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(height: 5),
                            Text(
                              policyDetailsFromList.policySubCategory,
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Country | ' +
                                  policyDetailsFromList.policyCountry,
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                        child: Row(
                          children: [
                            Text(
                              'Price: ',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              '\$' + policyDetailsFromList.policyprice,
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.cyanAccent[700],
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 10),
                            Text(
                              '|',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Period:' +
                                  policyDetailsFromList.policyPeriod +
                                  ' days',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                        child: Text(
                          'Description:',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                        child: Text(
                          policyDetailsFromList.policyDescription,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w300,
                              color: Colors.grey),
                        ),
                      ),
                      SizedBox(height: 10),
                      Divider(),
                      SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) => SelectCategory()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: Container(
                            decoration: BoxDecoration(),
                            child: Center(
                              child: Text(
                                'Read Terms and conditions',
                                style: TextStyle(
                                  color: Colors.cyanAccent[700],
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      SizedBox(height: 70),
                    ],
                  ),
                ),
              ),
            ),
            disableApplybutton
                ? Container()
                : Positioned(
                    bottom: 10,
                    right: 20,
                    child: InkWell(
                      onTap: () {
                        if (policyDetailsFromList.policyCategory ==
                            "Personal accident insurance") {
                          if (policyDetailsFromList.policySubCategory ==
                              "Student insurance") {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => StudentInsurance()));
                          }
                          if (policyDetailsFromList.policySubCategory ==
                              "Trainee insurance") {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => StudentInsurance()));
                          }
                          if (policyDetailsFromList.policySubCategory ==
                              "Maid or homeworkerinsurance") {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => StudentInsurance()));
                          }
                        }

                        if (policyDetailsFromList.policyCategory ==
                            "Fire and general insurance") {
                          if (policyDetailsFromList.policySubCategory ==
                              "Occupant of property insurance") {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        OccupantOfPropertyInsurance()));
                          }
                          if (policyDetailsFromList.policySubCategory ==
                              "Owner of property insurance") {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        OccupantOfPropertyInsurance()));
                          }
                        }
                        if (policyDetailsFromList.policyCategory ==
                            "Marine insurance") {
                          print("Hiiiii222");

                          if (policyDetailsFromList.policySubCategory ==
                              "Motor boat insurance") {
                            print("Hiiiii222");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        MotorBoatInsurance()));
                          }
                          if (policyDetailsFromList.policySubCategory ==
                              "Picnic boat insurance") {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        MotorBoatInsurance()));
                          }
                          if (policyDetailsFromList.policySubCategory ==
                              "Jet ski insurance") {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        MotorBoatInsurance()));
                          }
                          if (policyDetailsFromList.policySubCategory ==
                              "Fishing boat insurance") {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        MotorBoatInsurance()));
                          }
                        }
                        if (policyDetailsFromList.policyCategory ==
                            "Travel insurance") {
                          if (policyDetailsFromList.policySubCategory ==
                              "Individual travel insurance") {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        IndividualTravelInsurancePolicy()));
                          }
                          if (policyDetailsFromList.policySubCategory ==
                              "Family travel insurance") {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        FamilyTravelInsurance()));
                          }
                        }
                      },
                      child: Container(
                        height: 55,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.cyanAccent[700],
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.2),
                                blurRadius: 10,
                                offset: Offset(2, 2))
                          ],
                        ),
                        child: Center(
                            child: Text(
                          'Apply Now',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        )),
                      ),
                    ),
                  ),
            disableApplybutton
                ? Container()
                : Positioned(
                    bottom: 10,
                    left: 20,
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Colors.cyanAccent[700],
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              blurRadius: 10,
                              offset: Offset(2, 2))
                        ],
                      ),
                      child: InkWell(
                        onTap: () async {
                          if (!wishListDocid
                              .contains(policyDetailsFromList.policyDocID)) {
                            setState(() {
                              addingToWish = true;
                            });
                            await addToWishList2(policyDetailsFromList);
                            setState(() {
                              addingToWish = false;
                            });
                          }
                        },
                        child: !addingToWish
                            ? wishListDocid
                                    .contains(policyDetailsFromList.policyDocID)
                                ? Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  )
                                : Icon(
                                    Icons.favorite,
                                    color: Colors.white,
                                  )
                            : Center(
                                child: CircularProgressIndicator(),
                              ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

Future<void> addToWishList2(PolicyDetails policyDetail) async {
  await FirebaseFirestore.instance.collection("Wish List").add({
    "documentId": policyDetail.policyDocID,
    "UserUid": userDetails.userUid,
    'PolicyImage': policyDetail.policyImage,
    'TermsAndConditions': policyDetail.policyTerms,
    'PolicyCategory': policyDetail.policyCategory,
    'PolicySubCategory': policyDetail.policySubCategory,
    'PolicyCompany': policyDetail.policyCompnay,
    'PolicyCompanyImage': policyDetail.policyCompanyImage,
    "PolicyCountry": policyDetail.policyCountry,
    'PolicyTittle': policyDetail.policytiitle,
    'PolicyPrice': policyDetail.policyprice,
    'PolicyPeriod': policyDetail.policyPeriod,
    "PolicyDescription": policyDetail.policyDescription,
    "Approved": false,
    "Rejected": false,
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
}
