import 'package:flutter/material.dart';
import 'package:isurance/menu/Navigationbar.dart';
import 'package:pinput/pin_put/pin_put.dart';

class PhoneVerification extends StatefulWidget {
  @override
  _PhoneVerificationState createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {
  //pin code
  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(10.0),
    );
  }

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
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.only(left: 20, right: 20),
        child: ListView(
          children: [
            SizedBox(height: 50),
            Text(
              'We need to verify',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10),
            Text(
              'We have sent you an SMS with a code, please enter that code.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20.0),
              padding: const EdgeInsets.all(20.0),
              child: PinPut(
                fieldsCount: 4,
                onSubmit: (String pin) => _showSnackBar(pin, context),
                focusNode: _pinPutFocusNode,
                controller: _pinPutController,
                submittedFieldDecoration: _pinPutDecoration.copyWith(
                    borderRadius: BorderRadius.circular(
                      5.0,
                    ),
                    border: Border.all(color: Colors.cyanAccent[700])),
                selectedFieldDecoration: _pinPutDecoration,
                followingFieldDecoration: _pinPutDecoration.copyWith(
                  borderRadius: BorderRadius.circular(2.0),
                  border: Border.all(
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ),
            RaisedButton(
              padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              color: Colors.cyanAccent[700],
              textColor: Colors.white,
              child: Text("Verify Number",
                  style: TextStyle(
                    fontSize: 18.0,
                  )),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => NavigationBar()));
              },
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Didn\'t recive the code? ",
                    style: TextStyle(color: Colors.black, fontSize: 15)),
                SizedBox(
                  height: 5,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NavigationBar(),
                      ),
                    );
                  },
                  child: Text(
                    "Resend",
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
    );
  }

  void _showSnackBar(String pin, BuildContext context) {
    final snackBar = SnackBar(
      duration: const Duration(seconds: 3),
      content: Container(
        color: Colors.grey,
        height: 50.0,
        width: 50.0,
        child: Center(
          child: Text(
            'Pin Submitted. Value: $pin',
            //style: const TextStyle(fontSize: 40.0),
          ),
        ),
      ),
      backgroundColor: Colors.deepPurpleAccent,
    );
    Scaffold.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
// import 'dart:convert';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:isurance/Login_signup/phone_number.dart';
// import 'package:image_picker/image_picker.dart';
// import 'dart:io';

// import 'package:shared_preferences/shared_preferences.dart';

// class SignUp extends StatefulWidget {
//   SignUp({Key key}) : super(key: key);

//   @override
//   _SignUpState createState() => _SignUpState();
// }

// class _SignUpState extends State<SignUp> {
//   final TextEditingController userNamecontroller = new TextEditingController();
//   final TextEditingController userEmailcontroller = new TextEditingController();
//   final TextEditingController userPasswordcontroller =
//       new TextEditingController();
//   final TextEditingController userConfirmPasswordcontroller =
//       new TextEditingController();
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   String gender;

//   @override
//   void dispose() {
//     userNamecontroller.dispose();
//     userEmailcontroller.dispose();
//     userPasswordcontroller.dispose();
//     userConfirmPasswordcontroller.dispose();

//     super.dispose();
//   }

//   //image picker
//   File _image;
//   bool imagecheck = false;
//   bool piccheck = false;
//   bool _loading = false;

//   String imageUrl;

//   final _formKey = GlobalKey<FormState>();
//   // Declare this variable
//   int selectedRadio;

//   @override
//   void initState() {
//     super.initState();
//     selectedRadio = 0;
//   }

// // Changes the selected value on 'onChanged' click on each radio button
//   setSelectedRadio(int val) {
//     setState(() {
//       selectedRadio = val;
//     });
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0.0,
//         iconTheme: IconThemeData(color: Colors.black),
//       ),
//       extendBodyBehindAppBar: true,
//       body: Container(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
//         child: ListView(
//           children: [
//             Center(
//               child: Text(
//                 'Creat New Account',
//                 style: TextStyle(
//                   fontSize: 28.0,
//                   fontWeight: FontWeight.w500,
//                 ),
//               ),
//             ),
//             SizedBox(height: 10),
//             Center(
//               child: Text(
//                 'Join the community of over one million people',
//                 style: TextStyle(
//                   fontSize: 14.0,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             SizedBox(height: 30),
//             InkWell(
//               onTap: () async {
//                 _image = await pickImage(context, ImageSource.gallery);
//                 setState(() {
//                   piccheck = true;
//                 });
//                 if (_image != null) {
//                   print("HII");
//                   final FirebaseStorage _storgae = FirebaseStorage(
//                       storageBucket: 'gs://insurance-cf3bc.appspot.com');
//                   print("HII");
//                   StorageUploadTask uploadTask;
//                   String filePath = '${DateTime.now()}.png';
//                   uploadTask = _storgae.ref().child(filePath).putFile(_image);
//                   uploadTask.onComplete.then((_) async {
//                     print(1);
//                     String url1 =
//                         await uploadTask.lastSnapshot.ref.getDownloadURL();
//                     _image.delete().then((onValue) {
//                       print(2);
//                     });
//                     setState(() {
//                       imagecheck = true;
//                     });
//                     print(url1);

//                     imageUrl = url1;
//                   });
//                 }
//               },
//               child: Container(
//                 decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey[300],
//                     offset: Offset(0, 0),
//                     blurRadius: 5,
//                   ),
//                 ]),
//                 child: CircleAvatar(
//                     backgroundColor: Colors.grey,
//                     radius: 55,
//                     child: CircleAvatar(
//                       radius: 50,
//                       child: ClipOval(
//                         child: SizedBox(
//                             height: 130.0,
//                             width: 130.0,
//                             child: (_image != null)
//                                 ? Image.file(
//                                     _image,
//                                     fit: BoxFit.cover,
//                                   )
//                                 : Container(
//                                     color: Colors.white,
//                                     child: Icon(
//                                       Icons.camera_alt,
//                                       color: Colors.grey,
//                                       size: 40,
//                                     ),
//                                   )),
//                       ),
//                     )),
//               ),
//             ),
//             SizedBox(height: 10),
//             Center(
//               child: Text(
//                 'Add Profile picture',
//                 style: TextStyle(
//                   fontSize: 20.0,
//                 ),
//               ),
//             ),
//             SizedBox(height: 10),
//             Center(
//               child: Text(
//                 'Please make sure your picture clearly shows your face',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   fontSize: 14.0,
//                 ),
//               ),
//             ),
//             SizedBox(height: 30),
//             Text(
//               'Your Name',
//               style: TextStyle(
//                 fontSize: 16.0,
//               ),
//             ),
//             SizedBox(height: 7),
//             _input("John deo", userNamecontroller),
//             SizedBox(height: 15),
//             Text(
//               'Your Email',
//               style: TextStyle(
//                 fontSize: 16.0,
//               ),
//             ),
//             SizedBox(height: 7),
//             _input("email@email.com", userEmailcontroller),
//             SizedBox(height: 15),
//             Text(
//               'Password',
//               style: TextStyle(
//                 fontSize: 16.0,
//               ),
//             ),
//             SizedBox(height: 7),
//             _input("*********", userPasswordcontroller),
//             SizedBox(height: 15),
//             Text(
//               'Confirm Password',
//               style: TextStyle(
//                 fontSize: 16.0,
//               ),
//             ),
//             SizedBox(height: 7),
//             _input("*********", userConfirmPasswordcontroller),
//             SizedBox(height: 15),
//             Row(
//               children: [
//                 Radio(
//                   value: 1,
//                   groupValue: selectedRadio,
//                   activeColor: Colors.cyanAccent[700],
//                   onChanged: (val) {
//                     print("Radio $val");
//                     setSelectedRadio(val);
//                     gender = "Male";
//                   },
//                 ),
//                 Text('Male'),
//                 Radio(
//                   value: 2,
//                   groupValue: selectedRadio,
//                   activeColor: Colors.cyanAccent[700],
//                   onChanged: (val) {
//                     print("Radio $val");
//                     setSelectedRadio(val);
//                     gender = "Female";
//                   },
//                 ),
//                 Text('Female'),
//               ],
//             ),
//             SizedBox(height: 15),
//             RaisedButton(
//               padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(5.0)),
//               color: Colors.cyanAccent[700],
//               textColor: Colors.white,
//               child: Text("Continue",
//                   style: TextStyle(
//                     fontSize: 18.0,
//                   )),
//               onPressed: () {
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (context) => PhoneNumber()));
//               },
//             ),
//             SizedBox(height: 15),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<File> pickImage(BuildContext context, ImageSource source) async {
//     // ignore: unnecessary_cast
//     File selected = (await ImagePicker.pickImage(
//       source: source,
//       imageQuality: 20,
//     )) as File;
//     return selected;
//   }

