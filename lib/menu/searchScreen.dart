import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:isurance/Admin_panel/policies/PolicyModel.dart';
import 'package:isurance/Funtions/search.dart';
import 'package:isurance/menu/insurance_details.dart';
import 'package:isurance/menu/payment.dart';
import 'package:isurance/menu/popular_policies.dart';

import '../splash_screen.dart';
import 'Policies.dart';
import 'home.dart';

class Search extends StatefulWidget {
  Search({Key key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  bool fav = true;
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: ListView.builder(
              itemCount: searchedUsers.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    policyDetailsFromList = PolicyDetails(
                        policyCategory: searchedUsers[index].policyCategory,
                        policyCompnay: searchedUsers[index].policyCompnay,
                        policyCountry: searchedUsers[index].policyCountry,
                        policyDocID: searchedUsers[index].policyDocID,
                        policyDescription:
                            searchedUsers[index].policyDescription,
                        policyImage: searchedUsers[index].policyImage,
                        policyPeriod: searchedUsers[index].policyPeriod,
                        policySubCategory:
                            searchedUsers[index].policySubCategory,
                        policyTerms: searchedUsers[index].policyTerms,
                        policyprice: searchedUsers[index].policyprice,
                        policytiitle: searchedUsers[index].policytiitle,
                        policyCompanyImage:
                            searchedUsers[index].policyCompanyImage);

                    companyImage = searchedUsers[index].policyCompanyImage;
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
                          borderRadius: BorderRadius.all(Radius.circular(10)),
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
                                    image: NetworkImage(searchedUsers[index]
                                        .policyCompanyImage),
                                    width: MediaQuery.of(context).size.width,
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
                                                searchedUsers[index]
                                                    .policyDocID)) {
                                              setState(() {
                                                addingToWish = true;
                                              });
                                              PolicyDetails policyDet = PolicyDetails(
                                                  policyCategory:
                                                      searchedUsers[index]
                                                          .policyCategory,
                                                  policyCompnay:
                                                      searchedUsers[index]
                                                          .policyCompnay,
                                                  policyCountry:
                                                      searchedUsers[index]
                                                          .policyCountry,
                                                  policyDocID: searchedUsers[index]
                                                      .policyDocID,
                                                  policyDescription:
                                                      searchedUsers[index]
                                                          .policyDescription,
                                                  policyImage: searchedUsers[index]
                                                      .policyImage,
                                                  policyPeriod: searchedUsers[index]
                                                      .policyPeriod,
                                                  policySubCategory:
                                                      searchedUsers[index]
                                                          .policySubCategory,
                                                  policyTerms: searchedUsers[index]
                                                      .policyTerms,
                                                  policyprice: searchedUsers[index]
                                                      .policyprice,
                                                  policytiitle: searchedUsers[index]
                                                      .policytiitle,
                                                  policyCompanyImage:
                                                      searchedUsers[index]
                                                          .policyCompanyImage);
                                              await addToWishList(policyDet);
                                              setState(() {
                                                addingToWish = false;
                                              });
                                            }
                                          },
                                          child: !addingToWish
                                              ? wishListDocid.contains(
                                                      searchedUsers[index]
                                                          .policyDocID)
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
                            padding: const EdgeInsets.fromLTRB(7, 5, 0, 0),
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
                                        image: NetworkImage(searchedUsers[index]
                                            .policyCompanyImage),
                                        width: 50,
                                        height: 50,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  searchedUsers[index].policyCompnay,
                                  style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          Divider(),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  searchedUsers[index].policytiitle,
                                  style: TextStyle(fontSize: 18),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  searchedUsers[index].policyCategory,
                                  style: TextStyle(color: Colors.grey),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  searchedUsers[index].policySubCategory,
                                  style: TextStyle(color: Colors.grey),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Country | ' +
                                      searchedUsers[index].policyCountry,
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          Divider(),
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
                                  '\$' + searchedUsers[index].policyprice,
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
                                      searchedUsers[index].policyPeriod +
                                      ' days',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 5),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 20, 0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: Colors.cyanAccent[700])),
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
              })),
    );
  }
}

Widget _input(String hint, IconData icon) {
  return Container(
    height: 60,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
    ),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 15, 0),
      child: TextFormField(
        decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.grey[600], fontSize: 14),
            //labelText: label,
            hintText: hint,
            prefixIcon: Icon(
              icon,
              color: Colors.grey,
            ),
            focusColor: Colors.grey,
            fillColor: Colors.white),
        //keyboardType: TextInputType.emailAddress,
        style: TextStyle(
          fontFamily: "Poppins",
        ),
      ),
    ),
  );
}
