import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:isurance/Admin_panel/policies/PolicyModel.dart';
import 'package:isurance/menu/insurance_details.dart';
import 'package:isurance/menu/payment.dart';
import 'package:isurance/menu/popular_policies.dart';

import '../splash_screen.dart';
import 'Profile/approved.dart';
import 'home.dart';

String policyCategory = "";

class Policies extends StatefulWidget {
  @override
  _PoliciesState createState() => _PoliciesState();
}

class _PoliciesState extends State<Policies> {
  @override
  Widget build(BuildContext context) {
    disableApplybutton = false;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Popular Policies',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: StreamBuilder(
            stream: Firestore.instance
                .collection("Policies List")
                .where("PolicyCategory", isEqualTo: policyCategory)
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
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot policyDetail =
                          snapshot.data.documents[index];

                      return InkWell(
                        onTap: () {
                          policyDetailsFromList = PolicyDetails(
                              policyCategory: policyDetail["PolicyCategory"],
                              policyCompnay: policyDetail["PolicyCompany"],
                              policyCountry: policyDetail["PolicyCountry"],
                              policyDocID: policyDetail.documentID,
                              policyDescription:
                                  policyDetail["PolicyDescription"],
                              policyImage: policyDetail["PolicyImage"],
                              policyPeriod: policyDetail["PolicyPeriod"],
                              policySubCategory:
                                  policyDetail["PolicySubCategory"],
                              policyTerms: policyDetail["TermsAndConditions"],
                              policyprice: policyDetail["PolicyPrice"],
                              policytiitle: policyDetail["PolicyTittle"],
                              policyCompanyImage:
                                  policyDetail["PolicyCompanyImage"]);

                          companyImage = policyDetail["PolicyCompanyImage"];
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => InsuranceDetails()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 180,
                            height: 435,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.4),
                                      blurRadius: 10,
                                      offset: Offset(2, 2))
                                ]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 180,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10)),
                                    child: Stack(
                                      children: [
                                        Image(
                                          image: NetworkImage(policyDetail[
                                              "PolicyCompanyImage"]),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 180,
                                          fit: BoxFit.fill,
                                        ),
                                        Positioned(
                                            top: 10,
                                            right: 10,
                                            child: Container(
                                              width: 35,
                                              height: 35,
                                              decoration: BoxDecoration(
                                                  color: Colors.black26,
                                                  shape: BoxShape.circle),
                                              child: InkWell(
                                                onTap: () async {
                                                  if (!wishListDocid.contains(
                                                      policyDetail
                                                          .documentID)) {
                                                    setState(() {
                                                      addingToWish = true;
                                                    });
                                                    await addToWishList(
                                                        policyDetail);
                                                    setState(() {
                                                      addingToWish = false;
                                                    });
                                                  }
                                                },
                                                child: !addingToWish
                                                    ? wishListDocid.contains(
                                                            policyDetail
                                                                .documentID)
                                                        ? Icon(
                                                            Icons.favorite,
                                                            color: Colors.red,
                                                          )
                                                        : Icon(
                                                            Icons.favorite,
                                                            color: Colors.white,
                                                          )
                                                    : Center(
                                                        child:
                                                            CircularProgressIndicator(),
                                                      ),
                                              ),
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(7, 5, 0, 0),
                                  child: Row(
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
                                              image: NetworkImage(policyDetail[
                                                  "PolicyCompanyImage"]),
                                              width: 50,
                                              height: 50,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Text(
                                        policyDetail["PolicyCompany"],
                                        style: TextStyle(
                                            fontSize: 19,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 5, 0, 0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        policyDetail["PolicyTittle"],
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        policyDetail["PolicyCategory"],
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        policyDetail["PolicySubCategory"],
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        'Country | ' +
                                            policyDetail["PolicyCountry"],
                                        style: TextStyle(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                                Divider(),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 5, 0, 0),
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
                                        '\$' + policyDetail["PolicyPrice"],
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
                                        'Period: ' +
                                            policyDetail["PolicyPeriod"] +
                                            ' days',
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 5, 0, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // RaisedButton(
                                      //   padding:
                                      //       EdgeInsets.fromLTRB(50, 0, 50, 0),
                                      //   shape: RoundedRectangleBorder(
                                      //       borderRadius:
                                      //           BorderRadius.circular(5.0)),
                                      //   color: Colors.cyanAccent[700],
                                      //   textColor: Colors.white,
                                      //   child: Text("BUY",
                                      //       style: TextStyle(
                                      //         fontSize: 18.0,
                                      //       )),
                                      //   onPressed: () {
                                      //     Navigator.push(
                                      //         context,
                                      //         MaterialPageRoute(
                                      //             builder: (context) =>
                                      //                 Payment()));
                                      //   },
                                      // ),
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 10, 20, 0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Colors
                                                        .cyanAccent[700])),
                                          ),
                                          child: Text(
                                            'Read more',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.cyanAccent[700]),
                                          ),
                                        ),
                                      ),
                                      //SizedBox(width: 10),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
            }),
      ),
    );
  }
}
