import 'package:flutter/material.dart';
import 'package:isurance/Admin_panel/companies/edit_company.dart';
import 'package:isurance/Admin_panel/policies/PolicyModel.dart';
import 'package:isurance/Admin_panel/policies/edit_policy.dart';
import 'package:isurance/Admin_panel/policies/upload_policy/upload_policy.dart';

class PolicyInfo extends StatefulWidget {
  PolicyInfo({Key key}) : super(key: key);

  @override
  _PolicyInfoState createState() => _PolicyInfoState();
}

class _PolicyInfoState extends State<PolicyInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Policy Detail',
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
            Container(
              width: MediaQuery.of(context).size.width,
              height: 250,
              child: Image(
                  fit: BoxFit.cover,
                  image: NetworkImage(policyDetailsFromList.policyImage)),
            ),
            ListTile(
              dense: true,
              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
              title: Text('Title:', style: TextStyle(fontSize: 15)),
              subtitle: Text(
                policyDetailsFromList.policytiitle,
                style: TextStyle(fontSize: 15),
              ),
            ),
            ListTile(
              dense: true,
              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
              title: Text('Main Category:', style: TextStyle(fontSize: 15)),
              subtitle: Text(
                policyDetailsFromList.policyCategory,
                style: TextStyle(fontSize: 15),
              ),
            ),
            ListTile(
              dense: true,
              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
              title: Text('Sub Category:', style: TextStyle(fontSize: 15)),
              subtitle: Text(
                policyDetailsFromList.policySubCategory,
                style: TextStyle(fontSize: 15),
              ),
            ),
            ListTile(
              dense: true,
              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
              title: Text('Company:', style: TextStyle(fontSize: 15)),
              subtitle: Text(
                policyDetailsFromList.policyCompnay,
                style: TextStyle(fontSize: 15),
              ),
            ),
            SizedBox(height: 5),
            Divider(),
            SizedBox(height: 5),
            ListTile(
              dense: true,
              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
              title: Text('Price:', style: TextStyle(fontSize: 15)),
              subtitle: Text(
                '\$' + policyDetailsFromList.policyprice,
                style: TextStyle(fontSize: 15),
              ),
            ),
            ListTile(
              dense: true,
              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
              title: Text('Policy period:', style: TextStyle(fontSize: 15)),
              subtitle: Text(
                policyDetailsFromList.policyPeriod + ' year',
                style: TextStyle(fontSize: 15),
              ),
            ),
            ListTile(
              dense: true,
              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
              title: Text('Country:', style: TextStyle(fontSize: 15)),
              subtitle: Text(
                policyDetailsFromList.policyCountry,
                style: TextStyle(fontSize: 15),
              ),
            ),
            SizedBox(height: 5),
            Divider(),
            SizedBox(height: 5),
            ListTile(
              title: Text('Description:', style: TextStyle(fontSize: 15)),
              subtitle: Text(
                policyDetailsFromList.policyDescription,
                style: TextStyle(),
              ),
            ),
            SizedBox(height: 30),
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
                      'Terms and conditions',
                      style: TextStyle(
                        color: Colors.cyanAccent[700],
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
              child: RaisedButton(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                textColor: Colors.white,
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EditPolicy()));
                },
                elevation: 3,
                child: Text(
                  'Edit Policy',
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
