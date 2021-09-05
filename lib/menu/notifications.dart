import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:isurance/Admin_panel/policies/PolicyModel.dart';
import 'package:isurance/Login_signup/UserModel.dart';
import 'package:isurance/menu/Profile/profile.dart';
import 'package:isurance/menu/popular_policies.dart';

import 'Profile/approved.dart';
import 'insurance_details.dart';

class Notifications extends StatefulWidget {
  Notifications({Key key}) : super(key: key);

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
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
                .collection("Applications")
                .where("UserUid", isEqualTo: userDetails.userUid)
                .where("Approved", isEqualTo: true)
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
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Container(
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
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ListTile(
                                        leading: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          backgroundImage: NetworkImage(
                                              policyDetail[
                                                  "PolicyCompanyImage"]),
                                          radius: 30,
                                        ),
                                        title: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 10, bottom: 10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(policyDetail[
                                                      "PolicyCompany"] +
                                                  ' accepted your policy,'),
                                              SizedBox(
                                                height: 10,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
            }),
      ),
    );
  }
}
//  Row(
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.all(5.0),
//                                 child: Container(
//                                   width: 60,
//                                   height: 60,
//                                   decoration: BoxDecoration(
//                                     shape: BoxShape.circle,
//                                   ),
//                                   child: CircleAvatar(
//                                     backgroundImage:
//                                         AssetImage('assets/opel.jpg'),
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(width: 5),

//                             ],
//                           ),
