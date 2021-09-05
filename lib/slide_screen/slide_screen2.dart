import 'package:flutter/material.dart';
import 'package:isurance/Login_signup/choose_signup_account.dart';

class Slider2 extends StatefulWidget {
  Slider2({Key key}) : super(key: key);

  @override
  _Slider2State createState() => _Slider2State();
}

class _Slider2State extends State<Slider2> {
  @override
  Widget build(BuildContext context) {
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
        child: Stack(
          children: [
            Container(
              height: 500,
              width: MediaQuery.of(context).size.width,
              child: Image(
                image: AssetImage('assets/slide2.jpg'),
                width: 250,
                height: 250,
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 500,
                // decoration: BoxDecoration(
                //     image: DecorationImage(
                //         image: AssetImage('assets/slide1.png'),
                //         fit: BoxFit.fill)),
                child: Column(
                  children: [
                    Text(
                      "Insurance Made",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Easy For You",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 26,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20, bottom: 70),
                      child: Text(
                        "Lorem impusom sit imit Lorem impusom sit imit Lorem imp usom sit imit usom sit imit usom sit imit usom usom imit it",
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width - 100,
                        height: 60.0,
                        child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            color: Colors.cyanAccent[700],
                            child: Text(
                              "Get Started",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChooseSignUpAccount()));
                            }))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
