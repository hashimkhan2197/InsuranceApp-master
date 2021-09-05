import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:isurance/Admin_panel/policies/PolicyModel.dart';
import 'package:isurance/Admin_panel/policies/policies_list.dart';
import 'package:isurance/Funtions/search.dart';
import 'package:isurance/Login_signup/UserModel.dart';
import 'package:isurance/TermsAndConditionViewer.dart';
import 'package:isurance/menu/Policies.dart';
import 'package:isurance/menu/categories.dart';
import 'package:isurance/menu/chat.dart';
import 'package:isurance/menu/insurance_details.dart';
import 'package:isurance/menu/notifications.dart';
import 'package:isurance/menu/payment.dart';
import 'package:isurance/menu/popular_policies.dart';
import 'package:isurance/menu/profile/approved.dart';
import 'package:isurance/splash_screen.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  int _slidervalue = 40;

  Widget build(BuildContext context) {
    disableApplybutton = false;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        actions: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Notifications()));
                },
                child: Icon(
                  Icons.notifications_outlined,
                  color: Colors.black,
                  size: 28,
                ),
              ),
              SizedBox(width: 20),
            ],
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: ListView(
          children: [
            Container(
              height: 135,
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
                  ]),
              child: Column(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 10, 0, 0),
                        child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey.withOpacity(0.4),
                                      blurRadius: 10,
                                      offset: Offset(0, 2))
                                ]),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              child: Image(
                                image: NetworkImage(userDetails.userImage),
                                fit: BoxFit.cover,
                              ),
                            )),
                      ),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hi, ' + userDetails.username,
                            style: TextStyle(
                                fontSize: 21, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 3),
                          Text(
                            'How\'re you today?',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Stack(
                    children: [
                      Container(
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
                                hintStyle: TextStyle(
                                    color: Colors.grey[600], fontSize: 14),
                                //labelText: label,
                                hintText: "Search...",
                                prefixIcon: Icon(
                                  Icons.search,
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
                      ),
                      InkWell(
                        onTap: () {
                          showSearch(context: context, delegate: DataSearch());
                        },
                        child: Container(
                          height: 60,
                          width: MediaQuery.of(context).size.width,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Categories()));
                    },
                    child: Container(
                      child: Text(
                        'View all Categories',
                        style: TextStyle(
                          color: Colors.cyanAccent[700],
                          fontSize: 14.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 8),
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    InkWell(
                      onTap: () {
//                        policyCategory = "Marine insurance";
//                        Navigator.push(
//                            context,
//                            MaterialPageRoute(
//                                builder: (context) => Policies()));
                      },
                      child: Container(
                        // height: 30,
                        // width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        decoration: BoxDecoration(
                          color: Colors.blue[200],
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Row(
                          children: [
                            Image(
                              image: AssetImage('assets/marineinsurance.png'),
                              height: 40,
                              width: 40,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(width: 15),
                            Text('Marine Insurance'),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    InkWell(
                      onTap: () {
//                        policyCategory = "Travel insurance";
//                        Navigator.push(
//                            context,
//                            MaterialPageRoute(
//                                builder: (context) => Policies()));
                      },
                      child: Container(
                        // height: 30,
                        // width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        decoration: BoxDecoration(
                          color: Colors.lightGreen[100],
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Row(
                          children: [
                            Image(
                              image: AssetImage('assets/travelinsurance.png'),
                              height: 40,
                              width: 40,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(width: 15),
                            Text('Travel Insurance'),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Categories()));
                      },
                      child: Container(
                        // height: 30,
                        // width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.cyanAccent[700]),
                          color: Colors.cyanAccent[1009],
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        color: Colors.cyanAccent[700])),
                              ),
                              child: Text(
                                'See more',
                                style: TextStyle(color: Colors.cyanAccent[700]),
                              ),
                            ),
                            SizedBox(width: 15),
                            Icon(Icons.more, color: Colors.cyanAccent[700]),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
                height: MediaQuery.of(context).size.height / 3.5,
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

                              return Container(
                                height: MediaQuery.of(context).size.height / 3,
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
                                          InkWell(
                                            onTap: () {
                                              policyDetailsFromList = PolicyDetails(
                                                  policyCategory: policyDetail[
                                                      "PolicyCategory"],
                                                  policyCompnay: policyDetail[
                                                      "PolicyCompany"],
                                                  policyCountry: policyDetail[
                                                      "PolicyCountry"],
                                                  policyDocID:
                                                      policyDetail.documentID,
                                                  policyDescription:
                                                      policyDetail[
                                                          "PolicyDescription"],
                                                  policyImage: policyDetail[
                                                      "PolicyImage"],
                                                  policyPeriod: policyDetail[
                                                      "PolicyPeriod"],
                                                  policySubCategory:
                                                      policyDetail[
                                                          "PolicySubCategory"],
                                                  policyTerms: policyDetail[
                                                      "TermsAndConditions"],
                                                  policyprice: policyDetail[
                                                      "PolicyPrice"],
                                                  policytiitle: policyDetail[
                                                      "PolicyTittle"],
                                                  policyCompanyImage:
                                                      policyDetail[
                                                          "PolicyCompanyImage"]);
                                              setState(() {
                                                disableApplybutton = true;
                                              });

                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          InsuranceDetails()));
                                            },
                                            child: Row(
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
                                          ),
                                          RaisedButton(
                                            padding: EdgeInsets.fromLTRB(
                                                30, 10, 30, 10),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5.0)),
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
                                                    .difference(DateTime.now())
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
                                        min: 0,
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
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          TermsAndConditionViewer(
                                                            termsAndConditions:
                                                                policyDetail[
                                                                    "TermsAndConditions"],
                                                          )));
                                            },
                                            child: Row(
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
                                          ),
                                          InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Chat(
                                                            fromAdmin: false,
                                                            recieverId:
                                                                "5hh63aB3q6fEIyYnXd38",
                                                            recieverAvatar:
                                                                userDetails
                                                                    .userImage,
                                                            senderId:
                                                                userDetails
                                                                    .userDocId,
                                                            senderAvatar:
                                                                userDetails
                                                                    .userImage,
                                                          )));
                                            },
                                            child: Row(
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
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                    }),
              ),
            ),
            SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 20, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular items',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                  InkWell(
                    onTap: () {
//                      Navigator.push(
//                          context,
//                          MaterialPageRoute(
//                              builder: (context) => PopularPolicies()));
                    },
                    child: Text(
                      'view all items',
                      style: TextStyle(
                          fontSize: 14, color: Colors.cyanAccent[700]),
                    ),
                  ),
                ],
              ),
            ),
