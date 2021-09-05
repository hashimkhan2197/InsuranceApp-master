import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:isurance/Login_signup/Signup.dart';
import 'package:isurance/Login_signup/UserModel.dart';
import 'package:isurance/menu/Navigationbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _loading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      extendBodyBehindAppBar: true,
      body: Form(
        key: _formKey,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: ListView(
            children: [
              SizedBox(height: 20),
              SizedBox(height: 20),
              Container(
                width: 170,
                height: 170,
                child: Image(
                  image: AssetImage('assets/Logo.png'),
                ),
              ),
              SizedBox(height: 70),
              Text(
                'Your Email',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 7),
              _input("email@email.com", emailController),
              SizedBox(height: 15),
              Text(
                'Password',
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 7),
              _input("Enter your password", passwordController),
              SizedBox(height: 25),
              RaisedButton(
                padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                color: Colors.cyanAccent[700],
                textColor: Colors.white,
                child: Container(
                  child: _loading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : Text("Login",
                          style: TextStyle(
                            fontSize: 18.0,
                          )),
                ),
                onPressed: () {
                  loginUser();
                },
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {},
                child: Center(
                  child: Text(
                    "Forgot password ?",
                    style: TextStyle(
                        color: Colors.cyanAccent[700],
                        fontSize: 15,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Didn\'t have account ? ",
                      style: TextStyle(color: Colors.black, fontSize: 15)),
                  SizedBox(
                    height: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUp(),
                        ),
                      );
                    },
                    child: Text(
                      "Signup",
                      style: TextStyle(
                          color: Colors.cyanAccent[700],
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> loginUser() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        _loading = true;
      });
      try {
        final User user =
            (await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text,
        ))
                .user;
        if (user != null) {
          var prefs = await SharedPreferences.getInstance();
          final userData = json.encode(
            {
              'userEmail': user.email,
              'userUid': user.uid,
            },
          );
          prefs.setString('insuranceAppUser', userData);
          print("hiii1");
          await Firestore.instance
              .collection("Users List")
              .where("UserUserUid", isEqualTo: user.uid)
              .getDocuments()
              .then((value) async => {
                    print("hiii2"),
                    userDetails = UserModel(
                        userEmail: value.documents[0]["UserEmail"],
                        userImage: value.documents[0]["UserImage"],
                        userDocId: value.documents[0].documentID,
                        userNumber: "03319042434",
                        username: value.documents[0]["UserName"],
                        userUid: value.documents[0]["UserUserUid"])
                  });
          setState(() {
            _loading = false;
          });

          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => NavigationBar()));
        }
      } catch (signUpError) {
        setState(() {
          _loading = false;
        });
        showDialog(
            context: context,
            builder:(context){return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                  side: BorderSide(
                    color: Colors.red,
                  )),
              title: Text(signUpError.message),
              actions: <Widget>[
                FlatButton(
                  child: Text(
                    "OK",
                    style: TextStyle(color: Colors.red),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            );});
      }
    }
  }

  Widget _input(String hint, TextEditingController controller) {
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
          controller: controller,
          validator: (val) {
            if (val.length == 0) {
              return "This field cannot be empty";
            } else {
              return null;
            }
          },
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
}
