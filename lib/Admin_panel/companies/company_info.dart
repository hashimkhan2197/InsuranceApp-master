import 'package:flutter/material.dart';
import 'package:isurance/Admin_panel/companies/CompanyModel.dart';
import 'package:isurance/Admin_panel/companies/add_new_company.dart';
import 'package:isurance/Admin_panel/companies/edit_company.dart';

class CompanyInfo extends StatefulWidget {
  @override
  _CompanyInfoState createState() => _CompanyInfoState();
}

class _CompanyInfoState extends State<CompanyInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Company Detail',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.cyanAccent[700]),
        elevation: 0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: ListView(
          children: [
            SizedBox(height: 30),
            Container(
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                radius: 150,
                child: ClipOval(
                  child: SizedBox(
                      height: 150,
                      width: 150,
                      child: Image(
                          fit: BoxFit.cover,
                          image:
                              NetworkImage(companyDetailFromList.companyLogo))),
                ),
              ),
            ),
            SizedBox(height: 5),
            Divider(),
            SizedBox(height: 5),
            SizedBox(height: 30),
            ListTile(
              dense: true,
              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
              title: Text('Company Name:', style: TextStyle(fontSize: 15)),
              subtitle: Text(
                companyDetailFromList.companyName,
                style: TextStyle(fontSize: 15),
              ),
            ),
            ListTile(
              dense: true,
              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
              title: Text('Email:', style: TextStyle(fontSize: 15)),
              subtitle: Text(
                companyDetailFromList.companyEmail,
                style: TextStyle(fontSize: 15),
              ),
            ),
            ListTile(
              dense: true,
              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
              title: Text('Password:', style: TextStyle(fontSize: 15)),
              subtitle: Text(
                companyDetailFromList.companyPassword,
                style: TextStyle(fontSize: 15),
              ),
            ),
            SizedBox(height: 30),
            Divider(),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
              child: RaisedButton(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                textColor: Colors.white,
                onPressed: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => EditCompany()));
                },
                elevation: 3,
                child: Text(
                  'Edit Company Details',
                  style: TextStyle(fontSize: 17),
                ),
                color: Colors.cyanAccent[700],
              ),
            ),
            SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
