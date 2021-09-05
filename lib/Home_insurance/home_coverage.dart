import 'package:flutter/material.dart';
import 'Home_discount.dart';

class HomeCoverage extends StatefulWidget {
  HomeCoverage({Key key}) : super(key: key);

  @override
  _HomeCoverageState createState() => _HomeCoverageState();
}

class _HomeCoverageState extends State<HomeCoverage> {
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
                    height: 300,
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

                          SizedBox(height: 20),
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
                              'Liability',
                              style: TextStyle(
                                fontSize: 15.0,
                              ),
                            ),
                            trailing: Text('2,000,000'),
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
                              'Deductible',
                              style: TextStyle(
                                fontSize: 15.0,
                              ),
                            ),
                            trailing: Text('\$1,000'),
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
                              'Guaranteed replacement cost',
                              style: TextStyle(
                                fontSize: 15.0,
                              ),
                            ),
                            trailing: Text('inc.'),
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
                              'Hail and Wind',
                              style: TextStyle(
                                fontSize: 15.0,
                              ),
                            ),
                            trailing: Text('Inc.'),
                          ),
                          SizedBox(height: 40),
                          Center(
                            child: ElevatedButton(
                              onPressed: () {Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeDiscount(),
                  ),
                );},
                              child: Text('Get Premium'),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  
                  SizedBox(width: 10),
                  Container(
                    width: width * 0.7,
                    height: 300,
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
                            child: Center(
                              child: Text(
                                'Customized Coverage',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 23.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 100),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                  'let\'s start question and answer to customize your coverage',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                            ),
                          ),
                          SizedBox(height: 80),
                          Center(
                            child: RaisedButton(
                              color: Colors.black,
                              onPressed: () {},
                              child: Text('Start to customize'),
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
