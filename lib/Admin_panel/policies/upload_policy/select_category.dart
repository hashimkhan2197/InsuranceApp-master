import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:isurance/Admin_panel/policies/upload_policy/upload_policy.dart';

class SelectCategory extends StatefulWidget {
  @override
  _SelectCategoryState createState() => _SelectCategoryState();
}

class _SelectCategoryState extends State<SelectCategory> {
  @override
  //categories
  bool businessinsurance = false;
  bool cashinsafeinsurance = false;
  bool covid19insurance = false;
  bool droneinsurance = false;
  bool foriegnworkerinsurance = false;
  bool homeownerinsurance = false;
  bool identityinsurance = false;
  bool longtermcareinsurance = false;
  bool loseofprofitinsurance = false;
  bool marineinsurance = false;
  bool medicalmalpracticeinsurance = false;
  bool motorbikeinsurance = false;
  bool naturaldisasterinsurance = false;
  bool propertyinsurance = false;
  bool rentinsurance = false;
  bool termlifeinsurance = false;
  bool travelinsurance = false;
  bool workmeninsurance = false;
  bool fireandgeneralinsurance = false;
  bool personalaccidentinsurance = false;
  bool thirdpartyinsurance = false;
  //subcategories
  bool individualtravelinsurance = true;
  bool familytravelinsurance = true;
  bool motorboatinsurance = true;
  bool picnicboatinsurance = true;
  bool jetskiinsurance = true;
  bool fishingboatinsurance = true;
  bool occupantofpropertyinsurance = true;
  bool ownerofpropertyinsurance = true;
  bool studentinsurance = true;
  bool traineeinsurance = true;
  bool maidinsurance = true;

