import 'package:flutter/material.dart';
import 'package:isurance/Admin_panel/adminhome.dart';
import 'package:isurance/menu/inbox.dart';

class Applicants extends StatefulWidget {
  @override
  _ApplicantsState createState() => _ApplicantsState();
}

class _ApplicantsState extends State<Applicants> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            leading: InkWell(
                onTap: () {
                  Navigator.pop(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AdminHome(),
                    ),
                  );
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                )),
            iconTheme: IconThemeData(color: Colors.black),
            //leading: Icon(Icons.notifications, color: Colors.black87,),
            title: Text(
              'Applicants',
              style: TextStyle(color: Colors.black),
            ),
            centerTitle: true,
            backgroundColor: Colors.white,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: Column(
                children: [
                  TabBar(
                    //indicatorColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    labelColor: Colors.cyanAccent[700],
                    indicatorColor: Colors.cyanAccent[700],
                    tabs: [
                      Tab(text: 'REQUESTS'),
                      Tab(text: 'ACCEPTED'),
                      Tab(text: 'REJECTED'),
                    ],
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                padding: EdgeInsets.only(left: 5, right: 5),
                child: ListView(
                  children: [
                    SizedBox(height: 10),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 330,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 10,
                                offset: Offset(2, 2))
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 90,
                                  height: 90,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: Center(
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      child: Image(
                                        image: AssetImage('assets/man.jpeg'),
                                        width: 80,
                                        height: 80,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Ameer Kakar',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        InkWell(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.cyanAccent[700],
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.1),
                                                  blurRadius: 5,
                                                  offset: Offset(0, 2),
                                                ),
                                              ],
                                            ),
                                            padding: EdgeInsets.fromLTRB(
                                                30, 7, 30, 7),
                                            child: Text(
                                              'Message',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12),
                                            ),
                                          ),
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Inbox(),
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Divider(),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Text(
                                  'Email:  ',
                                  style: TextStyle(),
                                ),
                                Text(
                                  'example@gmail.com',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Phone:  ',
                                      style: TextStyle(),
                                    ),
                                    Text(
                                      '03161964761',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 15),
                                Row(
                                  children: [
                                    Text(
                                      '|',
                                      style: TextStyle(),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 15),
                                Row(
                                  children: [
                                    Text(
                                      'Gender:  ',
                                      style: TextStyle(),
                                    ),
                                    Text(
                                      'MALE',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Divider(),
                            SizedBox(height: 5),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Title of the policy',
                                  style: TextStyle(fontSize: 15),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Policy Main Categoy',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Policy Sub-category',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                SizedBox(height: 5),
                                Divider(),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Text(
                                      'Price: ',
                                      style: TextStyle(),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      '\$99.99',
                                      style: TextStyle(
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
                                      'Policy Period: ',
                                      style: TextStyle(),
                                    ),
                                    Text(
                                      '1 year',
                                      style: TextStyle(
                                          color: Colors.cyanAccent[700],
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Text(
                                      'Date: ',
                                      style: TextStyle(),
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
                                      '22 / 2 / 2021',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                padding: EdgeInsets.only(left: 5, right: 5),
                child: ListView(
                  children: [
                    SizedBox(height: 10),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 330,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 10,
                                offset: Offset(2, 2))
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 90,
                                  height: 90,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: Center(
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      child: Image(
                                        image: AssetImage('assets/man.jpeg'),
                                        width: 80,
                                        height: 80,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Ameer Kakar',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        InkWell(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.cyanAccent[700],
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.1),
                                                  blurRadius: 5,
                                                  offset: Offset(0, 2),
                                                ),
                                              ],
                                            ),
                                            padding: EdgeInsets.fromLTRB(
                                                30, 7, 30, 7),
                                            child: Text(
                                              'Message',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12),
                                            ),
                                          ),
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Inbox(),
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Divider(),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Text(
                                  'Email:  ',
                                  style: TextStyle(),
                                ),
                                Text(
                                  'example@gmail.com',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Phone:  ',
                                      style: TextStyle(),
                                    ),
                                    Text(
                                      '03161964761',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 15),
                                Row(
                                  children: [
                                    Text(
                                      '|',
                                      style: TextStyle(),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 15),
                                Row(
                                  children: [
                                    Text(
                                      'Gender:  ',
                                      style: TextStyle(),
                                    ),
                                    Text(
                                      'MALE',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Divider(),
                            SizedBox(height: 5),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Title of the policy',
                                  style: TextStyle(fontSize: 15),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Policy Main Categoy',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Policy Sub-category',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                SizedBox(height: 5),
                                Divider(),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Text(
                                      'Price: ',
                                      style: TextStyle(),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      '\$99.99',
                                      style: TextStyle(
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
                                      'Policy Period: ',
                                      style: TextStyle(),
                                    ),
                                    Text(
                                      '1 year',
                                      style: TextStyle(
                                          color: Colors.cyanAccent[700],
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Text(
                                      'Date: ',
                                      style: TextStyle(),
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
                                      '22 / 2 / 2021',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.white,
                padding: EdgeInsets.only(left: 5, right: 5),
                child: ListView(
                  children: [
                    SizedBox(height: 10),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 330,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                blurRadius: 10,
                                offset: Offset(2, 2))
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 90,
                                  height: 90,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: Center(
                                    child: ClipRRect(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                      child: Image(
                                        image: AssetImage('assets/man.jpeg'),
                                        width: 80,
                                        height: 80,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Ameer Kakar',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        InkWell(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.cyanAccent[700],
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.black
                                                      .withOpacity(0.1),
                                                  blurRadius: 5,
                                                  offset: Offset(0, 2),
                                                ),
                                              ],
                                            ),
                                            padding: EdgeInsets.fromLTRB(
                                                30, 7, 30, 7),
                                            child: Text(
                                              'Message',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12),
                                            ),
                                          ),
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => Inbox(),
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Divider(),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Text(
                                  'Email:  ',
                                  style: TextStyle(),
                                ),
                                Text(
                                  'example@gmail.com',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Phone:  ',
                                      style: TextStyle(),
                                    ),
                                    Text(
                                      '03161964761',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 15),
                                Row(
                                  children: [
                                    Text(
                                      '|',
                                      style: TextStyle(),
                                    ),
                                  ],
                                ),
                                SizedBox(width: 15),
                                Row(
                                  children: [
                                    Text(
                                      'Gender:  ',
                                      style: TextStyle(),
                                    ),
                                    Text(
                                      'MALE',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(height: 5),
                            Divider(),
                            SizedBox(height: 5),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Title of the policy',
                                  style: TextStyle(fontSize: 15),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Policy Main Categoy',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Policy Sub-category',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                SizedBox(height: 5),
                                Divider(),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Text(
                                      'Price: ',
                                      style: TextStyle(),
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      '\$99.99',
                                      style: TextStyle(
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
                                      'Policy Period: ',
                                      style: TextStyle(),
                                    ),
                                    Text(
                                      '1 year',
                                      style: TextStyle(
                                          color: Colors.cyanAccent[700],
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 5),
                                Row(
                                  children: [
                                    Text(
                                      'Date: ',
                                      style: TextStyle(),
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
                                      '22 / 2 / 2021',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
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
      ),
    );
  }
}
