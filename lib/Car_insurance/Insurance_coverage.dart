import 'package:flutter/material.dart';
import 'package:isurance/Car_insurance/Discount.dart';

class InsuranceCoverage extends StatefulWidget {
  InsuranceCoverage({Key key}) : super(key: key);

  @override
  _InsuranceCoverageState createState() => _InsuranceCoverageState();
}

class _InsuranceCoverageState extends State<InsuranceCoverage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: ListView(
          children: [
            SizedBox(height: 50),
            Text(
              'HOW MUCH INSURANCE COVERAGE DO YOU WANT?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 50),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 400,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Container(
                    width: width * 0.7,
                    height: 350,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 10,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 20, 10, 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Basic Coverage',
                              //textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 23.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 40),
                          ListTile(
                            dense: true,
                            visualDensity:
                                VisualDensity(vertical: -4, horizontal: -4),
                            leading: Icon(
                              Icons.check,
                              color: Colors.black,
                              size: 18,
                            ),
                            title: Text(
                              'Third party liability',
                              style: TextStyle(
                                fontSize: 15.0,
                              ),
                            ),
                            trailing: Text('1M'),
                          ),
                          ListTile(
                            dense: true,
                            visualDensity:
                                VisualDensity(vertical: -4, horizontal: -4),
                            leading: Icon(
                              Icons.check,
                              color: Colors.black,
                              size: 18,
                            ),
                            title: Text(
                              'Collision deductible',
                              style: TextStyle(
                                fontSize: 15.0,
                              ),
                            ),
                            trailing: Text('\$1000'),
                          ),
                          ListTile(
                            dense: true,
                            visualDensity:
                                VisualDensity(vertical: -4, horizontal: -4),
                            leading: Icon(
                              Icons.check,
                              color: Colors.black,
                              size: 18,
                            ),
                            title: Text(
                              'Comprehensive deductible',
                              style: TextStyle(
                                fontSize: 15.0,
                              ),
                            ),
                            trailing: Text('\$1000'),
                          ),
                          ListTile(
                            dense: true,
                            visualDensity:
                                VisualDensity(vertical: -4, horizontal: -4),
                            leading: Icon(
                              Icons.cancel,
                              color: Colors.black,
                              size: 18,
                            ),
                            title: Text(
                              'Third party liability',
                              style: TextStyle(
                                fontSize: 15.0,
                              ),
                            ),
                            trailing: Text('NO'),
                          ),
                          ListTile(
                            dense: true,
                            visualDensity:
                                VisualDensity(vertical: -4, horizontal: -4),
                            leading: Icon(
                              Icons.cancel,
                              color: Colors.black,
                              size: 18,
                            ),
                            title: Text(
                              'Third party liability',
                              style: TextStyle(
                                fontSize: 15.0,
                              ),
                            ),
                            trailing: Text('NO'),
                          ),
                          SizedBox(height: 40),
                          Center(
                            child: RaisedButton(
                              color: Colors.black,
                              onPressed:  () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Discount(),
                                  ),
                                );
                              },
                              child: Text('Get Basic'),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: width * 0.7,
                    height: 350,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 10,
                          offset: Offset(2, 2),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15.0),
                                topRight: Radius.circular(15.0)),
                            child: Container(
                              width: width,
                              height: 30,
                              color: Colors.cyanAccent[700],
                              child: Center(
                                  child: Text(
                                'Most Pupolar choice',
                                style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              'Premium Coverage',
                              //textAlign: TextAlign.right,
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.cyanAccent[700],
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          ListTile(
                            dense: true,
                            visualDensity:
                                VisualDensity(vertical: -4, horizontal: -4),
                            leading: Icon(
                              Icons.check,
                              color: Colors.cyanAccent[700],
                              size: 18,
                            ),
                            title: Text(
                              'Third party liability',
                              style: TextStyle(
                                fontSize: 15.0,
                              ),
                            ),
                            trailing: Text('2M'),
                          ),
                          ListTile(
                            dense: true,
                            visualDensity:
                                VisualDensity(vertical: -4, horizontal: -4),
                            leading: Icon(
                              Icons.check,
                              color: Colors.cyanAccent[700],
                              size: 18,
                            ),
                            title: Text(
                              'Collision deductible',
                              style: TextStyle(
                                fontSize: 15.0,
                              ),
                            ),
                            trailing: Text('\$500'),
                          ),
                          ListTile(
                            dense: true,
                            visualDensity:
                                VisualDensity(vertical: -4, horizontal: -4),
                            leading: Icon(
                              Icons.check,
                              color: Colors.cyanAccent[700],
                              size: 18,
                            ),
                            title: Text(
                              'Comprehensive deductible',
                              style: TextStyle(
                                fontSize: 15.0,
                              ),
                            ),
                            trailing: Text('\$500'),
                          ),
                          ListTile(
                            dense: true,
                            visualDensity:
                                VisualDensity(vertical: -4, horizontal: -4),
                            leading: Icon(
                              Icons.check,
                              color: Colors.cyanAccent[700],
                              size: 18,
                            ),
                            title: Text(
                              'Third party liability',
                              style: TextStyle(
                                fontSize: 15.0,
                              ),
                            ),
                            trailing: Text('YES'),
                          ),
                          ListTile(
                            dense: true,
                            visualDensity:
                                VisualDensity(vertical: -4, horizontal: -4),
                            leading: Icon(
                              Icons.check,
                              color: Colors.cyanAccent[700],
                              size: 18,
                            ),
                            title: Text(
                              'Third party liability',
                              style: TextStyle(
                                fontSize: 15.0,
                              ),
                            ),
                            trailing: Text('YES'),
                          ),
                          SizedBox(height: 40),
                          Center(
                            child: ElevatedButton(
                              onPressed:  () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Discount(),
                                  ),
                                );
                              },
                              child: Text('Get Premium'),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
