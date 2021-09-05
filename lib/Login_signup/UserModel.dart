import 'package:flutter/material.dart';

UserModel userDetails;

class UserModel {
  String userImage;
  String username;
  String userEmail;
  String userUid;
  String userNumber;
  String userDocId;

  UserModel({
    @required this.userEmail,
    @required this.userImage,
    @required this.userNumber,
    @required this.username,
    @required this.userUid,
    @required this.userDocId,
  });
}
