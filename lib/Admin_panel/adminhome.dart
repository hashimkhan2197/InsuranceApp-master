import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:isurance/Admin_panel/applicants/applicants.dart';
import 'package:isurance/Admin_panel/companies/CompanyModel.dart';
import 'package:isurance/Admin_panel/companies/companies_list.dart';
import 'package:isurance/Admin_panel/customers/customers_list.dart';
import 'package:isurance/Admin_panel/policies/policies_list.dart';

class AdminHome extends StatefulWidget {
  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  bool _isLoading = true;
  @override
  Future<void> didChangeDependencies() async {
    await Firestore.instance
        .collection("Numbers")
        .getDocuments()
        .then((value) => {
              // ignore: deprecated_member_use
              for (int i = 0; i < value.documents.length; i++)
                {
                  if (value.documents[i].documentID == "Approved Policies")
                    approvedPolicies = value.documents[i]["Count"],
                  if (value.documents[i].documentID == "Number Of Users")
                    numberOfUsers = value.documents[i]["Count"],
                  if (value.documents[i].documentID == "Policies Sold")
                    policiesSold = value.documents[i]["Count"],
                  if (value.documents[i].documentID == "Rejected Policies")
                    rejectedPolicies = value.documents[i]["Count"],
                  if (value.documents[i].documentID == "Total Policies")
                    totalPolicies = value.documents[i]["Count"],
                }
            });
    setState(() {
      _isLoading = false;
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.cyanAccent[700]),
        elevation: 0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                children: [
                  SizedBox(height: 60),
                  Container(
                    width: 170,
                    height: 170,
                    child: Image(
                      image: AssetImage('assets/Logo.png'),
                    ),
                  ),
                  SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                        width: MediaQuery.of(context).size.width / 2.15,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  blurRadius: 10,
                                  offset: Offset(2, 2))
                            ]),
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                'TOTAL POLICIES',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 12),
                              ),
                              SizedBox(height: 10),
                              Text(
                                totalPolicies,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                        width: MediaQuery.of(context).size.width / 2.15,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  blurRadius: 10,
                                  offset: Offset(2, 2))
                            ]),
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                'POLICIES SOLD',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 12),
                              ),
                              SizedBox(height: 10),
                              Text(
                                policiesSold,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                        width: MediaQuery.of(context).size.width / 2.15,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  blurRadius: 10,
                                  offset: Offset(2, 2))
                            ]),
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                'NUMBER OF USERS',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 12),
                              ),
                              SizedBox(height: 10),
                              Text(
                                numberOfUsers,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                        width: MediaQuery.of(context).size.width / 2.15,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  blurRadius: 10,
                                  offset: Offset(2, 2))
                            ]),
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                'APPROVED POLICIES',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 12),
                              ),
                              SizedBox(height: 10),
                              Text(
                                approvedPolicies,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                        width: MediaQuery.of(context).size.width / 2.15,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  blurRadius: 10,
                                  offset: Offset(2, 2))
                            ]),
                        child: Center(
                          child: Column(
                            children: [
                              Text(
                                'REJECTED POLICIES',
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 12),
                              ),
                              SizedBox(height: 10),
                              Text(
                                rejectedPolicies,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: <Widget>[
            SizedBox(height: 80),
            Container(
              width: 150,
              height: 150,
              child: Image(
                image: AssetImage('assets/Logo.png'),
              ),
            ),
            SizedBox(height: 50),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CompaniesList()));
              },
              leading: Image(
                image: AssetImage('assets/company.png'),
                width: 30,
                height: 30,
              ),
              title: Text('COMPANIES'),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PoliciesList()));
              },
              leading: Image(
                image: AssetImage('assets/policies.png'),
                width: 30,
                height: 30,
              ),
              title: Text('POLICIES'),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CustomersList()));
              },
              leading: Image(
                image: AssetImage('assets/users.png'),
                width: 30,
                height: 30,
              ),
              title: Text('CUSTOMERS'),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Applicants()));
              },
              leading: Image(
                image: AssetImage('assets/applicant.png'),
                width: 30,
                height: 30,
              ),
              title: Text('APPLICANTS'),
            ),
            SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
              child: RaisedButton(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                textColor: Colors.white,
                onPressed: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => Login()));
                },
                elevation: 3,
                child: Text(
                  'LOG OUT',
                ),
                color: Colors.cyanAccent[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
