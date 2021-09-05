import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:isurance/Admin_panel/policies/PolicyModel.dart';
import 'package:isurance/Login_signup/UserModel.dart';
import 'package:isurance/menu/profile/approved.dart';
import 'package:isurance/menu/profile/favorite.dart';
import 'package:isurance/menu/inbox.dart';
import 'package:isurance/menu/payment.dart';
import 'package:isurance/menu/profile/pending.dart';
import 'package:isurance/menu/profile/rejected.dart';
import 'package:isurance/menu/profile/approved.dart';

import '../chat.dart';
import '../insurance_details.dart';

class Profile extends StatefulWidget {
  Profile({Key key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int _slidervalue = 40;
  @override
  Widget build(BuildContext context) {
    disableApplybutton = false;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Chat(
                                fromAdmin: false,
                                recieverId: "5hh63aB3q6fEIyYnXd38",
                                recieverAvatar: userDetails.userImage,
                                senderId: userDetails.userDocId,
                                senderAvatar: userDetails.userImage,
                              )));
                },
                child: Icon(
                  Icons.email_outlined,
                  color: Colors.black,
                  size: 28,
                ),
              ),
              SizedBox(width: 20),
            ],
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: ListView(
          children: [
            SizedBox(height: 20),
            Column(
              children: [
                Container(
                  width: 110,
                  height: 110,
                  decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            blurRadius: 10,
                            offset: Offset(5, 5))
                      ]),
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      child: Stack(
                        children: [
                          Image(
                            image: NetworkImage(userDetails.userImage),
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                          // Positioned(
                          //   bottom: -3,
                          //   right: -3,
                          //   child: Container(
                          //     width: 30,
                          //     height: 30,
                          //     decoration: BoxDecoration(
                          //         color: Colors.white, shape: BoxShape.circle),
                          //     child: InkWell(
                          //       child: Icon(
                          //         Icons.edit,
                          //         color: Colors.black,
                          //         size: 20,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  userDetails.username,
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 10),
                Text(
                  userDetails.userEmail,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                ),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => WishList()));
                          },
                          child: Container(
                            width: 65,
                            height: 65,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      blurRadius: 10,
                                      offset: Offset(2, 2))
                                ]),
                            child: Center(
                              child: Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Wish List',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
//                            Navigator.push(
//                                context,
//                                MaterialPageRoute(
//                                    builder: (context) => Approved()));
                          },
                          child: Container(
                            width: 65,
                            height: 65,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      blurRadius: 10,
                                      offset: Offset(2, 2))
                                ]),
                            child: Center(
                              child: Icon(
                                Icons.check,
                                color: Colors.cyanAccent[700],
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Approved',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
//                            Navigator.push(
//                                context,
//                                MaterialPageRoute(
//                                    builder: (context) => Pending()));
                          },
                          child: Container(
                            width: 65,
                            height: 65,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      blurRadius: 10,
                                      offset: Offset(2, 2))
                                ]),
                            child: Center(
                              child: Icon(
                                Icons.access_time,
                                color: Colors.cyanAccent[700],
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Pending',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        InkWell(
                          onTap: () {
//                            Navigator.push(
//                                context,
//                                MaterialPageRoute(
//                                    builder: (context) => Rejected()));
                          },
                          child: Container(
                            width: 65,
                            height: 65,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.2),
                                      blurRadius: 10,
                                      offset: Offset(2, 2))
                                ]),
                            child: Center(
                              child: Icon(
                                Icons.remove_circle_outline,
                                color: Colors.cyanAccent[700],
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Rejected',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Active Policies',
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: MediaQuery.of(context).size.height / 3,
                width: 350,
                child: StreamBuilder(
                    stream: Firestore.instance
                        .collection("Applications")
                        .where("Approved", isEqualTo: true)
                        .where("UserUid", isEqualTo: userDetails.userUid)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(),
                          // child: Text(
                          //   'NO POLOCIES YET',
                          // ),
                        );
                      } else
                        return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data.documents.length,
                            itemBuilder: (context, index) {
                              DocumentSnapshot policyDetail =
                                  snapshot.data.documents[index];

                              return InkWell(
                                onTap: () {
                                  policyDetailsFromList = PolicyDetails(
                                      policyCategory:
                                          policyDetail["PolicyCategory"],
                                      policyCompnay:
                                          policyDetail["PolicyCompany"],
                                      policyCountry:
                                          policyDetail["PolicyCountry"],
                                      policyDocID: policyDetail.documentID,
                                      policyDescription:
                                          policyDetail["PolicyDescription"],
                                      policyImage: policyDetail["PolicyImage"],
                                      policyPeriod:
                                          policyDetail["PolicyPeriod"],
                                      policySubCategory:
                                          policyDetail["PolicySubCategory"],
                                      policyTerms:
                                          policyDetail["TermsAndConditions"],
                                      policyprice: policyDetail["PolicyPrice"],
                                      policytiitle:
                                          policyDetail["PolicyTittle"],
                                      policyCompanyImage:
                                          policyDetail["PolicyCompanyImage"]);

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              InsuranceDetails()));
                                },
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height / 3,
                                  width: 350,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.withOpacity(0.2),
                                            blurRadius: 10,
                                            offset: Offset(2, 2))
                                      ]),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    width: 50,
                                                    height: 50,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                    ),
                                                    child: CircleAvatar(
                                                      backgroundImage:
                                                          NetworkImage(
                                                              policyDetail[
                                                                  "PolicyImage"]),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 5),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      policyDetail[
                                                          "PolicyTittle"],
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    SizedBox(height: 3),
                                                    Text(
                                                      policyDetail[
                                                          "PolicyCompany"],
                                                      style: TextStyle(
                                                          color: Colors.grey),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            RaisedButton(
                                              padding: EdgeInsets.fromLTRB(
                                                  30, 10, 30, 10),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          5.0)),
                                              color: Colors.cyanAccent[700],
                                              textColor: Colors.white,
                                              child: Text("Extend",
                                                  style: TextStyle(
                                                    fontSize: 18.0,
                                                  )),
                                              onPressed: () {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Payment()));
                                              },
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text('Policy ends in:'),
                                            Text(
                                              DateTime.parse(policyDetail[
                                                          "EndingDate"])
                                                      .difference(
                                                          DateTime.now())
                                                      .inDays
                                                      .toString() +
                                                  ' Days',
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                        Slider(
                                          value: DateTime.parse(
                                                  policyDetail["EndingDate"])
                                              .difference(DateTime.now())
                                              .inDays
                                              .toDouble(),
                                          min: 0.0,
                                          max: DateTime.parse(
                                                  policyDetail["EndingDate"])
                                              .difference(DateTime.parse(
                                                  policyDetail["StartingDate"]))
                                              .inDays
                                              .toDouble(),
                                          onChanged: (_) => {},
                                          activeColor: Colors.cyanAccent[700],
                                          inactiveColor: Colors.grey[300],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          5, 10, 0, 0),
                                                  child: Container(
                                                    width: 40,
                                                    height: 40,
                                                    padding: EdgeInsets.all(8),
                                                    decoration: BoxDecoration(
                                                      color: Colors
                                                          .cyanAccent[100],
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10)),
                                                    ),
                                                    child: Image(
                                                      image: AssetImage(
                                                          'assets/Policy.png'),
                                                      fit: BoxFit.fill,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          10, 10, 10, 0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Policy',
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                      SizedBox(height: 3),
                                                      Text(
                                                        'Document',
                                                        style: TextStyle(
                                                            fontSize: 13,
                                                            color: Colors.grey),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          10, 10, 0, 0),
                                                  child: Container(
                                                    width: 40,
                                                    height: 40,
                                                    padding: EdgeInsets.all(8),
                                                    decoration: BoxDecoration(
                                                      color: Colors.orange[100],
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10)),
                                                    ),
                                                    child: Image(
                                                      image: AssetImage(
                                                          'assets/headset.png'),
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          10, 10, 10, 0),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Get help',
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                      SizedBox(height: 3),
                                                      Text(
                                                        'Chat, claims',
                                                        style: TextStyle(
                                                            fontSize: 13,
                                                            color: Colors.grey),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            });
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
