import 'package:flutter/material.dart';
import 'package:isurance/slide_screen/slide_screen2.dart';

class Slider1 extends StatefulWidget {
  Slider1({Key key}) : super(key: key);

  @override
  _Slider1State createState() => _Slider1State();
}

class _Slider1State extends State<Slider1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Slider2()));
        },
        child: Icon(Icons.arrow_forward_outlined, color: Colors.white,),
        backgroundColor: Colors.cyanAccent[700],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Positioned(
              top: 50,
                          child: Container(
                height: 220,
                width: MediaQuery.of(context).size.width,
                child: Image(
                  image: AssetImage('assets/Logo.png'),
                  width: 100,
                  height: 100,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height - 300,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/slide1.png'),
                        fit: BoxFit.fill)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