//   Widget _input(String hint, controller) {
//     return Container(
//       height: 60,
//       decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.all(Radius.circular(5.0)),
//           boxShadow: [
//             BoxShadow(
//                 color: Colors.grey.withOpacity(0.2),
//                 blurRadius: 10,
//                 offset: Offset(2, 2))
//           ]),
//       child: Padding(
//         padding: const EdgeInsets.fromLTRB(10, 8, 15, 0),
//         child: TextFormField(
//           controller: controller,
//           decoration: InputDecoration(
//               border: InputBorder.none,
//               hintStyle: TextStyle(color: Colors.grey[600], fontSize: 14),
//               hintText: hint,
//               focusColor: Colors.grey,
//               fillColor: Colors.white),
//           validator: hint == "Confirm Password"
//               ? (val) {
//                   if (val != userPasswordcontroller.text) {
//                     return "Password doesn't match";
//                   } else if (val.length == 0) {
//                     return hint + " cannot be empty";
//                   } else {
//                     return null;
//                   }
//                 }
//               : (val) {
//                   if (val.length == 0) {
//                     return hint + " cannot be empty";
//                   } else {
//                     return null;
//                   }
//                 },
//           style: TextStyle(
//             fontFamily: "Poppins",
//           ),
//         ),
//       ),
//     );
//   }

