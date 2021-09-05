import 'package:flutter/material.dart';
import 'package:isurance/menu/setting/setting.dart';

class ChangePassword extends StatefulWidget {
  ChangePassword({Key key}) : super(key: key);

  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Change password',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: ListView(
          children: [
            SizedBox(height: 30),
            Container(
              width: 160,
              height: 160,
              child: Image(
                image: AssetImage('assets/Logo.png'),
              ),
            ),
            SizedBox(height: 70),
            Text(
              'Current password',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 7),
            _input("**********"),
            SizedBox(height: 7),
            Text(
              'New password',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 7),
            _input("**********"),
            SizedBox(height: 7),
            Text(
              'Confirm password',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 7),
            _input("**********"),
            SizedBox(height: 30),
            RaisedButton(
              padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              color: Colors.cyanAccent[700],
              textColor: Colors.white,
              child: Text("Change password",
                  style: TextStyle(
                    fontSize: 18.0,
                  )),
              onPressed: () {
                Navigator.pop(
                    context, MaterialPageRoute(builder: (context) => Setting()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget _input(String hint) {
  return Container(
    height: 60,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 10,
              offset: Offset(2, 2))
        ]),
    child: Padding(
      padding: const EdgeInsets.fromLTRB(10, 8, 15, 0),
      child: TextFormField(
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.grey[600], fontSize: 14),
            //labelText: label,
            hintText: hint,
            focusColor: Colors.grey,

            //fillColor: Colors.white,

            fillColor: Colors.white),
        //keyboardType: TextInputType.emailAddress,
        style: TextStyle(
          fontFamily: "Poppins",
        ),
      ),
    ),
  );
}