//            Container(
//              height: 300,
//              width: MediaQuery.of(context).size.width,
//              child: StreamBuilder(
//                  stream: Firestore.instance
//                      .collection("Policies List")
//                      .snapshots(),
//                  builder: (context, snapshot) {
//                    if (!snapshot.hasData) {
//                      return Center(
//                        child: CircularProgressIndicator(),
//                        // child: Text(
//                        //   'NO POLOCIES YET',
//                        // ),
//                      );
//                    } else
//                      return ListView.builder(
//                          scrollDirection: Axis.horizontal,
//                          itemCount: snapshot.data.documents.length,
//                          itemBuilder: (context, index) {
//                            DocumentSnapshot policyDetail =
//                                snapshot.data.documents[index];
//
//                            return InkWell(
//                              onTap: () {
//                                policyDetailsFromList = PolicyDetails(
//                                    policyCategory:
//                                        policyDetail["PolicyCategory"],
//                                    policyCompnay:
//                                        policyDetail["PolicyCompany"],
//                                    policyDocID: policyDetail.documentID,
//                                    policyCountry:
//                                        policyDetail["PolicyCountry"],
//                                    policyDescription:
//                                        policyDetail["PolicyDescription"],
//                                    policyImage: policyDetail["PolicyImage"],
//                                    policyPeriod: policyDetail["PolicyPeriod"],
//                                    policySubCategory:
//                                        policyDetail["PolicySubCategory"],
//                                    policyTerms:
//                                        policyDetail["TermsAndConditions"],
//                                    policyprice: policyDetail["PolicyPrice"],
//                                    policytiitle: policyDetail["PolicyTittle"],
//                                    policyCompanyImage:
//                                        policyDetail["PolicyCompanyImage"]);
//
//                                companyImage =
//                                    policyDetail["PolicyCompanyImage"];
//                                Navigator.push(
//                                    context,
//                                    MaterialPageRoute(
//                                        builder: (context) =>
//                                            InsuranceDetails()));
//                              },
//                              child: Padding(
//                                padding: const EdgeInsets.all(8.0),
//                                child: Container(
//                                  width: 230,
//                                  height: MediaQuery.of(context).size.height,
//                                  decoration: BoxDecoration(
//                                      color: Colors.white,
//                                      borderRadius:
//                                          BorderRadius.all(Radius.circular(10)),
//                                      boxShadow: [
//                                        BoxShadow(
//                                            color: Colors.grey.withOpacity(0.4),
//                                            blurRadius: 10,
//                                            offset: Offset(2, 2))
//                                      ]),
//                                  child: Column(
//                                    crossAxisAlignment:
//                                        CrossAxisAlignment.start,
//                                    children: [
//                                      Stack(
//                                        children: [
//                                          Container(
//                                            width: 230,
//                                            height: 130,
//                                            child: ClipRRect(
//                                              borderRadius: BorderRadius.only(
//                                                  topLeft: Radius.circular(10),
//                                                  topRight:
//                                                      Radius.circular(10)),
//                                              child: Image(
//                                                image: NetworkImage(
//                                                    policyDetail[
//                                                        "PolicyImage"]),
//                                                height: 130,
//                                                fit: BoxFit.cover,
//                                              ),
//                                            ),
//                                          ),
//                                          Positioned(
//                                              top: 2,
//                                              right: 2,
//                                              child: Container(
//                                                width: 30,
//                                                height: 30,
//                                                decoration: BoxDecoration(
//                                                    color: Colors.black26,
//                                                    shape: BoxShape.circle),
//                                                child: InkWell(
//                                                  onTap: () async {
//                                                    if (!wishListDocid.contains(
//                                                        policyDetail
//                                                            .documentID)) {
//                                                      setState(() {
//                                                        addingToWish = true;
//                                                      });
//                                                      await addToWishList(
//                                                          policyDetail);
//                                                      setState(() {
//                                                        addingToWish = false;
//                                                      });
//                                                    }
//                                                  },
//                                                  child: !addingToWish
//                                                      ? wishListDocid.contains(
//                                                              policyDetail
//                                                                  .documentID)
//                                                          ? Icon(
//                                                              Icons.favorite,
//                                                              color: Colors.red,
//                                                            )
//                                                          : Icon(
//                                                              Icons.favorite,
//                                                              color:
//                                                                  Colors.white,
//                                                            )
//                                                      : Center(
//                                                          child:
//                                                              CircularProgressIndicator(),
//                                                        ),
//                                                ),
//                                              )),
//                                        ],
//                                      ),
//                                      SizedBox(height: 10),
//                                      Padding(
//                                        padding: const EdgeInsets.fromLTRB(
//                                            7, 5, 0, 0),
//                                        child: Row(
//                                          children: [
//                                            CircleAvatar(
//                                              radius: 16,
//                                              backgroundColor: Colors.grey[100],
//                                              child: ClipOval(
//                                                child: SizedBox(
//                                                  height: 35,
//                                                  width: 35,
//                                                  child: Image(
//                                                    fit: BoxFit.cover,
//                                                    image: NetworkImage(
//                                                        policyDetail[
//                                                            "PolicyCompanyImage"]),
//                                                    width: 50,
//                                                    height: 50,
//                                                  ),
//                                                ),
//                                              ),
//                                            ),
//                                            SizedBox(width: 10),
//                                            Text(
//                                              policyDetail["PolicyCompany"],
//                                              style: TextStyle(
//                                                  fontSize: 17,
//                                                  fontWeight: FontWeight.w500),
//                                            ),
//                                          ],
//                                        ),
//                                      ),
//                                      Divider(),
//                                      Padding(
//                                        padding: const EdgeInsets.fromLTRB(
//                                            10, 5, 0, 0),
//                                        child: Column(
//                                          mainAxisAlignment:
//                                              MainAxisAlignment.start,
//                                          crossAxisAlignment:
//                                              CrossAxisAlignment.start,
//                                          children: [
//                                            Text(
//                                              policyDetail["PolicyCategory"],
//                                              style:
//                                                  TextStyle(color: Colors.grey),
//                                            ),
//                                            SizedBox(height: 5),
//                                            Text(
//                                              policyDetail["PolicySubCategory"],
//                                              style:
//                                                  TextStyle(color: Colors.grey),
//                                            ),
//                                          ],
//                                        ),
//                                      ),
//                                      Padding(
//                                        padding: const EdgeInsets.fromLTRB(
//                                            10, 10, 0, 0),
//                                        child: Row(
//                                          children: [
//                                            Text(
//                                              'Price:',
//                                              style: TextStyle(),
//                                            ),
//                                            SizedBox(width: 10),
//                                            Text(
//                                              '\$' +
//                                                  policyDetail["PolicyPrice"],
//                                              style: TextStyle(
//                                                  color: Colors.cyanAccent[700],
//                                                  fontWeight: FontWeight.bold),
//                                            ),
//                                          ],
//                                        ),
//                                      ),
//                                    ],
//                                  ),
//                                ),
//                              ),
//                            );
//                          });
//                  }),
//            ),
          ],
        ),
      ),
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

Future<void> addToWishList(policyDetail) async {
  await FirebaseFirestore.instance.collection("Wish List").add({
    "documentId": policyDetail.documentID,
    "UserUid": userDetails.userUid,
    'PolicyImage': policyDetail["PolicyImage"],
    'TermsAndConditions': policyDetail["TermsAndConditions"],
    'PolicyCategory': policyDetail["PolicyCategory"],
    'PolicySubCategory': policyDetail["PolicySubCategory"],
    'PolicyCompany': policyDetail["PolicyCompany"],
    'PolicyCompanyImage': policyDetail["PolicyCompanyImage"],
    "PolicyCountry": policyDetail["PolicyCountry"],
    'PolicyTittle': policyDetail["PolicyTittle"],
    'PolicyPrice': policyDetail["PolicyPrice"],
    'PolicyPeriod': policyDetail["PolicyPeriod"],
    "PolicyDescription": policyDetail["PolicyDescription"],
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
