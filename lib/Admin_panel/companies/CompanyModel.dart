import 'package:flutter/material.dart';

CompanyModel companyDetailFromList;

class CompanyModel {
  String companyLogo;
  String companyName;
  String companyEmail;
  String companyPassword;
  CompanyModel({
    @required this.companyEmail,
    @required this.companyLogo,
    @required this.companyName,
    @required this.companyPassword,
  });
}

String totalPolicies;
String policiesSold;
String approvedPolicies;
String numberOfUsers;
String rejectedPolicies;