  Widget build(BuildContext context) {
    void navigationPage() {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => UploadPolicy()));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select Category',
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
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: ListView(children: [
          InkWell(
            onTap: () {
              setState(() {
                personalaccidentinsurance = !personalaccidentinsurance;
              });
            },
            child: ListTile(
              title: Text(
                "Personal accident insurance",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              trailing: personalaccidentinsurance
                  ? Icon(Icons.arrow_drop_up)
                  : Icon(Icons.arrow_drop_down),
            ),
          ),
          personalaccidentinsurance
              ? Container(
                  color: Colors.grey[200],
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    children: [
                      ListTile(
                        onTap: () {
                          setState(() {
                            policyCategory = "Personal accident insurance";
                            policySubCategory = "Student insurance";
                            studentinsurance = false;
                            traineeinsurance = true;
                            maidinsurance = true;
                          });
                          var _duration = new Duration(seconds: 1);
                          return new Timer(_duration, navigationPage);
                        },
                        title: Text('Student insurance'),
                        trailing: studentinsurance
                            ? Text('')
                            : Icon(
                                Icons.check,
                                color: Colors.black,
                              ),
                      ),
                      ListTile(
                        onTap: () {
                          setState(() {
                            policyCategory = "Personal accident insurance";
                            policySubCategory = "Trainee insurance";
                            studentinsurance = true;
                            traineeinsurance = false;
                            maidinsurance = true;
                          });
                          var _duration = new Duration(seconds: 1);
                          return new Timer(_duration, navigationPage);
                        },
                        title: Text('Trainee insurance'),
                        trailing: traineeinsurance
                            ? Text('')
                            : Icon(
                                Icons.check,
                                color: Colors.black,
                              ),
                      ),
                      ListTile(
                        onTap: () {
                          setState(() {
                            policyCategory = "Personal accident insurance";
                            policySubCategory = "Maid or homeworkerinsurance";
                            studentinsurance = true;
                            traineeinsurance = true;
                            maidinsurance = false;
                          });
                          var _duration = new Duration(seconds: 1);
                          return new Timer(_duration, navigationPage);
                        },
                        title: Text('Maid or homeworkerinsurance'),
                        trailing: maidinsurance
                            ? Text('')
                            : Icon(
                                Icons.check,
                                color: Colors.black,
                              ),
                      ),
                    ],
                  ),
                )
              : Container(),
          InkWell(
            onTap: () {
              setState(() {
                fireandgeneralinsurance = !fireandgeneralinsurance;
              });
            },
            child: ListTile(
              title: Text(
                "Fire and general insurance",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              trailing: motorbikeinsurance
                  ? Icon(Icons.arrow_drop_up)
                  : Icon(Icons.arrow_drop_down),
            ),
          ),
          fireandgeneralinsurance
              ? Container(
                  color: Colors.grey[200],
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    children: [
                      ListTile(
                        onTap: () {
                          setState(() {
                            occupantofpropertyinsurance = false;
                            policyCategory = "Fire and general insurance";
                            policySubCategory =
                                "Occupant of property insurance";
                            var _duration = new Duration(seconds: 1);
                            return new Timer(_duration, navigationPage);
                          });
                        },
                        title: Text('Occupant of property insurance'),
                        trailing: occupantofpropertyinsurance
                            ? Text('')
                            : Icon(
                                Icons.check,
                                color: Colors.black,
                              ),
                      ),
                      ListTile(
                        onTap: () {
                          setState(() {
                            ownerofpropertyinsurance = false;
                            policyCategory = "Fire and general insurance";
                            policySubCategory = "Owner of property insurance";
                            var _duration = new Duration(seconds: 1);
                            return new Timer(_duration, navigationPage);
                          });
                        },
                        title: Text('Owner of property insurance'),
                        trailing: ownerofpropertyinsurance
                            ? Text('')
                            : Icon(
                                Icons.check,
                                color: Colors.black,
                              ),
                      ),
                    ],
                  ),
                )
              : Container(),
          InkWell(
            onTap: () {
              setState(() {
                travelinsurance = !travelinsurance;
              });
            },
            child: ListTile(
              title: Text(
                "Travel insurance",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              trailing: travelinsurance
                  ? Icon(Icons.arrow_drop_up)
                  : Icon(Icons.arrow_drop_down),
            ),
          ),
          travelinsurance
              ? Container(
                  color: Colors.grey[200],
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    children: [
                      ListTile(
                        onTap: () {
                          setState(() {
                            individualtravelinsurance = false;
                            policyCategory = "Travel insurance";
                            policySubCategory = "Individual travel insurance";
                            var _duration = new Duration(seconds: 1);
                            return new Timer(_duration, navigationPage);
                          });
                        },
                        title: Text('Individual travel insurance'),
                        trailing: individualtravelinsurance
                            ? Text('')
                            : Icon(
                                Icons.check,
                                color: Colors.black,
                              ),
                      ),
                      ListTile(
                        onTap: () {
                          setState(() {
                            familytravelinsurance = false;
                            policyCategory = "Travel insurance";
                            policySubCategory = "Family travel insurance";
                            var _duration = new Duration(seconds: 1);
                            return new Timer(_duration, navigationPage);
                          });
                        },
                        title: Text('Family travel insurance'),
                        trailing: familytravelinsurance
                            ? Text('')
                            : Icon(
                                Icons.check,
                                color: Colors.black,
                              ),
                      ),
                    ],
                  ),
                )
              : Container(),
          InkWell(
            onTap: () {
              setState(() {
                marineinsurance = !marineinsurance;
              });
            },
            child: ListTile(
              title: Text(
                "Marine insurance",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              trailing: marineinsurance
                  ? Icon(Icons.arrow_drop_up)
                  : Icon(Icons.arrow_drop_down),
            ),
          ),
          marineinsurance
              ? Container(
                  color: Colors.grey[200],
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    children: [
                      ListTile(
                        onTap: () {
                          setState(() {
                            motorboatinsurance = false;
                            policyCategory = "Marine insurance";
                            policySubCategory = 'Motor boat insurance';
                            var _duration = new Duration(seconds: 1);
                            return new Timer(_duration, navigationPage);
                          });
                        },
                        title: Text('Motor boat insurance'),
                        trailing: motorboatinsurance
                            ? Text('')
                            : Icon(
                                Icons.check,
                                color: Colors.black,
                              ),
                      ),
                      ListTile(
                        onTap: () {
                          setState(() {
                            picnicboatinsurance = false;
                            policyCategory = "Marine insurance";
                            policySubCategory = 'Picnic boat insurance';
                            var _duration = new Duration(seconds: 1);
                            return new Timer(_duration, navigationPage);
                          });
                        },
                        title: Text('Picnic boat insurance'),
                        trailing: picnicboatinsurance
                            ? Text('')
                            : Icon(
                                Icons.check,
                                color: Colors.black,
                              ),
                      ),
                      ListTile(
                        onTap: () {
                          setState(() {
                            jetskiinsurance = false;
                            policyCategory = "Marine insurance";
                            policySubCategory = 'Jet ski insurance';
                            var _duration = new Duration(seconds: 1);
                            return new Timer(_duration, navigationPage);
                          });
                        },
                        title: Text('Jet ski insurance'),
                        trailing: jetskiinsurance
                            ? Text('')
                            : Icon(
                                Icons.check,
                                color: Colors.black,
                              ),
                      ),
                      ListTile(
                        onTap: () {
                          setState(() {
                            fishingboatinsurance = false;
                            policyCategory = "Marine insurance";
                            policySubCategory = 'Fishing boat insurance';
                            var _duration = new Duration(seconds: 1);
                            return new Timer(_duration, navigationPage);
                          });
                        },
                        title: Text('Fishing boat insurance'),
                        trailing: fishingboatinsurance
                            ? Text('')
                            : Icon(
                                Icons.check,
                                color: Colors.black,
                              ),
                      ),
                    ],
                  ),
                )
              : Container(),
          InkWell(
            onTap: () {
              // setState(() {
              //   businessinsurance = !businessinsurance;
              // });
            },
            child: ListTile(
              title: Text(
                "Business Insurance",
                style: TextStyle(color: Colors.grey),
              ),
              // trailing: businessinsurance
              //     ? Icon(Icons.arrow_drop_up)
              //     : Icon(Icons.arrow_drop_down),
            ),
          ),
          businessinsurance
              ? Container(
                  color: Colors.grey[200],
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    children: [
                      ListTile(
                        onTap: () {
                          setState(() {
                            individualtravelinsurance =
                                !individualtravelinsurance;
                          });
                        },
                        title: Text('Individual travel insurance'),
                        trailing: individualtravelinsurance
                            ? Text('')
                            : Icon(
                                Icons.check,
                                color: Colors.black,
                              ),
                      ),
                    ],
                  ),
                )
              : Container(),
          InkWell(
            onTap: () {
              // setState(() {
              //   cashinsafeinsurance = !cashinsafeinsurance;
              // });
            },
            child: ListTile(
              title: Text(
                "Cash in safe insurance",
                style: TextStyle(color: Colors.grey),
              ),
              // trailing: cashinsafeinsurance
              //     ? Icon(Icons.arrow_drop_up)
              //     : Icon(Icons.arrow_drop_down),
            ),
          ),
          cashinsafeinsurance
              ? Container(
                  color: Colors.grey[200],
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    children: [
                      ListTile(
                        onTap: () {
                          setState(() {
                            individualtravelinsurance =
                                !individualtravelinsurance;
                          });
                        },
                        title: Text('Individual travel insurance'),
                        trailing: individualtravelinsurance
                            ? Text('')
                            : Icon(
                                Icons.check,
                                color: Colors.black,
                              ),
                      ),
                    ],
                  ),
                )
              : Container(),
          InkWell(
            onTap: () {
              // setState(() {
              //   covid19insurance = !covid19insurance;
              // });
            },
            child: ListTile(
              title: Text(
                "Covid-19 insurance",
                style: TextStyle(color: Colors.grey),
              ),
              // trailing: cashinsafeinsurance
              //     ? Icon(Icons.arrow_drop_up)
              //     : Icon(Icons.arrow_drop_down),
            ),
          ),
          covid19insurance
              ? Container(
                  color: Colors.grey[200],
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    children: [
                      ListTile(
                        onTap: () {
                          setState(() {
                            individualtravelinsurance =
                                !individualtravelinsurance;
                          });
                        },
                        title: Text('Individual travel insurance'),
                        trailing: individualtravelinsurance
                            ? Text('')
                            : Icon(
                                Icons.check,
                                color: Colors.black,
                              ),
                      ),
                    ],
                  ),
                )
              : Container(),
          InkWell(
            onTap: () {
              // setState(() {
              //   droneinsurance = !droneinsurance;
              // });
            },
            child: ListTile(
              title: Text(
                "Drone insurance",
                style: TextStyle(color: Colors.grey),
              ),
              // trailing: droneinsurance
              //     ? Icon(Icons.arrow_drop_up)
              //     : Icon(Icons.arrow_drop_down),
            ),
          ),
          droneinsurance
              ? Container(
                  color: Colors.grey[200],
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    children: [
                      ListTile(
                        onTap: () {
                          setState(() {
                            individualtravelinsurance =
                                !individualtravelinsurance;
                          });
                        },
                        title: Text('Individual travel insurance'),
                        trailing: individualtravelinsurance
                            ? Text('')
                            : Icon(
                                Icons.check,
                                color: Colors.black,
                              ),
                      ),
                    ],
                  ),
                )
              : Container(),
          InkWell(
            onTap: () {
              // setState(() {
              //   foriegnworkerinsurance = !foriegnworkerinsurance;
              // });
            },
            child: ListTile(
              title: Text(
                "Foriegn worker insurance",
                style: TextStyle(color: Colors.grey),
              ),
              // trailing: foriegnworkerinsurance
              //     ? Icon(Icons.arrow_drop_up)
              //     : Icon(Icons.arrow_drop_down),
            ),
          ),
          foriegnworkerinsurance
              ? Container(
                  color: Colors.grey[200],
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    children: [
                      ListTile(
                        onTap: () {
                          setState(() {
                            individualtravelinsurance =
                                !individualtravelinsurance;
                          });
                        },
                        title: Text('Individual travel insurance'),
                        trailing: individualtravelinsurance
                            ? Text('')
                            : Icon(
                                Icons.check,
                                color: Colors.black,
                              ),
                      ),
                    ],
                  ),
                )
              : Container(),
          InkWell(
            onTap: () {
              // setState(() {
              //   homeownerinsurance = !homeownerinsurance;
              // });
            },
            child: ListTile(
              title: Text(
                "Home owner insurance",
                style: TextStyle(color: Colors.grey),
              ),
              // trailing: homeownerinsurance
              //     ? Icon(Icons.arrow_drop_up)
              //     : Icon(Icons.arrow_drop_down),
            ),
          ),
          homeownerinsurance
              ? Container(
                  color: Colors.grey[200],
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    children: [
                      ListTile(
                        onTap: () {
                          setState(() {
                            individualtravelinsurance =
                                !individualtravelinsurance;
                          });
                        },
                        title: Text(
                          'Individual travel insurance',
                          style: TextStyle(color: Colors.grey),
                        ),
                        trailing: individualtravelinsurance
                            ? Text('')
                            : Icon(
                                Icons.check,
                                color: Colors.black,
                              ),
                      ),
                    ],
                  ),
                )
              : Container(),
          InkWell(
            onTap: () {
              // setState(() {
              //   identityinsurance = !identityinsurance;
              // });
            },
            child: ListTile(
              title: Text(
                "Identity insurance",
                style: TextStyle(color: Colors.grey),
              ),
              // trailing: identityinsurance
              //     ? Icon(Icons.arrow_drop_up)
              //     : Icon(Icons.arrow_drop_down),
            ),
          ),
          identityinsurance
              ? Container(
                  color: Colors.grey[200],
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    children: [
                      ListTile(
                        onTap: () {
                          setState(() {
                            individualtravelinsurance =
                                !individualtravelinsurance;
                          });
                        },
                        title: Text('Individual travel insurance'),
                        trailing: individualtravelinsurance
                            ? Text('')
                            : Icon(
                                Icons.check,
                                color: Colors.black,
                              ),
                      ),
                    ],
                  ),
                )
              : Container(),
          InkWell(
            onTap: () {
              // setState(() {
              //   longtermcareinsurance = !longtermcareinsurance;
              // });
            },
            child: ListTile(
              title: Text(
                "long term care insurance",
                style: TextStyle(color: Colors.grey),
              ),
              // trailing: longtermcareinsurance
              //     ? Icon(Icons.arrow_drop_up)
              //     : Icon(Icons.arrow_drop_down),
            ),
          ),
          longtermcareinsurance
              ? Container(
                  color: Colors.grey[200],
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    children: [
                      ListTile(
                        onTap: () {
                          setState(() {
                            individualtravelinsurance =
                                !individualtravelinsurance;
                          });
                        },
                        title: Text('Individual travel insurance'),
                        trailing: individualtravelinsurance
                            ? Text('')
                            : Icon(
                                Icons.check,
                                color: Colors.black,
                              ),
                      ),
                    ],
                  ),
                )
              : Container(),
          InkWell(
            onTap: () {
              // setState(() {
              //   loseofprofitinsurance = !loseofprofitinsurance;
              // });
            },
            child: ListTile(
              title: Text(
                "Loss of profit insurance",
                style: TextStyle(color: Colors.grey),
              ),
              // trailing: loseofprofitinsurance
              //     ? Icon(Icons.arrow_drop_up)
              //     : Icon(Icons.arrow_drop_down),
            ),
          ),
          loseofprofitinsurance
              ? Container(
                  color: Colors.grey[200],
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    children: [
                      ListTile(
                        onTap: () {
                          setState(() {
                            individualtravelinsurance =
                                !individualtravelinsurance;
                          });
                        },
                        title: Text('Individual travel insurance'),
                        trailing: individualtravelinsurance
                            ? Text('')
                            : Icon(
                                Icons.check,
                                color: Colors.black,
                              ),
                      ),
                    ],
                  ),
                )
              : Container(),
          InkWell(
            onTap: () {
              // setState(() {
              //   medicalmalpracticeinsurance = !medicalmalpracticeinsurance;
              // });
            },
            child: ListTile(
              title: Text(
                "Medical malpractice insurance",
                style: TextStyle(color: Colors.grey),
              ),
              // trailing: medicalmalpracticeinsurance
              //     ? Icon(Icons.arrow_drop_up)
              //     : Icon(Icons.arrow_drop_down),
            ),
          ),
          medicalmalpracticeinsurance
              ? Container(
                  color: Colors.grey[200],
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    children: [
                      ListTile(
                        onTap: () {
                          setState(() {
                            individualtravelinsurance =
                                !individualtravelinsurance;
                          });
                        },
                        title: Text('Individual travel insurance'),
                        trailing: individualtravelinsurance
                            ? Text('')
                            : Icon(
                                Icons.check,
                                color: Colors.black,
                              ),
                      ),
                    ],
                  ),
                )
              : Container(),
          InkWell(
            onTap: () {
              // setState(() {
              //   motorbikeinsurance = !motorbikeinsurance;
              // });
            },
            child: ListTile(
              title: Text(
                "Motor bike insurance",
                style: TextStyle(color: Colors.grey),
              ),
              // trailing: motorbikeinsurance
              //     ? Icon(Icons.arrow_drop_up)
              //     : Icon(Icons.arrow_drop_down),
            ),
          ),
          motorbikeinsurance
              ? Container(
                  color: Colors.grey[200],
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    children: [
                      ListTile(
                        onTap: () {
                          setState(() {
                            individualtravelinsurance =
                                !individualtravelinsurance;
                          });
                        },
                        title: Text('Individual travel insurance'),
                        trailing: individualtravelinsurance
                            ? Text('')
                            : Icon(
                                Icons.check,
                                color: Colors.black,
                              ),
                      ),
                    ],
                  ),
                )
              : Container(),
          InkWell(
            onTap: () {
              // setState(() {
              //   naturaldisasterinsurance = !naturaldisasterinsurance;
              // });
            },
            child: ListTile(
              title: Text(
                "Natural disaster insurance",
                style: TextStyle(color: Colors.grey),
              ),
              // trailing: naturaldisasterinsurance
              //     ? Icon(Icons.arrow_drop_up)
              //     : Icon(Icons.arrow_drop_down),
            ),
          ),
          naturaldisasterinsurance
              ? Container(
                  color: Colors.grey[200],
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    children: [
                      ListTile(
                        onTap: () {
                          setState(() {
                            individualtravelinsurance =
                                !individualtravelinsurance;
                          });
                        },
                        title: Text('Individual travel insurance'),
                        trailing: individualtravelinsurance
                            ? Text('')
                            : Icon(
                                Icons.check,
                                color: Colors.black,
                              ),
                      ),
                    ],
                  ),
                )
              : Container(),
          InkWell(
            onTap: () {
              // setState(() {
              //   propertyinsurance = !propertyinsurance;
              // });
            },
            child: ListTile(
              title: Text(
                "Property insurance",
                style: TextStyle(color: Colors.grey),
              ),
              // trailing: propertyinsurance
              //     ? Icon(Icons.arrow_drop_up)
              //     : Icon(Icons.arrow_drop_down),
            ),
          ),
          propertyinsurance
              ? Container(
                  color: Colors.grey[200],
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    children: [
                      ListTile(
                        onTap: () {
                          setState(() {
                            individualtravelinsurance =
                                !individualtravelinsurance;
                          });
                        },
                        title: Text('Individual travel insurance'),
                        trailing: individualtravelinsurance
                            ? Text('')
                            : Icon(
                                Icons.check,
                                color: Colors.black,
                              ),
                      ),
                    ],
                  ),
                )
              : Container(),
          InkWell(
            onTap: () {
              // setState(() {
              //   rentinsurance = !rentinsurance;
              // });
            },
            child: ListTile(
              title: Text(
                "Rent insurance",
                style: TextStyle(color: Colors.grey),
              ),
              // trailing: rentinsurance
              //     ? Icon(Icons.arrow_drop_up)
              //     : Icon(Icons.arrow_drop_down),
            ),
          ),
          rentinsurance
              ? Container(
                  color: Colors.grey[200],
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    children: [
                      ListTile(
                        onTap: () {
                          setState(() {
                            individualtravelinsurance =
                                !individualtravelinsurance;
                          });
                        },
                        title: Text('Individual travel insurance'),
                        trailing: individualtravelinsurance
                            ? Text('')
                            : Icon(
                                Icons.check,
                                color: Colors.black,
                              ),
                      ),
                    ],
                  ),
                )
              : Container(),
          InkWell(
            onTap: () {
              // setState(() {
              //   termlifeinsurance = !termlifeinsurance;
              // });
            },
            child: ListTile(
              title: Text(
                "Term life insurance",
                style: TextStyle(color: Colors.grey),
              ),
              // trailing: termlifeinsurance
              //     ? Icon(Icons.arrow_drop_up)
              //     : Icon(Icons.arrow_drop_down),
            ),
          ),
          termlifeinsurance
              ? Container(
                  color: Colors.grey[200],
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    children: [
                      ListTile(
                        onTap: () {
                          setState(() {
                            individualtravelinsurance =
                                !individualtravelinsurance;
                          });
                        },
                        title: Text('Individual travel insurance'),
                        trailing: individualtravelinsurance
                            ? Text('')
                            : Icon(
                                Icons.check,
                                color: Colors.black,
                              ),
                      ),
                    ],
                  ),
                )
              : Container(),
          InkWell(
            onTap: () {
              // setState(() {
              //   workmeninsurance = !workmeninsurance;
              // });
            },
            child: ListTile(
              title: Text(
                "Workman's insurance",
                style: TextStyle(color: Colors.grey),
              ),
              // trailing: workmeninsurance
              //     ? Icon(Icons.arrow_drop_up)
              //     : Icon(Icons.arrow_drop_down),
            ),
          ),
          workmeninsurance
              ? Container(
                  color: Colors.grey[200],
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    children: [
                      ListTile(
                        onTap: () {
                          setState(() {
                            individualtravelinsurance =
                                !individualtravelinsurance;
                          });
                        },
                        title: Text('Individual travel insurance'),
                        trailing: individualtravelinsurance
                            ? Text('')
                            : Icon(
                                Icons.check,
                                color: Colors.black,
                              ),
                      ),
                    ],
                  ),
                )
              : Container(),
          InkWell(
            onTap: () {
              // setState(() {
              //   thirdpartyinsurance = !thirdpartyinsurance;
              // });
            },
            child: ListTile(
              title: Text(
                "Third party insurance",
                style: TextStyle(color: Colors.grey),
              ),
              // trailing: thirdpartyinsurance
              //     ? Icon(Icons.arrow_drop_up)
              //     : Icon(Icons.arrow_drop_down),
            ),
          ),
          thirdpartyinsurance
              ? Container(
                  color: Colors.grey[200],
                  height: 150,
                  width: MediaQuery.of(context).size.width,
                  child: ListView(
                    children: [
                      ListTile(
                        onTap: () {
                          setState(() {
                            individualtravelinsurance =
                                !individualtravelinsurance;
                          });
                        },
                        title: Text('Individual travel insurance'),
                        trailing: individualtravelinsurance
                            ? Text('')
                            : Icon(
                                Icons.check,
                                color: Colors.black,
                              ),
                      ),
                    ],
                  ),
                )
              : Container(),
        ]),
      ),
    );
  }
}
