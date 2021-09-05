import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:isurance/Admin_panel/companies/CompanyModel.dart';
import 'package:isurance/Admin_panel/companies/add_new_company.dart';
import 'package:isurance/Admin_panel/companies/company_info.dart';

class CompaniesList extends StatefulWidget {
  CompaniesList({Key key}) : super(key: key);

  @override
  _CompaniesListState createState() => _CompaniesListState();
}

class _CompaniesListState extends State<CompaniesList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Companies',
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
            stream: Firestore.instance.collection("Companies List").snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: Text(
                    'NO COMPANIES YET',
                  ),
                );
              } else
                return ListView.builder(
                    itemCount: snapshot.data.documents.length,
                    itemBuilder: (context, index) {
                      DocumentSnapshot companyDetail =
                          snapshot.data.documents[index];

                      return Padding(
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
                                  child: ListTile(
                                    onTap: () {
                                      companyDetailFromList = CompanyModel(
                                          companyEmail:
                                              companyDetail["CompanyEmail"],
                                          companyLogo:
                                              companyDetail["CompanyLogo"],
                                          companyName:
                                              companyDetail["CompanyName"],
                                          companyPassword:
                                              companyDetail["CompanyPassword"]);

                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CompanyInfo()));
                                    },
                                    leading: CircleAvatar(
                                      radius: 28,
                                      child: ClipOval(
                                        child: SizedBox(
                                          height: 150,
                                          width: 150,
                                          child: Image(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(
                                                companyDetail["CompanyLogo"]),
                                            width: 50,
                                            height: 50,
                                          ),
                                        ),
                                      ),
                                    ),
                                    title: Text(
                                      companyDetail["CompanyName"],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Text(
                                      companyDetail["CompanyEmail"],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    });
            }),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyanAccent[700],
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AddNewCompany()));
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
