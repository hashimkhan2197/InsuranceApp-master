import 'package:flutter/material.dart';

PolicyDetails policyDetailsFromList;

List<PolicyDetails> searchedpolicyDetailsFromList = [];

class PolicyDetails {
  String policyImage;
  String policytiitle;
  String policyCategory;
  String policySubCategory;
  String policyCompnay;
  String policyprice;
  String policyPeriod;
  String policyDocID;
  String policyCountry;
  String policyDescription;
  String policyTerms;
  String policyCompanyImage;

  PolicyDetails({
    @required this.policyCategory,
    @required this.policyCompnay,
    @required this.policyCountry,
    @required this.policyDocID,
    @required this.policyDescription,
    @required this.policyImage,
    @required this.policyPeriod,
    @required this.policySubCategory,
    @required this.policyTerms,
    @required this.policyprice,
    @required this.policytiitle,
    @required this.policyCompanyImage,
  });
}
