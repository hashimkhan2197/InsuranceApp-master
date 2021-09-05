import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:isurance/menu/chat.dart';
import 'package:isurance/menu/inbox.dart';

class CustomersList extends StatefulWidget {
  @override
  _CustomersListState createState() => _CustomersListState();
}

class _CustomersListState extends State<CustomersList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Customers',
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
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Stack(
          children: [
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[600]),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 5,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
                    child: Row(
                      children: [
                        Icon(
                          Icons.sort,
                          color: Colors.grey[600],
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Sort',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    _roomSortBottomsheet(context);
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: StreamBuilder(
                  stream:
                      Firestore.instance.collection("Users List").snapshots(),
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
                            DocumentSnapshot userDetail =
                                snapshot.data.documents[index];

                            return InkWell(
                              // onTap: () {
                              //   Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) => UserProfile(),
                              //     ),
                              //   );
                              // },
                              child: Container(
                                // height: MediaQuery.of(context).size.height / 2,
                                width: MediaQuery.of(context).size.width,
                                padding: EdgeInsets.only(left: 5, right: 5),
                                child: Column(
                                  children: [
                                    SizedBox(height: 20),
                                    Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 170,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5)),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.2),
                                                blurRadius: 10,
                                                offset: Offset(2, 2))
                                          ]),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  width: 90,
                                                  height: 90,
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey[200],
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                10)),
                                                  ),
                                                  child: Center(
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10)),
                                                      child: Image(
                                                        image: NetworkImage(
                                                            userDetail[
                                                                "UserImage"]),
                                                        width: 80,
                                                        height: 80,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 20),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      userDetail["UserName"],
                                                      style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(height: 10),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .end,
                                                      children: [
                                                        InkWell(
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Colors
                                                                      .cyanAccent[
                                                                  700],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: Colors
                                                                      .black
                                                                      .withOpacity(
                                                                          0.1),
                                                                  blurRadius: 5,
                                                                  offset:
                                                                      Offset(
                                                                          0, 2),
                                                                ),
                                                              ],
                                                            ),
                                                            padding: EdgeInsets
                                                                .fromLTRB(30, 7,
                                                                    30, 7),
                                                            child: Text(
                                                              'Message',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 12),
                                                            ),
                                                          ),
                                                          onTap: () {
                                                            Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        Chat(
                                                                  recieverId:
                                                                      userDetail
                                                                          .documentID,
                                                                  recieverAvatar:
                                                                      userDetail[
                                                                          "UserImage"],
                                                                  senderAvatar:
                                                                      userDetail[
                                                                          "UserImage"],
                                                                  senderId:
                                                                      "5hh63aB3q6fEIyYnXd38",
                                                                  fromAdmin:
                                                                      true,
                                                                ),
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
                                            SizedBox(height: 15),
                                            Row(
                                              children: [
                                                Text(
                                                  'Email:  ',
                                                  style: TextStyle(),
                                                ),
                                                Text(
                                                  userDetail["UserEmail"],
                                                  style: TextStyle(
                                                      color: Colors.grey),
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
                                                      style: TextStyle(
                                                          color: Colors.grey),
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
                                                      userDetail["UserGender"],
                                                      style: TextStyle(
                                                          color: Colors.grey),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            // Row(
                                            //   children: [
                                            //     Text('Age: ',style: TextStyle(),),
                                            //     Text('25 years old',style: TextStyle(color: Colors.grey),),
                                            //   ],
                                            // ),
                                          ],
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
          ],
        ),
      ),
    );
  }

  void _roomSortBottomsheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            color: Color(0xFF737373),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                //border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(10),
                  topRight: const Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              height: 330,
              //height: MediaQuery.of(context).size.height * 80,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: ListView(
                  children: [
                    Column(
                      children: [
                        Row(
                          children: [
                            Radio(value: 1, groupValue: 1, onChanged: null),
                            SizedBox(width: 10),
                            Text(
                              'Users who purchased',
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Radio(value: 1, groupValue: 1, onChanged: null),
                            SizedBox(width: 10),
                            Text(
                              'Users yet to purchase',
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Radio(value: 1, groupValue: 1, onChanged: null),
                            SizedBox(width: 10),
                            Text(
                              'Pending Purchase',
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Radio(value: 1, groupValue: 1, onChanged: null),
                            SizedBox(width: 10),
                            Text(
                              'Users with multiple policies',
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Radio(value: 1, groupValue: 1, onChanged: null),
                            SizedBox(width: 10),
                            Text(
                              'User who extended policy',
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Radio(value: 1, groupValue: 1, onChanged: null),
                            SizedBox(width: 10),
                            Text(
                              'Users from Kuwait',
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Radio(value: 1, groupValue: 1, onChanged: null),
                            SizedBox(width: 10),
                            Text(
                              'Users from Lebanon',
                              style: TextStyle(fontSize: 18),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
