import 'package:flutter/material.dart';
import 'package:isurance/menu/categories.dart';
import 'package:isurance/menu/home.dart';
import 'package:isurance/menu/profile/profile.dart';
import 'package:isurance/menu/searchScreen.dart';
import 'package:isurance/menu/setting/setting.dart';

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  //navbar
  int pageIndex = 0;
  bool animate = true;
  Home _home;
  Search _search;
  Categories _categories;
  Setting _setting;
  Profile _profile;
  Widget _showPage;
  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return _home;

      case 1:
        return _search;

      case 2:
        return _categories;

      case 3:
        return _setting;

      case 4:
        return _profile;

      default:
        return new Container(
            child: new Center(
          child: new Text(
            'No Page found by page thrower',
            style: new TextStyle(fontSize: 30),
          ),
        ));
    }
  }

  @override
  void initState() {
    super.initState();
    _home = Home();
    _search = Search();
    _categories = Categories();
    _setting = Setting();
    _profile = Profile();

    pageIndex = 0;
    _showPage = _pageChooser(pageIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 25,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 25,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.category,
                size: 25,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                size: 25,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                size: 25,
              ),
              label: '',
            ),
          ],
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: pageIndex,
          selectedItemColor: Colors.cyanAccent[700],
          onTap: (int tappedIndex) {
            setState(() {
              animate = true;
              pageIndex = tappedIndex;
              _showPage = _pageChooser(tappedIndex);
            });
          }),
      body: Container(
        color: Colors.white,
        child: Center(
          child: _showPage,
        ),
      ),
    );
  }
}

//     Scaffold(
//       bottomNavigationBar: CurvedNavigationBar(
//         index: pageIndex,
//         items: <Widget>[
//           Icon(
//             Icons.home,
//             size: 18,
//             color: Colors.black,
//           ),
//           Icon(
//             Icons.search,
//             size: 18,
//             color: Colors.black,
//           ),
//           Icon(
//             Icons.settings,
//             size: 18,
//             color: Colors.black,
//           ),
//           Icon(
//             Icons.person,
//             size: 18,
//             color: Colors.black,
//           ),
//         ],
//         color: Colors.white,
//         height: 45,
//         buttonBackgroundColor: Colors.cyanAccent[700],
//         backgroundColor: Colors.cyanAccent[700],
//         animationCurve: Curves.linear,
//         animationDuration: Duration(milliseconds: 100),
//         onTap: (int tappedIndex) {
//           setState(() {
//             animate = true;
//             pageIndex = tappedIndex;
//             _showPage = _pageChooser(tappedIndex);
//           });
//         },
//       ),
//       body: Container(
//         color: Colors.white,
//         child: Center(
//           child: _showPage,
//         ),
//       ),
//     );
//   }
// }
