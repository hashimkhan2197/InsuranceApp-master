import 'package:flutter/material.dart';
import 'package:isurance/Funtions/Functions.dart';
import 'package:isurance/Login_signup/UserModel.dart';
import 'package:isurance/menu/notifications.dart';
import 'package:isurance/menu/setting/change_password.dart';

import '../chat.dart';

class Setting extends StatefulWidget {
  Setting({Key key}) : super(key: key);

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
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
        child: ListView(
          children: [
            Container(
              height: 20,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        blurRadius: 10,
                        offset: Offset(2, 2))
                  ]),
            ),
            SizedBox(height: 30),
            // ListTile(
            //   onTap: () {
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => ChangePassword()));
            //   },
            //   dense: true,
            //   visualDensity: VisualDensity(horizontal: 0, vertical: -4),
            //   leading: Text(
            //     'Change password',
            //     style: TextStyle(fontSize: 15),
            //   ),
            //   trailing: Icon(
            //     Icons.navigate_next,
            //     size: 18,
            //     color: Colors.black,
            //   ),
            // ),
            // Divider(),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Notifications()));
              },
              dense: true,
              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
              leading: Text(
                'Notifications',
                style: TextStyle(fontSize: 15),
              ),
              trailing: Icon(
                Icons.navigate_next,
                size: 18,
                color: Colors.black,
              ),
            ),
            Divider(),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Chat(
                              fromAdmin: false,
                              recieverId: "5hh63aB3q6fEIyYnXd38",
                              recieverAvatar: userDetails.userImage,
                              senderId: userDetails.userDocId,
                              senderAvatar: userDetails.userImage,
                            )));
              },
              dense: true,
              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
              leading: Text(
                'Help center',
                style: TextStyle(fontSize: 15),
              ),
              trailing: Icon(
                Icons.navigate_next,
                size: 18,
                color: Colors.black,
              ),
            ),
            Divider(),
            ListTile(
              dense: true,
              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
              leading: Text(
                'Privacy policies',
                style: TextStyle(fontSize: 15),
              ),
              trailing: Icon(
                Icons.navigate_next,
                size: 18,
                color: Colors.black,
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
              child: RaisedButton.icon(
                  padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  color: Colors.white,
                  textColor: Colors.black,
                  onPressed: () {
                    signOut(context);
                  },
                  icon: Icon(
                    Icons.logout,
                    color: Colors.red,
                  ),
                  label: Text(
                    'Logout',
                    style: TextStyle(fontSize: 15),
                  )),
            ),
            SizedBox(height: 30),
            Container(
              width: 160,
              height: 160,
              child: Image(
                image: AssetImage('assets/Logo.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
