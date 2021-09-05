import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:isurance/Admin_panel/policies/PolicyModel.dart';
import 'package:isurance/Admin_panel/policies/edit_policy.dart';
import 'package:isurance/Admin_panel/policies/policy_info.dart';
import 'package:isurance/Admin_panel/policies/upload_policy/upload_policy.dart';
import 'package:isurance/menu/payment.dart';

class PoliciesList extends StatefulWidget {
  PoliciesList({Key key}) : super(key: key);

  @override
  _PoliciesListState createState() => _PoliciesListState();
}

class _PoliciesListState extends State<PoliciesList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Policies',
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
            stream: Firestore.instance.collection("Policies List").snapshots(),
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

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PolicyInfo()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 180,
                            height: 390,
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
                                    child: Image(
                                      image: NetworkImage(
                                          policyDetail["PolicyImage"]),
                                      width: MediaQuery.of(context).size.width,
                                      height: 180,
                                      fit: BoxFit.fill,
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
                                            "   year",
                                        style: TextStyle(
                                            fontSize: 16, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
            }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyanAccent[700],
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => UploadPolicy()));
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
