import 'package:flutter/material.dart';
import 'package:flutter_country_picker/flutter_country_picker.dart';
import 'Home_info.dart';

class HomePersonalInformaiton extends StatefulWidget {

  @override
  _HomePersonalInformaitonState createState() => _HomePersonalInformaitonState();
}

class _HomePersonalInformaitonState extends State<HomePersonalInformaiton> {
  
  Country _selected;
  @override
  Widget build(BuildContext context) {
    Widget countryTextFormField() {
      return new Center(
        child: CountryPicker(
          dense: false,
          showFlag: true, //displays flag, true by default
          showDialingCode: true, //displays dialing code, false by default
          showName: false, //displays country name, true by default
          showCurrency: false, //eg. 'British pound'
          showCurrencyISO: false, //eg. 'GBP'
          onChanged: (Country country) {
            setState(() {
              _selected = country;
            });
          },
          selectedCountry: _selected,
        ),
      );
    }
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
            SizedBox(height: 30),
            Text(
              'PERSONAL INFORMATION',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w300,
              ),
            ),
            
            SizedBox(height: 70),
            Text(
              'What is your name?',
              //textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(height: 7),
            _input('John Deo'),
            SizedBox(height: 20),
            Text(
              'What is your email address',
              //textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(height: 7),
            _input('e.g@gmail.com'),
            SizedBox(height: 20),
            SizedBox(height: 15),
            Text(
              'Phone number',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 7),
            Container(
              padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
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
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  countryTextFormField(),
                  SizedBox(width: 10),
                  _textInput('Phone Number'),
                ],
              ),
            ),
            SizedBox(height: 70),
            InkWell(
             onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeInformation(),
                          ),
                        );
                      },
              child: Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.cyanAccent[700],
                  ),
                  child: Icon(
                    Icons.navigate_next,
                    color: Colors.white,
                    size: 40,
                  )),
            )
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
        decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.grey[600], fontSize: 13),
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

Widget _textInput(String hint) {
  return Container(
    width: 180,
    height: 60,
    margin: EdgeInsets.only(top: 6, bottom: 0),
    decoration: BoxDecoration(),
    //padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
    child: TextFormField(
      keyboardType: TextInputType.phone,
      //controller: controller,
      decoration: InputDecoration(
        hintStyle: TextStyle(fontSize: 16, color: Colors.grey),
        border: InputBorder.none,
        hintText: hint,
      ),
    ),
  );
}
 