//   Future<void> addUser() async {
//     setState(() {
//       _loading = true;
//     });
//     print(userEmailcontroller.text);
//     print(userPasswordcontroller.text);
//     try {
//       final User user = (await _auth.createUserWithEmailAndPassword(
//         email: userEmailcontroller.text,
//         password: userPasswordcontroller.text,
//       ))
//           .user;

//       print(1);

//       if (user != null) {
//         print(2);
//         print(2);
//         var prefs = await SharedPreferences.getInstance();
//         final userData = json.encode(
//           {
//             'userEmail': user.email,
//             'userUid': user.uid,
//             'password': userPasswordcontroller.text,
//           },
//         );
//         prefs.setString('insuranceAppUser', userData);

//         await FirebaseFirestore.instance.collection("Users List").add({
//           'UserEmail': userEmailcontroller.text,
//           'UserName': userNamecontroller.text,
//           'UserUserUid': user.uid,
//           'UserImage': imageUrl,
//           "UsersPassword": userPasswordcontroller.text,
//           'Blocked': false
//         });

//         print(4);
//         Navigator.pop(context);

//         setState(() {
//           _loading = false;
//         });
//       }
//     } catch (signUpError) {
//       setState(() {
//         _loading = false;
//       });

//       //Error handling

//       showDialog(
//           context: context,
//           child: AlertDialog(
//             shape: RoundedRectangleBorder(
//                 borderRadius: new BorderRadius.circular(18.0),
//                 side: BorderSide(
//                   color: Colors.red[400],
//                 )),
//             title: Text(signUpError.toString()),
//             actions: <Widget>[
//               FlatButton(
//                 child: Text(
//                   "OK",
//                   style: TextStyle(color: Colors.red[400]),
//                 ),
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//               )
//             ],
//           ));
//     }
//   }
// }
