import 'package:flutter/material.dart';
import 'package:isurance/Login_signup/Signup.dart';
import 'package:isurance/Login_signup/login.dart';
import 'package:isurance/menu/Navigationbar.dart';

class ChooseSignUpAccount extends StatefulWidget {
  ChooseSignUpAccount({Key key}) : super(key: key);

  @override
  _ChooseSignUpAccountState createState() => _ChooseSignUpAccountState();
}

class _ChooseSignUpAccountState extends State<ChooseSignUpAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: Colors.white,
        appBar: AppBar(
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
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.end,
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     GestureDetector(
              //       onTap: (){
              //         Navigator.push(context,
              //         MaterialPageRoute(builder: (context) => NavigationBar()));
              //       },
              //       child: Container(
              //         decoration: BoxDecoration(
              //           border: Border(
              //               bottom: BorderSide(color: Colors.cyanAccent[700])),
              //         ),
              //         child: Text(
              //           'Skip Login',
              //           style: TextStyle(
              //             color: Colors.cyanAccent[700],
              //             fontSize: 14.0,
              //           ),
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
              SizedBox(height: 40),
              Container(
                width: 170,
                height: 170,
                child: Image(
                  image: AssetImage('assets/Logo.png'),
                ),
              ),
              SizedBox(height: 70),
              RaisedButton(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                color: Colors.white,
                textColor: Colors.black,
                child: Text("Signup",
                    style: TextStyle(
                      fontSize: 17.0,
                    )),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUp()));
                },
              ),
              // SizedBox(height: 15),
              // RaisedButton(
              //   padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
              //   shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(5.0)),
              //   color: Colors.black,
              //   textColor: Colors.white,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Image(
              //         image: AssetImage('assets/Applelogo.png'),
              //         height: 25,
              //       ),
              //       SizedBox(width: 15),
              //       Text(
              //         'Login with apple',
              //         style: TextStyle(fontSize: 17),
              //       ),
              //     ],
              //   ),
              //   onPressed: () {},
              // ),
              // SizedBox(height: 15),
              // RaisedButton(
              //   padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
              //   shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(5.0)),
              //   color: Colors.cyanAccent[700],
              //   textColor: Colors.white,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Image(
              //         image: AssetImage('assets/googlelogo.png'),
              //         height: 25,
              //       ),
              //       SizedBox(width: 15),
              //       Text(
              //         'Login with Google',
              //         style: TextStyle(fontSize: 17),
              //       ),
              //     ],
              //   ),
              //   onPressed: () {},
              // ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Already have account? ",
                      style: TextStyle(color: Colors.black, fontSize: 15)),
                  SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Login(),
                        ),
                      );
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.cyanAccent[700],
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              GestureDetector(
                child: Center(child: Text('Terms & Conditions')),
              ),
            ],
          ),
        ));
  }
}
