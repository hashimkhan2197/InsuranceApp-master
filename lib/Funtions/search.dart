import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:isurance/Admin_panel/policies/PolicyModel.dart';
import 'package:isurance/menu/searchScreen.dart';

List<PolicyDetails> searchedUsers = [];

class DataSearch extends SearchDelegate<String> {
  DataSearch();
  @override
  List<Widget> buildActions(BuildContext context) {
    // actions for appbar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon on the left of appbar
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Search(),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<PolicyDetails> aa = [];
    if (query != "") {
      searchedpolicyDetailsFromList.forEach((i) {
        // ignore: unnecessary_statements

        if (i.policytiitle.startsWith(query.toUpperCase()) ||
            i.policytiitle.startsWith(query)) aa.add(i);
      });
    }

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onLongPress: () {
          query = aa[index].policytiitle.toString();
          try {
            double newquery = double.parse(query);
            print(newquery);
            setsearched(query).then((_) {
              showResults(context);
            });
          } catch (e) {
            print("EROR");
            setsearched(query).then((_) {
              showResults(context);
            });
          }
        },
        onTap: () {
          query = aa[index].policytiitle.toString();
          try {
            double newquery = double.parse(query);
            print(newquery);
            setsearched(query).then((_) {
              showResults(context);
            });
          } catch (e) {
            setsearched(query).then((_) {
              showResults(context);
            });
          }
        },
        // leading: Icon(Icons.search),
        title: GestureDetector(
          onTap: () {
            query = aa[index].policytiitle.toString();

            try {
              setsearched(query).then((_) {
                showResults(context);
              });
            } catch (e) {
              print("EROR");
              setsearched(query).then((_) {
                showResults(context);
              });
            }
          },
          child: ListTile(
            leading: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(aa[index].policyImage),
                      fit: BoxFit.cover)),
            ),
            title: RichText(
              text: TextSpan(
                  text: aa[index].policytiitle.substring(0, query.length),
                  style: TextStyle(
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: aa[index].policytiitle.substring(query.length),
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    )
                  ]),
            ),
          ),
        ),
      ),
      itemCount: aa.length,
    );
  }
}

// setsearched(BuildContext context,String query) {
//   //  shopItems = [];
//   print("hii");
//   if (query != "") {
//     shopItems.forEach((i) {
//       // ignore: unnecessary_statements
//      for(int j=0;j<shopItems.length;j++)
//       print(shopItems[j].itemName);

//       if (i.itemName.startsWith(query.toUpperCase()) == false ||
//           i.itemName.startsWith(query) == false) {
//         shopItems..remove(i);

//       }

//       for(int j=0;j<shopItems.length;j++)
//       print(shopItems[j].itemName);

//       // if (i.phonenumber.startsWith(query)) aa.add(i.phonenumber);
//     });

//     Navigator.pushNamed(context, SearchedHomePage.routename);

//   }
// }

Future<void> setsearched(String query) async {
  //  shopItems = [];

  int len;
  await Firestore.instance
      .collection("Policies List")
      .where("PolicyTittle", isEqualTo: query)

      // ignore: deprecated_member_use
      .getDocuments()
      .then((policyDetail) => {
            len = policyDetail.documents.length,
            if (len > 0)
              {
                searchedUsers.add(PolicyDetails(
                    policyCategory: policyDetail.documents[0]["PolicyCategory"],
                    policyCompnay: policyDetail.documents[0]["PolicyCompany"],
                    policyCountry: policyDetail.documents[0]["PolicyCountry"],
                    policyDocID: policyDetail.documents[0].documentID,
                    policyDescription: policyDetail.documents[0]
                        ["PolicyDescription"],
                    policyImage: policyDetail.documents[0]["PolicyImage"],
                    policyPeriod: policyDetail.documents[0]["PolicyPeriod"],
                    policySubCategory: policyDetail.documents[0]
                        ["PolicySubCategory"],
                    policyTerms: policyDetail.documents[0]
                        ["TermsAndConditions"],
                    policyprice: policyDetail.documents[0]["PolicyPrice"],
                    policytiitle: policyDetail.documents[0]["PolicyTittle"],
                    policyCompanyImage: policyDetail.documents[0]
                        ["PolicyCompanyImage"])),
              },
          });
}
