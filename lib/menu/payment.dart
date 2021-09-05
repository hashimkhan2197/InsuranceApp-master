import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  Payment({Key key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Payment',
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
            SizedBox(height: 40),
            Center(
              child: Text(
                'Select your payment method',
                style: TextStyle(fontSize: 22),
              ),
            ),
            SizedBox(height: 40),
            ListTile(
              onTap: () {
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (context) => ChangePassword()));
              },
              dense: true,
              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
              leading: Image(image: AssetImage('assets/paypal.png')),
              title: Text(
                'Paypal',
                style: TextStyle(fontSize: 17),
              ),
              trailing: Radio(
                activeColor: Colors.cyanAccent[700],
                value: 0,
                groupValue: 1,
                onChanged: (_) {},
              ),
            ),
            Divider(),
            SizedBox(height: 20),
            ListTile(
              onTap: () {
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (context) => ChangePassword()));
              },
              dense: true,
              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
              leading: Image(
                image: AssetImage('assets/visa.png'),
                width: 40,
              ),
              title: Text(
                'Credit card',
                style: TextStyle(fontSize: 17),
              ),
              trailing: Radio(
                activeColor: Colors.cyanAccent[700],
                value: 1,
                groupValue: 1,
                onChanged: (_) {},
              ),
            ),
            Divider(),
            SizedBox(height: 20),
            ListTile(
              onTap: () {
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (context) => ChangePassword()));
              },
              dense: true,
              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
              leading: Image(image: AssetImage('assets/appleblack.png')),
              title: Text(
                'Apple pay',
                style: TextStyle(fontSize: 17),
              ),
              trailing: Radio(
                activeColor: Colors.cyanAccent[700],
                value: 0,
                groupValue: 1,
                onChanged: (_) {},
              ),
            ),
            Divider(),
            SizedBox(height: 20),
            ListTile(
              onTap: () {
                // Navigator.push(
                //     context, MaterialPageRoute(builder: (context) => ChangePassword()));
              },
              dense: true,
              visualDensity: VisualDensity(horizontal: 0, vertical: -4),
              leading: Image(image: AssetImage('assets/googlecolor.png')),
              title: Text(
                'Google pay',
                style: TextStyle(fontSize: 17),
              ),
              trailing: Radio(
                activeColor: Colors.cyanAccent[700],
                value: 0,
                groupValue: 1,
                onChanged: (_) {},
              ),
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
              child: RaisedButton(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                color: Colors.cyanAccent[700],
                textColor: Colors.white,
                child: Text("ADD",
                    style: TextStyle(
                      fontSize: 18.0,
                    )),
                onPressed: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => Payment()));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
